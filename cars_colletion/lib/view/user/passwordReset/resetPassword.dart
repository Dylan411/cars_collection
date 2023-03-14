import 'package:cars_colletion/service/carAPI.dart';
import 'package:cars_colletion/view/user/passwordReset/changePassword.dart';
import 'package:flutter/material.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;

import '../auth/accessUser.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController emailController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text('Reset',
                      style: TextStyle(
                          fontSize: 60.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                  child: Text('Password',
                      style: TextStyle(
                          fontSize: 60.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(285.0, 175.0, 0.0, 0.0),
                  child: Text('?',
                      style: TextStyle(
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Enter the email address associated with your account.',
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: 'EMAIL',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red))),
                ),
                SizedBox(height: 40.0),
                Container(
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.blueAccent,
                    color: Colors.blue,
                    elevation: 7.0,
                    child: GestureDetector(
                        onTap: () {
                          Api.sendEmail(emailController.text);
                          showDialog();
                        },
                        child: Center(
                            child: Text(
                          'RESET PASSWORD',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ))),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showDialog() {
    slideDialog.showSlideDialog(
      context: context,
      child: Column(
        children: [
          const Text("Your code was send to yout email"),
          SizedBox(
            height: 15,
          ),
          const Text("Please insert your code"),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: codeController,
            decoration: InputDecoration(
                labelText: 'CODE',
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red))),
          ),
          SizedBox(
            height: 15,
          ),
          Material(
            borderRadius: BorderRadius.circular(20.0),
            shadowColor: Colors.blueAccent,
            color: Colors.blue,
            elevation: 7.0,
            child: GestureDetector(
                onTap: () async {
                  int? valid = await Api()
                      .verifyCode(codeController.text, emailController.text);

                  if (valid == 200) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => ChangePassword())));
                  }
                },
                child: Center(
                    child: Text(
                  'VERIFY CODE',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ))),
          ),
        ],
      ),
    );
  }
}
