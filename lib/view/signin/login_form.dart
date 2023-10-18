import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:louts_mobile_store/controller/user_controller.dart';
import 'package:louts_mobile_store/routes/route_app.dart';

import '../../utils/app_colors.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginFormKey = GlobalKey<FormState>();

  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController phoneEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  bool isRegistered = true;
  bool isUsePhoneNumber = false;
  // List<String> mode = ['phone number', 'email'];
  Map<String, TextEditingController> _editTextControllers = {};

  @override
  void dispose() {
    phoneEditingController.dispose();
    emailEditingController.dispose();
    passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _loginFormKey,
        child: Column(
          children: [
            ///start phone input

            isUsePhoneNumber
                ? TextFormField(
                    controller: phoneEditingController,
                    maxLines: 2,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      hintText: 'Phone Number',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Your Phone Number';
                      }
                      if (value.length != 9) {
                        return 'you must enter 9 digits';
                      }
                      return null;
                    },
                    onChanged: (value) {},
                    onSaved: (newValue) {},
                  )
                : TextFormField(
                    controller: emailEditingController,
                    maxLines: 2,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      hintText: 'Email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Your Email';
                      }

                      return null;
                    },
                    onChanged: (value) {},
                    onSaved: (newValue) {},
                  ),

            ///end phone input
            SizedBox(
              height: 10,
            ),

            ///start phone input
            TextFormField(
              controller: passwordEditingController,
              maxLines: 2,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                hintText: 'Password',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter Your Password';
                }
                if (value.length <= 5 || value.isEmpty) {
                  return 'Short Password';
                }

                return null;
              },
              onChanged: (value) {},
              onSaved: (newValue) {},
            ),

            ///end phone input
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (() {
                    if (isUsePhoneNumber) {
                      setState(() {
                        isUsePhoneNumber = false;
                      });
                    } else {
                      setState(() {
                        isUsePhoneNumber = true;
                      });
                    }
                  }),
                  child: Row(
                    children: [
                      Text(
                        "login using",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 13),
                      ),
                      Text(
                        isUsePhoneNumber ? " email" : " phone number",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Text(
                  "forgot password",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
          
            InkWell(
              onTap: () {
                if (_loginFormKey.currentState!.validate()) {
                  Get.find<UserController>()
                      .login(
                          emailOrmobile: emailEditingController.text,
                          password: passwordEditingController.text)
                      .then((value) {
                         print(value);
                    if (value) {
                     Get.toNamed(RouteApp.getInitial());
                     
                    }
                  });
                }
              },
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.primary),
                  child: Text(
                    'Log In',
                    style: TextStyle(color: AppColors.secondry, fontSize: 20),
                  )),
            ),
          SizedBox(height: 20,),
            InkWell(
              onTap: () { Get.back();
                }
              ,
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.secondry),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: AppColors.primary, fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  snackbar({required title, required message, required color}) {
    return Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.secondry,
        colorText: color);
  }
}
