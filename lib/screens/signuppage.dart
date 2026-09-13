import 'package:easy_localization/easy_localization.dart';
import 'package:first_flutter_project/screens/shoppingscreen.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  //slow animation page navigation
  void navigateToShoppingScreen() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 3000),
        reverseTransitionDuration: const Duration(milliseconds: 400),

        pageBuilder: (context, animation, secondaryAnimation) {
          return const Shoppingscreen();
        },

        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
            child: child,
          );
        },
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 10),
          Image.asset(
            // colorBlendMode: BlendMode.clear,
            "assets/images/logo.png",
            height: 200,
            width: 400,
            fit: BoxFit.contain,
          ),

          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // fullName TextField__________________________________________
                  Text(
                    "signuppage.Full Name".tr(),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: TextFormField(
                      controller: fullNameController,
                      textCapitalization: TextCapitalization.words,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your name";
                        }

                        if (!RegExp(r'^[A-Z]').hasMatch(value)) {
                          return "First letter must be capital";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        label: Text("signuppage.fullNameLabel".tr()),
                        focusedBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  // email TextField__________________________________________
                  SizedBox(height: 20),
                  Text(
                    "signuppage.Email".tr(),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email not valid";
                        } else if (!value.contains("@")) {
                          return "your email is missing @";
                        }
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        label: Text("signuppage.emailLabel".tr()),
                        focusedBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  // Password TextField
                  SizedBox(height: 20),
                  Text(
                    "signuppage.Password".tr(),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a password";
                        }

                        if (value.length < 6) {
                          return "Password must contain at least 6 characters";
                        }

                        return null;
                      },
                      controller: passwordController,
                      decoration: InputDecoration(
                        label: Text("signuppage.Password".tr()),
                        focusedBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  //Confirm Password TextField
                  SizedBox(height: 20),
                  Text(
                    "signuppage.Confirm Password".tr(),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please confirm your password";
                        }

                        if (value != passwordController.text) {
                          return "The two passwords don't match.";
                        }
                      },
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        label: Text("signuppage.Confirm Password".tr()),
                        focusedBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            //Account creation completion dialog
                            await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  actions: [
                                    MaterialButton(
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                      child: Text("signuppage.Close".tr()),
                                    ),
                                  ],
                                  title: Text(
                                    "signuppage.accountCreation".tr(),
                                    style: TextStyle(
                                      fontWeight: FontWeight(600),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                          if (mounted) {
                            navigateToShoppingScreen();
                          }
                        },
                        child: Text(
                          "signuppage.signup".tr(),
                          style: TextStyle(color: Colors.orangeAccent),
                        ),
                      ),
                    ),
                  ),
                  //Sign Up button -----------------------------------------------
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
