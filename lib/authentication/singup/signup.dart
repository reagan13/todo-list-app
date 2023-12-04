import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_application/authentication/login/authenticator.dart';

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
      body: Center(
        key: _keyForm,
        child: Column(
          children: [
            const Text('SignUp'),

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
            TextFormField(
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
                suffixIcon: IconButton(
                    onPressed: () {
                      _emailController.clear();
                    },
                    icon: const Icon(Icons.clear)),
              ),
              keyboardType: TextInputType.emailAddress,
            ),

            // Password
            TextFormField(
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

            // Sign Up Button
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  // call register user method
                  registerUser(_emailController.text.trim(),
                      _passwordController.text.trim());
                },
                child: const Text('Sign In'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
