// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_application/authentication/login/authenticator.dart';
import 'package:todo_list_application/authentication/login/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

final _keyForm = GlobalKey<FormState>();

class _SignUpState extends State<SignUp> {
  // initialize strings
  String userName = "";
  String email = "";
  String password = "";
  String confirmPass = "";

  // text controller
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  // focus node
  final _nameFocusNode = FocusNode();
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

  // Display Error Message
  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // Register User
  Future registerUser(email, password) async {
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
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Navigator.pop(context);

        // Sign out the user after successful account creation
        FirebaseAuth.instance.signOut();

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Authenticator()));
      });
      showErrorMessage("Sign In Successfully");

      setState(() {
        errormessage = "";
      });
    } on FirebaseAuthException catch (e) {
      String errorMessage = e.message.toString();
      showErrorMessage(errorMessage);

      setState(() {
        errormessage = e.message.toString();
      });
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        key: _keyForm,
        children: [
          const Text(
            'List It Down',
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 69, 69, 69)),
          ),
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
                    'Create An Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 69, 69, 69)),
                  ),
                  const Text(
                    "Let's get started by filling out the form below.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 69, 69, 69)),
                  ),
                  // Name
                  Container(
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Name';
                        }
                        return null;
                      },
                      controller: _nameController,
                      focusNode: _nameFocusNode,
                      autofocus: true,
                      obscureText: false,
                      // Input Decoration
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Name',
                        filled: true,
                        fillColor: const Color.fromARGB(255, 241, 244, 248),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _nameController.clear();
                            },
                            icon: const Icon(Icons.clear)),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),

                  //Email
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
                        // Input Decoration
                        border: const OutlineInputBorder(),
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
                        // Input Decoration
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

                  // Sign Up Button
                  SizedBox(
                    height: 40,
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        // call register user method
                        registerUser(_emailController.text.trim(),
                            _passwordController.text.trim());
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 91, 89, 247),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 14),
                      ),
                    ),
                  ),

                  //IF INCLUDED JUST UNCOMMENT

                  // const Text(
                  //   'Or Sign in with',
                  //   style: TextStyle(
                  //     color: Color.fromARGB(255, 87, 99, 108),
                  //   ),
                  // ),

                  // // Sign In with Google
                  // SizedBox(
                  //   height: 35,
                  //   width: double.maxFinite,
                  //   child: ElevatedButton(
                  //     onPressed: () {},
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         ClipOval(
                  //           child: Image.network(
                  //             'https://cdn-teams-slug.flaticon.com/google.jpg', // Replace with the path to your Google logo image asset
                  //             height: 24,
                  //             width: 24,
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: 5,
                  //         ),
                  //         const Text('Continue with Google'),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
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
                                      builder: (context) => const Login()),
                                )
                              },
                          child: Text('Sign In Here'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
