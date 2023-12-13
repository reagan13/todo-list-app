// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_application/authentication/login.dart';
import 'package:todo_list_application/main.dart';
import 'package:todo_list_application/services/firestoreService.dart';

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
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  // focus node
  final _firstNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  bool _isObscure = true;
  bool _isObscure1 = true;

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
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
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
          SingleChildScrollView(
            child: Container(
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
                padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
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
                    //  First Name
                    Container(
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter First Name';
                          }
                          return null;
                        },
                        controller: _firstNameController,
                        focusNode: _firstNameFocusNode,
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
                                _firstNameController.clear();
                              },
                              icon: const Icon(Icons.clear)),
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),

                    Container(
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Last Name';
                          }
                          return null;
                        },
                        controller: _lastNameController,
                        focusNode: _lastNameFocusNode,
                        autofocus: true,
                        obscureText: false,
                        // Input Decoration
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Last Name',
                          filled: true,
                          fillColor: const Color.fromARGB(255, 241, 244, 248),
                          suffixIcon: IconButton(
                              onPressed: () {
                                _lastNameController.clear();
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

                    // Password
                    Container(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please re-enter your Password';
                          }

                          return null;
                        },
                        controller: _confirmPasswordController,
                        focusNode: _confirmPasswordFocusNode,
                        autofocus: true,
                        obscureText: _isObscure1,
                        decoration: InputDecoration(
                          // Input Decoration
                          labelText: 'Confirm Password',
                          filled: true,
                          fillColor: const Color.fromARGB(255, 241, 244, 248),
                          alignLabelWithHint: false,
                          border: const OutlineInputBorder(),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                _isObscure1 = !_isObscure1;
                              });
                            },
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              _isObscure1
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
                          signUp();
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
                                  Navigator.pushReplacement(
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
          ),
        ],
      ),
    );
  }

  // Sign Up
  Future signUp() async {
    if (passwordConfirmed()) {
      try {
        // show circular progress indicator
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => Center(child: CircularProgressIndicator()));
        // Create User
        if (passwordConfirmed()) {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim());

          await FirestoreService().createUser(
              _emailController.text.trim(),
              _firstNameController.text.trim(),
              _lastNameController.text.trim());
        }
        Navigator.pop(context);
        showErrorMessage('Sign Up Succesfully');
      } on FirebaseAuthException catch (e) {
        String errorMessage1 = e.code.toString();
        print(errorMessage1);
        if (errorMessage1 == 'invalid-email') {
          _emailController.clear();
          showErrorMessage(errorMessage1);
        } else if (errorMessage1 == 'weak-password') {
          showErrorMessage('Weak Password');
        } else if (errorMessage1 == 'email-already-in-use') {
          showErrorMessage('Email already in use');
        } else if (errorMessage1 == 'missing-password') {
          showErrorMessage('Enter your Password');
        }

        _passwordController.clear();
        _confirmPasswordController.clear();
      }
      _passwordController.clear();
      _confirmPasswordController.clear();
    }
    // Navigator.of(context) not working!
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  bool passwordConfirmed() {
    if (nameConfirmed()) {
      if (_passwordController.text.trim() ==
          _confirmPasswordController.text.trim()) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  bool nameConfirmed() {
    if (_firstNameController.text.trim().isNotEmpty &&
        _lastNameController.text.trim().isNotEmpty) {
      return true;
    } else if (_firstNameController.text.trim().isEmpty) {
      _firstNameController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
      showErrorMessage('Enter First Name');
      return false;
    } else {
      _lastNameController.text.trim();
      _passwordController.clear();
      _confirmPasswordController.clear();
      showErrorMessage('Enter Last Name');
      return false;
    }
  }
}
