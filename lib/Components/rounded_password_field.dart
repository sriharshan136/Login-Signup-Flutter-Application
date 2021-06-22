import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_application/constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final bool isPassCorrect;
  const RoundedPasswordField({
    Key? key,
    required this.controller,
    this.isPassCorrect = true,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: size.width * 0.8,
      child: TextFormField(
        controller: widget.controller,
        obscureText: isHidden,
        decoration: InputDecoration(
          hintText: 'Password',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29),
          ),
          prefixIcon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
            icon: isHidden
                ? Icon(
                    Icons.visibility_off,
                    color: kPrimaryColor,
                  )
                : Icon(
                    Icons.visibility,
                    color: kPrimaryColor,
                  ),
            onPressed: togglePasswordVisibility,
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        autofillHints: [AutofillHints.password],
        onEditingComplete: () => TextInput.finishAutofillContext(),
        validator: (password) => password != null && password.length < 5
            ? 'Enter min. 5 characters'
            : widget.isPassCorrect
                ? null
                : 'Incorrect password',
      ),
    );
  }

  void togglePasswordVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }
}
