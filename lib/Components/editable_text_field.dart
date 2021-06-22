import 'package:flutter/material.dart';
import 'package:login_application/constants.dart';

class EditableTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String initialText;
  final IconData icon;
  const EditableTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.icon,
    required this.initialText,
  }) : super(key: key);

  @override
  _EditableTextFieldState createState() => _EditableTextFieldState();
}

class _EditableTextFieldState extends State<EditableTextField> {
  bool isEditable = false;

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
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: size.width * 0.8,
      child: TextFormField(
        initialValue: widget.initialText,
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.icon,
            color: kPrimaryDarkColor,
          ),
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: Color(0xFF6200EE),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.edit,
              color: kPrimaryDarkColor,
            ),
            onPressed: toggleEdit,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  void toggleEdit() {
    setState(() {
      isEditable = true;
    });
  }

  void onListen() {
    setState(() {});
  }
}
