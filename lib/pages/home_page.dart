import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    void logout() {
      final authService = AuthService();
      authService.signOut();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: logout,
            icon: const Icon(
              Icons.logout_rounded,
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
    );
  }
}
