import 'package:flutter/material.dart';
import 'package:todo_list_application/widget/navigation_menu.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            'Welcome to List It Down',
          ),
          const Text(
            'Fill out the information below in order to access your account',
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavigationMenu()),
                );
              },
              child: const Text('Sign In'),
            ),
          )
        ],
      ),
    );
  }
}
