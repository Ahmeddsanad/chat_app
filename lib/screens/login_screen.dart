// ignore_for_file: unnecessary_string_interpolations, must_be_immutable

import 'package:chat_app/components/TextItem.dart';
import 'package:chat_app/components/buttonItem.dart';
import 'package:chat_app/constant.dart';
import 'package:chat_app/screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  String id = 'LoginScreen';

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
                    validator: (data) {
                      return 'email must be filled';
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
                    validator: (data) {
                      return 'password must be filled';
                    },
                    text: 'Password',
                    controller: passwordController,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ButtonItem(
                    function: () {
                      if (formKey.currentState!.validate()) {}
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
    );
  }
}
