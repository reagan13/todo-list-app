// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final _keyForm = GlobalKey<FormState>();

class _LoginState extends State<Login> {
  String email = "";
  String password = "";

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  bool _isObscure = true;
  late String errormessage;
  late bool isError;

  @override
  void initState() {
    errormessage = "This is an error";
    isError = false;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void showErrorMessage(String message) {
    // Display the error message to the user
    // You can use a SnackBar, AlertDialog, or any other UI element
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }

  Future checklogin(username, password) async {
    showDialog(
      context: context,
      useRootNavigator: false,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: username, password: password);
      setState(() {
        errormessage = "Invalid";
      });
    } on FirebaseAuthException catch (e) {
      String errorMessage;

      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'The email address is not valid.';
      } else {
        errorMessage = 'An error occurred: ${e.message}';
      }
      showErrorMessage(errorMessage);

      setState(() {
        errormessage = e.message.toString();
      });
      // Show the error message in the UI (add this if it's not present in your code)
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // first container
          const Text(
            'Welcome to List It Down',
          ),

          // second container
          Container(
            height: 400,
            margin: const EdgeInsets.all(29),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white24,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Fill out the information below in order to access your account',
                ),

                // Email
                Container(
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Email';
                      }
                      return null;
                    },
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      // decoration box
                      labelText: 'Email',

                      suffixIcon: IconButton(
                          onPressed: () {
                            _emailController.clear();
                          },
                          icon: const Icon(Icons.clear)),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                // Password
                Container(
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Password';
                      }

                      return null;
                    },
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    autofocus: true,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      alignLabelWithHint: false,
                      border: const OutlineInputBorder(),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        focusNode: FocusNode(skipTraversal: true),
                        child: Icon(
                          _isObscure
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: const Color(0xFF57636C),
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),

                // Sign In Button
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {
                      checklogin(
                          _emailController.text, _passwordController.text);
                    },
                    child: const Text('Sign In'),
                  ),
                ),
                // Display Error Message

                const Text(
                  'Or Sign in with',
                ),

                // Sign In with Google
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipOval(
                          child: Image.network(
                            'https://cdn-teams-slug.flaticon.com/google.jpg', // Replace with the path to your Google logo image asset
                            height: 24,
                            width: 24,
                          ),
                        ),
                        const Text('Continue with Google'),
                      ],
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an Account?"),
                    TextButton(onPressed: () => {}, child: Text('Sign Up Here'))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
