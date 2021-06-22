import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_application/Components/already_have_an_account_check.dart';
import 'package:login_application/Components/or_divider.dart';
import 'package:login_application/Components/rounded_button.dart';
import 'package:login_application/Components/rounded_email_field.dart';
import 'package:login_application/Components/rounded_password_field.dart';
import 'package:login_application/Components/social_icon.dart';
import 'package:login_application/Screens/Login/Components/background.dart';
import 'package:login_application/constants.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPassCorrect = true;
  bool isEmailCorrect = true;
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
                "LOGIN",
                style: TextStyle(
                    fontSize: size.height * 0.08,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              SizedBox(height: size.height * 0.04),
              RoundedEmailField(
                controller: emailController,
                isEmailCorrect: isEmailCorrect,
              ),
              RoundedPasswordField(
                controller: passwordController,
                isPassCorrect: isPassCorrect,
              ),
              buildForgotPassword(),
              RoundedButton(
                text: "LOGIN",
                press: login,
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.pushNamed(context, '/SignupScreen');
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

  void login() async {
    FormState form = formKey.currentState!;
    setState(() {
      isEmailCorrect = true;
      isPassCorrect = true;
    });

    if (form.validate()) {
      TextInput.finishAutofillContext();
      final email = emailController.text;
      final pass = passwordController.text;

      SharedPreferences _sh = await SharedPreferences.getInstance();
      setState(() {
        kUserName = _sh.getString("nameKey");
        kUserEmail = _sh.getString("emailKey");
        kPassword = _sh.getString("passKey");
        kAddress = _sh.getString("addressKey");
      });

      if (email == kUserEmail && pass == kPassword) {
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text('Greetings $kUserName !!'),
          ));
        Navigator.pushNamed(context, '/HomeScreen');
      } else if (email == kUserEmail) {
        setState(() {
          isPassCorrect = false;
        });
      } else {
        setState(() {
          isPassCorrect = false;
          isEmailCorrect = false;
        });
      }
      form = formKey.currentState!;
      form.validate();
    }
  }

  Widget buildForgotPassword() => Container(
        padding: EdgeInsets.only(right: 30.0),
        alignment: Alignment.centerRight,
        child: TextButton(
          child: Text(
            'Forgotten Password?',
            style: TextStyle(
              color: Colors.green[700],
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {},
        ),
      );
}
