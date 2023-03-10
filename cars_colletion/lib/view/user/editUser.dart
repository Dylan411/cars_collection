import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
// import 'package:flutter_user_profile/user/user_data.dart';
// import 'package:flutter_user_profile/widgets/appbar_widget.dart';
// import 'package:email_validator/email_validator.dart';

// This class handles the Page to edit the Email Section of the User Profile.
class EditUser extends StatefulWidget {
  const EditUser({Key? key}) : super(key: key);

  @override
  EditUserState createState() {
    return EditUserState();
  }
}

class EditUserState extends State<EditUser> {
  final _formKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  // var user = UserData.myUser;

  @override
  void dispose() {
    userController.dispose();
    super.dispose();
  }

  // void updateUserValue(String email) {
  //   user.email = email;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
                width: 320,
                child: const Text(
                  "What's your User?",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                )),
            Padding(
                padding: EdgeInsets.only(top: 40),
                child: SizedBox(
                    height: 100,
                    width: 320,
                    child: TextFormField(
                      // Handles Form Validation
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your user.';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(labelText: 'Your User'),
                      controller: userController,
                    ))),
            Padding(
                padding: EdgeInsets.only(top: 150),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 320,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate() &&
                              isAlpha(userController.text)) {
                            // updateUserValue(firstNameController.text +
                            //     " " +
                            //     secondNameController.text);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text(
                          'Update',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    )))
          ]),
    ));
  }
}
