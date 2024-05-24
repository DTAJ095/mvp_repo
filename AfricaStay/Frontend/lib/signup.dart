import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_background/landing_page.dart';

class SignupPage extends StatefulWidget {

  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController FirstName = TextEditingController();

  TextEditingController LastName = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Signup Here',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Image.asset(
              'assets/images/login_background.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  height: 500,
                  width: 450,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100.withOpacity(0.1)),
                  child: Form(
                      key: formkey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Username text field
                            TextFormField(
                              controller: FirstName,
                              keyboardType: TextInputType.text,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              obscureText: false,
                              decoration: InputDecoration(
                                // label: Text("Password"),
                                labelText: "Enter your first name",
                                labelStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: const BorderSide(
                                        width: 10.0, color: Colors.blue)),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("Fill in the blanks");
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              controller: LastName,
                              keyboardType: TextInputType.text,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              obscureText: false,
                              decoration: InputDecoration(
                                // label: Text("Password"),
                                labelText: "Enter your last name",
                                labelStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: const BorderSide(
                                        width: 10.0, color: Colors.blue)),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("Fill in the blanks");
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              controller: phone,
                              keyboardType: TextInputType.text,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                  // label: Text("Phone"),
                                  labelText: "Enter your phone number",
                                  labelStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide: const BorderSide(
                                          width: 10.0, color: Colors.blue)),
                                  prefixIcon: const Icon(
                                    CupertinoIcons.phone,
                                    color: Colors.white,
                                  )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("Fill in the blanks");
                                }
                                if (!RegExp(
                                        r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s./0-9]+$')
                                    .hasMatch(value)) {
                                  return ("Please enter a valid phone number");
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              controller: password,
                              keyboardType: TextInputType.text,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              obscureText: true,
                              decoration: InputDecoration(
                                  // label: Text("Password"),
                                  labelText: "Enter your password",
                                  labelStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide: const BorderSide(
                                          width: 10.0, color: Colors.blue)),
                                  prefixIcon: const Icon(
                                    CupertinoIcons.eye_slash,
                                    color: Colors.white,
                                  )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("Fill in the blanks");
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                final dio = Dio();
                                final isValidForm =
                                    formkey.currentState!.validate();
                                if (isValidForm) {
                                  final response = await dio.post(
                                      'http://192.168.1.118:8000/account/user/create/',
                                      data: {
                                        'first_name': FirstName.text,
                                        'last_name': LastName.text,
                                        'phone': phone.text,
                                        'password': password.text
                                      });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LandingPage(),
                                      ));
                                  print(response);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ])),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
