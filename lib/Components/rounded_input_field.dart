import 'package:flutter/material.dart';
import 'package:login_application/constants.dart';

class RoundedInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.controller,
  }) : super(key: key);

  @override
  _RoundedInputFieldState createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
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
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29),
          ),
          prefixIcon: Icon(
            widget.icon,
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
        validator: (value) => value == null ? 'Please Fill' : null,
      ),
    );
  }

  void onListen() {
    setState(() {});
  }
}
