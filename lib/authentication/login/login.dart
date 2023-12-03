import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_application/widget/navigation_menu.dart';

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

  Future checklogin(email, password) async {
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
          .signInWithEmailAndPassword(email: email, password: password);
      setState(() {
        errormessage = "";
      });
    } on FirebaseAuthException catch (e) {
      print(e);
      setState(() {
        errormessage = e.message.toString();
      });
      // TODO
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Welcome to List It Down',
          ),
          Container(
            margin: EdgeInsets.all(30),
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2.0, // Adjust the border width as needed
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withOpacity(0.2), // Adjust the shadow color and opacity
                  spreadRadius: 2, // Adjust the spread radius
                  blurRadius: 4, // Adjust the blur radius
                  offset: Offset(0, 2), // Adjust the shadow offset
                ),
              ],
            ),
            child: Column(
              children: [
                const Text(
                  'Fill out the information below in order to access your account',
                ),

                // Email
                Container(
                  child: TextFormField(
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
                        hintText: 'Email',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _emailController.clear();
                            },
                            icon: const Icon(Icons.clear))),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                // Password
                Container(
                  child: TextFormField(
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
                      hintText: 'Password',
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
                ElevatedButton(
                  onPressed: () {
                    checklogin(_emailController.text, _passwordController.text);
                  },
                  child: const Text('Sign In'),
                ),
                const Text(
                  'Or Sign in with',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
