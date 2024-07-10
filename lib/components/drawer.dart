import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/pages/settings_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    void logout() {
      final auth = AuthService();
      auth.signOut();
    }

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.message,
                    color: Theme.of(context).colorScheme.primary,
                    size: 40,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 25.0,
                ),
                child: ListTile(
                  title: const Text(
                    "H O M E",
                  ),
                  leading: const Icon(
                    Icons.home_rounded,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 25.0,
                ),
                child: ListTile(
                  title: const Text(
                    "S E T T I N G S",
                  ),
                  leading: const Icon(
                    Icons.settings_rounded,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
              bottom: 20.0,
            ),
            child: ListTile(
              title: const Text(
                "L O G O U T",
              ),
              leading: const Icon(
                Icons.logout_rounded,
              ),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
