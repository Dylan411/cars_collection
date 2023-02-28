import 'dart:async';

import 'package:cars_colletion/view/user/editUser.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'editEmail.dart';
import 'editImage.dart';
import 'editPassword.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String user = ' ';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences name = await SharedPreferences.getInstance();
    setState(() {
      user = name.getString('user')!;
      print('userInit:' + user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 10,
          ),
          const Center(
              child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(64, 105, 225, 1),
                    ),
                  ))),
          // InkWell(
          //   onTap: () {
          //     navigateSecondPage(const EditImagePage());
          //   },
          //   child: Image.asset(
          //     'images/lake.jpg',
          //     height: 60.0,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          buildUserInfoDisplay(user, 'User Name', const EditUser()),
          buildUserInfoDisplay('*******', 'Password', const EditPassword()),
          buildUserInfoDisplay('dylan@gmail.com', 'Email', const EditEmail()),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              QuickAlert.show(
                context: context,
                type: QuickAlertType.confirm,
                text: 'Esta seguro que desea cerrar sesion?',
                confirmBtnText: 'Si',
                cancelBtnText: 'No',
                confirmBtnColor: Colors.white,
                backgroundColor: Colors.black,
                confirmBtnTextStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                barrierColor: Colors.white,
                titleColor: Colors.white,
                textColor: Colors.white,
                onConfirmBtnTap: () async {
                  SharedPreferences name =
                      await SharedPreferences.getInstance();
                  name.clear();
                  print(name);
                  Navigator.of(context, rootNavigator: true).pop();
                },
              );
            },
            child: Text('Logout'),
          )
        ],
      ),
    );
  }

  Widget buildUserInfoDisplay(String getValue, String title, Widget editPage) =>
      Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Container(
                  width: 350,
                  height: 40,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ))),
                  child: Row(children: [
                    Expanded(
                        child: TextButton(
                            onPressed: () {
                              navigateSecondPage(editPage);
                            },
                            child: Text(
                              getValue,
                              style: const TextStyle(fontSize: 16, height: 1.4),
                            ))),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                      size: 40.0,
                    )
                  ]))
            ],
          ));

  // Refrshes the Page after updating user info.
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
