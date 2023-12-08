// ignore_for_file: unused_import, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_application/authentication/signup.dart';
import 'package:todo_list_application/main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final _keyForm = GlobalKey<FormState>();

class _LoginState extends State<Login> {
  // intialize strings
  String email = "";
  String password = "";

  // initialize text controller

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // initialize focus node
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

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
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  // Display Show Error Message
  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // first container
          const Text(
            'List It Down',
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 69, 69, 69)),
          ),

          // second container
          Container(
            height: 500,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white,
                // border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(60, 0, 0, 0),
                    blurRadius: 4,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'WELCOME',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 69, 69, 69)),
                  ),
                  const Text(
                    'Fill out the information below in order to access your account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 69, 69, 69)),
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
                        filled: true,
                        fillColor: const Color.fromARGB(255, 241, 244, 248),

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
                        filled: true,
                        fillColor: const Color.fromARGB(255, 241, 244, 248),
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
                    height: 40,
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        // call check login method
                        signIn();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 91, 89, 247),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 14),
                      ),
                    ),
                  ),

                  const Text(
                    'Or Sign in with',
                    style: TextStyle(
                      color: Color.fromARGB(255, 87, 99, 108),
                    ),
                  ),

                  // Sign In with Google
                  SizedBox(
                    height: 35,
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
                          SizedBox(
                            width: 5,
                          ),
                          const Text('Continue with Google'),
                        ],
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an Account?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 87, 99, 108),
                        ),
                      ),
                      TextButton(
                          onPressed: () => {
                                // redirect to SignUp1
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()),
                                )
                              },
                          child: Text('Sign Up Here'))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // Sign In Method
  Future signIn() async {
    // show circular progress indicator
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());

      showErrorMessage('Successfully Log In');
    } on FirebaseAuthException catch (e) {
      String errorMessage = e.code.toString();
      showErrorMessage(errorMessage);
    }
    // Navigator.of(context) not working!
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
