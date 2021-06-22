import 'dart:io';

import 'package:flutter/material.dart';
import 'package:login_application/Screens/Home/Components/body.dart';
import 'package:login_application/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurple[900]),
        title: Text("Home Screen",
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
      drawer: Drawer(
        child: Container(
          color: Colors.blue[100],
          height: size.height,
          child: ListView(
            children: [
              Container(
                  height: size.height * 0.3,
                  width: size.width * 0.85,
                  child: UserAccountsDrawerHeader(
                    accountName: Text(kUserName),
                    accountEmail: Text(kUserEmail),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.orange[300],
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/ProfileScreen');
                        },
                        child: Icon(Icons.person,
                            size: size.width * 0.175, color: kPrimaryDarkColor),
                      ),
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [kPrimaryColor, kPrimaryDarkColor],
                      ),
                    ),
                  )),
              ListTile(
                leading: Icon(Icons.person, size: 30.0, color: Colors.black),
                trailing: Icon(
                  Icons.arrow_right,
                  size: 40.0,
                  color: Colors.black,
                ),
                title: Text(
                  "Profile",
                  style: TextStyle(color: kPrimaryDarkColor),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/ProfileScreen');
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.list, size: 30.0, color: Colors.black),
                trailing: Icon(
                  Icons.arrow_right,
                  size: 40.0,
                  color: Colors.black,
                ),
                title: Text(
                  "Order History",
                  style: TextStyle(color: kPrimaryDarkColor),
                ),
                onTap: () {
                  setState(() {});
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.call, size: 30.0, color: Colors.black),
                trailing: Icon(
                  Icons.arrow_right,
                  size: 40.0,
                  color: Colors.black,
                ),
                title: Text(
                  "Help & Support",
                  style: TextStyle(color: kPrimaryDarkColor),
                ),
                onTap: () {
                  setState(() {});
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.update, size: 30.0, color: Colors.black),
                trailing: Icon(
                  Icons.arrow_right,
                  size: 40.0,
                  color: Colors.black,
                ),
                title: Text(
                  "Updates",
                  style: TextStyle(color: kPrimaryDarkColor),
                ),
                onTap: () {
                  setState(() {});
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.logout, size: 30.0, color: Colors.black),
                trailing: Icon(
                  Icons.arrow_right,
                  size: 40.0,
                  color: Colors.black,
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(color: kPrimaryDarkColor),
                ),
                onTap: logout,
              ),
            ],
          ),
        ),
      ),
      body: Body(),
    );
  }

  void logout() {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text("Log out alert!!"),
              content: Text("Are you sure, you want to Log out?"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                    ),
                    child: Text('No')),
                ElevatedButton(
                    onPressed: () {
                      exit(0);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    child: Text('Yes, Log out')),
              ],
            ));
    setState(() {});
  }
}
