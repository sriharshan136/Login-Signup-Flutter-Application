import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:login_application/constants.dart';

class RoundedEmailField extends StatefulWidget {
  final TextEditingController controller;
  final bool isEmailCorrect;
  const RoundedEmailField({
    Key? key,
    required this.controller,
    this.isEmailCorrect = true,
  }) : super(key: key);

  @override
  _RoundedEmailFieldState createState() => _RoundedEmailFieldState();
}

class _RoundedEmailFieldState extends State<RoundedEmailField> {
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(onListen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: size.width * 0.8,
      child: TextFormField(
        controller: widget.controller,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: 'Email',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29),
          ),
          prefixIcon: Icon(
            Icons.email,
            color: kPrimaryColor,
          ),
          suffixIcon: widget.controller.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  icon: Icon(Icons.close),
                  color: kPrimaryColor,
                  onPressed: () => widget.controller.clear(),
                ),
        ),
        keyboardType: TextInputType.emailAddress,
        autofillHints: [AutofillHints.email],
        validator: (email) => email != null && !EmailValidator.validate(email)
            ? 'Enter a valid email'
            : widget.isEmailCorrect
                ? null
                : 'Incorrect email',
      ),
    );
  }

  void onListen() {
    setState(() {});
  }
}
