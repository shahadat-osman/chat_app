import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/auth/auth_service.dart';
import '../pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(BuildContext context) async {
    final auth = AuthService();
    await auth.signOut();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();
    final User? currentUser = authService.getCurrentUser();
    final String userEmail = currentUser?.email ?? 'No Email';

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.message,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: 40,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    userEmail,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Home list tile
          ListTile(
            title: const Text("H O M E"),
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          // Settings list tile
          ListTile(
            title: const Text("S E T T I N G S"),
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.fromLTRB(6.0, 0, 16.0, 24.0),
            child: ListTile(
              title: const Text("L O G O U T"),
              leading: const Icon(Icons.logout),
              onTap: () => logout(context),
            ),
          ),
        ],
      ),
    );
  }
}
