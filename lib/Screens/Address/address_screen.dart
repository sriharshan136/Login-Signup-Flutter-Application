import 'package:flutter/material.dart';
import 'package:login_application/Screens/Address/Components/body.dart';

class AddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurple[900]),
        title: Text("Add Address",
            style: TextStyle(color: Colors.deepPurple[900]),
            textDirection: TextDirection.ltr),
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  Colors.orange,
                  Colors.red,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
      ),
      body: Body(),
    );
  }
}
