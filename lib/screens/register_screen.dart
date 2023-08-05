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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                    }),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TextItem(
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
                      try {
                        var auth = FirebaseAuth.instance;

                        UserCredential user =
                            await auth.createUserWithEmailAndPassword(
                          email: email!,
                          password: password!,
                        );

                        print(user.user!.displayName);
                      } on FirebaseAuthException catch (ex) {
                        print(ex);

                        if (ex.code == 'weak-password') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'The password provided is too weak.',
                              ),
                            ),
                          );
                        } else if (ex.code == 'email-already-in-use') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'The email already exists.',
                              ),
                            ),
                          );
                        }
                      }
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
    );
  }
}
