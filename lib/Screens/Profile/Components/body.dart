import 'package:flutter/material.dart';
import 'package:login_application/Components/editable_text_field.dart';
import 'package:login_application/Components/rounded_button.dart';
import 'package:login_application/constants.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

  String address = kAddress;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: kPrimaryDarkColor,
                  radius: size.width * 0.125,
                  child: Icon(
                    Icons.person,
                    size: size.width * 0.2,
                    color: kPrimaryLightColor,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                EditableTextField(
                    controller: nameController,
                    labelText: 'Your Name',
                    initialText: kUserName,
                    icon: Icons.person),
                EditableTextField(
                    controller: emailController,
                    labelText: 'Emal',
                    initialText: kUserEmail,
                    icon: Icons.email),
                (address != '')
                    ? EditableTextField(
                        controller: addressController,
                        labelText: 'Address',
                        icon: Icons.location_on_sharp,
                        initialText: kAddress,
                      )
                    : Container(
                        child: Column(
                          children: [
                            SizedBox(height: size.height * 0.05),
                            RoundedButton(
                              press: () {
                                Navigator.pushNamed(context, '/AddressScreen');
                              },
                              text: 'ADD ADDRESS',
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
