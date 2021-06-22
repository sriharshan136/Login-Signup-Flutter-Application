import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_application/Components/rounded_button.dart';
import 'package:login_application/Components/underline_text_field.dart';
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
  final nameController = TextEditingController();
  final houseController = TextEditingController();
  final localityController = TextEditingController();
  final cityController = TextEditingController();
  final pincodeController = TextEditingController();

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
                    Icons.location_on_sharp,
                    size: size.width * 0.2,
                    color: kPrimaryLightColor,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                SizedBox(
                  height: size.height * 0.025,
                ),
                UnderlineTextField(
                  controller: nameController,
                  labelText: 'Full Name',
                ),
                UnderlineTextField(
                  controller: houseController,
                  labelText: 'House no. / Building name',
                ),
                UnderlineTextField(
                  controller: localityController,
                  labelText: 'Locality',
                ),
                UnderlineTextField(
                  controller: cityController,
                  labelText: 'City',
                ),
                UnderlineTextField(
                  controller: pincodeController,
                  labelText: 'Pin code',
                ),
                SizedBox(height: size.height * 0.15),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: RoundedButton(
                    press: addAddress,
                    text: 'ADD ADDRESS',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addAddress() async {
    final form = formKey.currentState!;
    if (form.validate()) {
      TextInput.finishAutofillContext();
      final name = nameController.text;
      final house = houseController.text;
      final locality = localityController.text;
      final city = cityController.text;
      final pincode = pincodeController.text;

      String address =
          name + ', ' + house + ', ' + locality + ', ' + city + ', ' + pincode;
      kAddress = address;

      SharedPreferences _sh = await SharedPreferences.getInstance();
      _sh.setString("addressKey", address);

      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            'Address updated!',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ));
      Navigator.pushNamed(context, '/ProfileScreen');
    }
  }
}
