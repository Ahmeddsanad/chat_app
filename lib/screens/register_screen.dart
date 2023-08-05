// ignore_for_file: must_be_immutable

import 'package:chat_app/components/TextItem.dart';
import 'package:chat_app/components/buttonItem.dart';
import 'package:chat_app/constant.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  String? email;
  String? password;

  static String id = 'RegisterScreen';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 75.0,
                ),
                Image.asset('assets/images/scholar.png'),
                const Text(
                  'Scholar Chat',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: Colors.white,
                    fontSize: 32.0,
                  ),
                ),
                const SizedBox(
                  height: 75.0,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    children: [
                      Text(
                        'REGISTER',
                        style: TextStyle(
                          fontFamily: 'RobotoCondensed',
                          color: Colors.white,
                          fontSize: 32.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextItem(
                      text: 'Email',
                      // controller: emailController,
                      onChanged: (data) {
                        email = data;
                      },
                      validator: (data) {
                        if (data!.isEmpty) {
                          return 'email must be filled';
                        }
                      }),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextItem(
                      validator: (data) {
                        return 'password must be filled';
                      },
                      text: 'Password',
                      // controller: passwordController,
                      onChanged: (data) {
                        password = data;
                      }),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: ButtonItem(
                      function: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            UserCredential user = await RegisterUser();

                            // print(user.user!.displayName);
                          } on FirebaseAuthException catch (ex) {
                            print(ex);

                            if (ex.code == 'weak-password') {
                              ShowSnakeBar(context, 'weak password.');
                            } else if (ex.code == 'email-already-in-use') {
                              ShowSnakeBar(
                                  context, 'The email already exists.');
                            }
                          }
                        }

                        ShowSnakeBar(context, 'Success.');
                      },
                      text: 'Register',
                      horizontalSymmetric: 140.0),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'already have an account?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        ' Login',
                        style: TextStyle(
                          color: Color(0xffc7ede6),
                          fontSize: 18.0,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void ShowSnakeBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$message',
        ),
      ),
    );
  }

  Future<UserCredential> RegisterUser() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
    return user;
  }
}
