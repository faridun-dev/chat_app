import 'package:chat_app/components/user_tile.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/components/drawer.dart';
import 'package:chat_app/services/chat_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final chatService = ChatService();
    final authService = AuthService();

    void logout() {
      authService.signOut();
    }

    Widget buildUserListItem(
        Map<String, dynamic> userData, BuildContext context) {
      if (userData["email"] != authService.getCurrentUser()!.email) {
        return UserTile(
          text: userData["email"],
          onTap: () {},
        );
      } else {
        return Container();
      }
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
      body: StreamBuilder(
        stream: chatService.getUserStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          }

          return ListView(
            children: snapshot.data!
                .map<Widget>(
                  (userData) => buildUserListItem(
                    userData,
                    context,
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
