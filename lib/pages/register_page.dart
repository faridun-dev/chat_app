import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/button.dart';
import 'package:chat_app/components/textfield.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignUpPage extends StatelessWidget {
  void Function()? onTap;
  SignUpPage({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmController = TextEditingController();

    void register() {
      final authService = AuthService();

      if (passwordController.text == confirmController.text) {
        try {
          authService.registerWithEmailPassword(
            emailController.text,
            passwordController.text,
          );
        } catch (e) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  e.toString(),
                ),
              );
            },
          );
        }
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text(
                "Passwords don't match",
              ),
            );
          },
        );
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle_rounded,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "Let's create one account for you!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            MyTextField(
              hintText: "Email",
              obsecureText: false,
              controller: emailController,
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              hintText: "Password",
              obsecureText: true,
              controller: passwordController,
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              hintText: "Confirm password",
              obsecureText: true,
              controller: confirmController,
            ),
            const SizedBox(
              height: 25.0,
            ),
            MyButton(
              text: "Register",
              onTap: register,
            ),
            const SizedBox(
              height: 25.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already registered? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
