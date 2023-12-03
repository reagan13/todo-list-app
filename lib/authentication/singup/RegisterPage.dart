import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _keyForm = GlobalKey<FormState>();

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String userName = "";
  String email = "";
  String password = "";
  String confirmPass = "";

  final _userNameController = TextEditingController();
  FocusNode _userNameFocusNode = FocusNode();
  final _emailController = TextEditingController();
  FocusNode _emailFocusNode = FocusNode();
  final _passwordController = TextEditingController();
  FocusNode _passwordFocusNode = FocusNode();
  final _confirmPassController = TextEditingController();
  FocusNode _confirmPassFocusNode = FocusNode();
  bool _isObscure = true;
  bool _isObscureconfrimPass = true;

  late String errormessage;
  late bool isError;

  @override
  void initState() {
    errormessage = "This is an error";
    isError = false;
    super.initState();
  }

  // Future createUser() async {
  //   final users = FirebaseAuth.instance.currentUser!;
  //   final userid = users.uid;
  //   final docUser = FirebaseFirestore.instance.collection('user').doc(userid);

  //   final USER = RegisterPage(
  //     id: userid,
  //     name: _userNameController.text,
  //     email: _emailController.text,
  //   );
  // }

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
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => const sample1()));
      });

      setState(() {
        errormessage = "";
      });
    } on FirebaseAuthException catch (e) {
      // TODO
      print(e);
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

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              //Code for this so called button.

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => const LoginPage()));
                            },
                            child: Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 4),
                                    spreadRadius: 2,
                                  )
                                ],
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(20),
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
                          ),
                        ),

                        //SIGN UP
                        Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0xFF6D5FED),
                                offset: Offset(0, 6),
                                spreadRadius: 2,
                              )
                            ],
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(5),
                            ),
                            border: Border.all(
                              color: Color(0x93D4D4D4),
                              width: 2,
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
                      ],
                    ),
                  ),
                  //TextFormField_Name
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 35, 8, 15),
                    child: Container(
                      width: 350,
                      child: TextFormField(
                        controller: _userNameController,
                        focusNode: _userNameFocusNode,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                _userNameController.clear();
                              },
                              icon: const Icon(Icons.clear)),
                          labelText: 'Name',
                          labelStyle: const TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          hintText: 'Enter your full name',
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
                  //END of TextFormField_Name

                  //TextFormField_Email
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 10, 8, 15),
                    child: Container(
                      width: 350,
                      child: TextFormField(
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
                    padding: const EdgeInsets.fromLTRB(8, 10, 8, 15),
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

                  //TextFormField_ConfirmPass
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 10, 8, 15),
                    child: Container(
                      width: 350,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Password';
                          }

                          return null;
                        },
                        controller: _confirmPassController,
                        focusNode: _confirmPassFocusNode,
                        autofocus: true,
                        obscureText: _isObscureconfrimPass,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle: const TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          alignLabelWithHint: false,
                          hintText: 'Confirm your password',
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
                                    _isObscureconfrimPass =
                                        !_isObscureconfrimPass;
                                  });
                                },
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  _isObscureconfrimPass
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
                  //END of TextFormField_ConfirmPass

                  //Elevated Button_Register
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        print('Button pressed ...');
                        registerUser(_emailController.text.trim(),
                            _passwordController.text.trim());
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF4B39EF),
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        fixedSize: Size(300, 50),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                  //END of Button_Register
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
