import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_academy/constants/colors.dart';
import 'package:online_academy/constants/mixin_validator.dart';
import 'package:online_academy/views/pages/home/home_page.dart';
import 'package:online_academy/views/widgets/app_logo.dart';
import 'package:online_academy/views/widgets/primary_button.dart';

class LoginPage extends StatelessWidget with ValidationMixin {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController passController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppLogo(size: size),
                SizedBox(height: size.height * 0.02),
                Text(
                  "Digital Education",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.02),
                InputField(
                  hintText: "Email",
                  isObsure: false,
                  controller: emailController,
                  vlaidator: (email) {
                    return isEmailValid(email!) ? null : 'Enter valid email';
                  },
                ),
                SizedBox(height: size.height * 0.02),
                InputField(
                  hintText: "Password",
                  isObsure: true,
                  controller: passController,
                  vlaidator: (password) {
                    return isPasswordValid(password!)
                        ? null
                        : 'Enter correct password';
                  },
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password',
                      style: TextStyle(color: ColorsClass.primaryColor),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                PrimaryButton(
                  onTap: () {
                    if (_key.currentState!.validate()) {
                      Get.to(() => const HomePage());
                    }
                  },
                  text: 'Login',
                  size: size,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isObsure = false,
    required this.vlaidator,
  }) : super(key: key);
  final String hintText;
  final TextEditingController controller;
  final bool isObsure;
  final String? Function(String?)? vlaidator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObsure,
      validator: vlaidator,
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[800]),
          fillColor: Colors.white70),
    );
  }
}
