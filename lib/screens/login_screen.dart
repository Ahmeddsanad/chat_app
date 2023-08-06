// ignore_for_file: unnecessary_string_interpolations, must_be_immutable

import 'package:chat_app/components/TextItem.dart';
import 'package:chat_app/components/buttonItem.dart';
import 'package:chat_app/components/show_snake_bar.dart';
import 'package:chat_app/constant.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
                  Image.asset(kLogo),
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
                          'LOGIN',
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
                      onChanged: (data) {
                        email = data;
                      },
                      validator: (data) {
                        if (data!.isEmpty) {
                          return 'email must be filled';
                        }
                      },
                      text: 'Email',
                      controller: emailController,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextItem(
                      onChanged: (data) {
                        password = data;
                      },
                      validator: (data) {
                        if (data!.isEmpty) {
                          return 'password must be filled';
                        }
                      },
                      text: 'Password',
                      controller: passwordController,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ButtonItem(
                      function: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });

                          try {
                            UserCredential user = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: email!,
                              password: password!,
                            );

                            Navigator.pushNamed(context, ChatScreen.id);

                            // print('login success');
                          } on FirebaseAuthException catch (e) {
                            print(e);

                            if (e.code == 'user-not-found') {
                              ShowSnakeBar(
                                  context, 'No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              ShowSnakeBar(context, 'Wrong password');
                            }
                          }

                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                      text: 'Login',
                      horizontalSymmetric: 150.0),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'don\'t have an account?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterScreen.id);
                        },
                        child: const Text(
                          ' Register',
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
      ),
    );
  }
}
