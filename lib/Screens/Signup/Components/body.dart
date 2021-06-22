import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_application/Components/already_have_an_account_check.dart';
import 'package:login_application/Components/or_divider.dart';
import 'package:login_application/Components/rounded_button.dart';
import 'package:login_application/Components/rounded_email_field.dart';
import 'package:login_application/Components/rounded_input_field.dart';
import 'package:login_application/Components/rounded_password_field.dart';
import 'package:login_application/Components/social_icon.dart';
import 'package:login_application/Screens/Signup/Components/background.dart';

// ignore: unused_import
import 'package:login_application/constants.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "SIGNUP",
                style: TextStyle(
                    fontSize: size.height * 0.08,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                controller: userNameController,
                hintText: 'Your Name',
              ),
              RoundedEmailField(controller: emailController),
              RoundedPasswordField(controller: passwordController),
              RoundedButton(
                text: "SIGNUP",
                press: signup,
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.pushNamed(context, '/LoginScreen');
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void signup() async {
    final form = formKey.currentState!;
    if (form.validate()) {
      TextInput.finishAutofillContext();
      final user = userNameController.text;
      final email = emailController.text;
      final pass = passwordController.text;

      SharedPreferences _sh = await SharedPreferences.getInstance();
      _sh.setString("nameKey", user);
      _sh.setString("emailKey", email);
      _sh.setString("passKey", pass);
      _sh.setString("addressKey", "");

      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            'Thanks for Signing up! Login to continue',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ));
      Navigator.pushNamed(context, '/LoginScreen');
    }
  }
}
