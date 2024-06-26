// ignore_for_file: prefer_const_constructors
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/landing_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController phone = TextEditingController();

  TextEditingController password = TextEditingController();

  var userData = [];

  void initState() {
    super.initState();
    _saveCredentials();
    getUser();
  }

  void getUser() async {
    try {
      var response = await Dio().get('http://192.168.100.58:8000/account/user/get/?phone=${phone.text}');
      print(response);
      if (response.statusCode == 200) {
        setState(() {
          userData = response.data;
        });
      }

    }
    catch(e) {
      print(e);
    }
  }

  Future<void> _saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('phone', phone.text);
    await prefs.setString('password', password.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Login Here',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Stack(children: [
          ConstrainedBox(
            constraints: BoxConstraints.expand(),
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
                      key: formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Username text field
                            TextFormField(
                              controller: phone,
                              keyboardType: TextInputType.text,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                  // label: Text("Phone"),
                                  labelText: "Enter your phone number",
                                  labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide: BorderSide(
                                          width: 10.0, color: Colors.blue)),
                                  prefixIcon: Icon(
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
                            SizedBox(
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
                                  labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide: BorderSide(
                                          width: 10.0, color: Colors.blue)),
                                  prefixIcon: Icon(
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
                            SizedBox(
                              height: 20.0,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                final dio = Dio();
                                final isValidForm =
                                    formKey.currentState!.validate();
                                if (isValidForm) {
                                  final response = await dio.post(
                                      'http://192.168.100.58:8000/account/user/login/',
                                      data: {
                                        'phone': phone.text,
                                        'password': password.text
                                      });
                                  _saveCredentials();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LandingPage(),
                                      ));
                                  print(response);
                                  getUser();
                                  /*final userData = await dio.get('http://192.168.100.58:8000/account/user/get/?phone=${phone.text}');
                                  print(userData);*/
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.pushNamed(context,
                                    '/signup'); // Navigate to SignupPage
                              },
                              child: Text('Create an Account'),
                            ),
                          ])),
                ),
              ),
            ),
          )
        ]));
  }
}
