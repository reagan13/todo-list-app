import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _keyForm = GlobalKey<FormState>();

class Login2 extends StatefulWidget {
  const Login2({super.key});

  @override
  State<Login2> createState() => _Login2State();
}

//UI BELOW

class _Login2State extends State<Login2> {
  String email = "";
  String password = "";
  final _emailController = TextEditingController();
  FocusNode _emailFocusNode = FocusNode();
  final _passwordController = TextEditingController();
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
        children: [
          Center(
            key: _keyForm,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 100, 8, 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Text App Title
                  const Text(
                    'Track urCash',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Color(0xFF001F3F),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  //Row for Sign in & Sign up
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 15),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //SIGN IN
                        Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0xFF7668FD),
                                offset: Offset(0, 6),
                                spreadRadius: 2,
                              )
                            ],
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(0),
                            ),
                            border: Border.all(
                              color: const Color(0x93D4D4D4),
                              width: 2,
                            ),
                          ),
                          alignment: const AlignmentDirectional(0.00, 0.00),
                          child: const Text(
                            'Sign in',
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        //SIGN UP
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              //Code for this so called button.

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const RegisterPage()));
                            },
                            child: Container(
                              width: 100,
                              height: 50,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 4),
                                    spreadRadius: 2,
                                  )
                                ],
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(5),
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              alignment: const AlignmentDirectional(0.00, 0.00),
                              child: const Text(
                                'Sign up',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //TextFormField_Email
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 70, 8, 0),
                    child: Container(
                      width: 350,
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
                          suffixIcon: IconButton(
                              onPressed: () {
                                _emailController.clear();
                              },
                              icon: const Icon(Icons.clear)),
                          labelText: 'Email',
                          labelStyle: const TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          hintText: 'Enter your email',
                          hintStyle: const TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF4B39EF),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFF5963),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFF5963),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                  //END of TextFormField_Email

                  //TextFormField_Password
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 25, 8, 0),
                    child: Container(
                      width: 350,
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
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          alignLabelWithHint: false,
                          hintText: 'Enter your password',
                          hintStyle: const TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF4B39EF),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFF5963),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFF5963),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              padding: const EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.white,
                              ),
                              child: InkWell(
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
                        style: const TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  //END of TextFormField_Password

                  //Login Button
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        print('Button pressed ...');
                        checklogin(
                            _emailController.text, _passwordController.text);
                        //dispose();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF4B39EF),
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        fixedSize: Size(300, 50),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  //END of Login Button
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
