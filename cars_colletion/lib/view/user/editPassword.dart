import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
// import 'package:string_validator/string_validator.dart';
// import 'package:flutter_user_profile/user/user_data.dart';
// import 'package:flutter_user_profile/widgets/appbar_widget.dart';

// This class handles the Page to edit the Name Section of the User Profile.
class EditPassword extends StatefulWidget {
  const EditPassword({Key? key}) : super(key: key);

  @override
  EditPasswordState createState() {
    return EditPasswordState();
  }
}

class EditPasswordState extends State<EditPassword> {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  // var user = UserData.myUser;

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  // void updateUserValue(String name) {
  //   user.name = name;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: buildAppBar(context),
        body: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
              width: 330,
              child: Text(
                "Change your password?",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 16, 0),
                  child: SizedBox(
                      height: 100,
                      width: 150,
                      child: TextFormField(
                        // Handles Form Validation for First Name
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (!isAlpha(value)) {
                            return 'Only Letters Please';
                          }
                          return null;
                        },
                        decoration:
                            const InputDecoration(labelText: 'Password'),
                        controller: passwordController,
                      ))),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 16, 0),
                  child: SizedBox(
                      height: 100,
                      width: 150,
                      child: TextFormField(
                        // Handles Form Validation for Last Name
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (!isAlpha(value)) {
                            return 'Only Letters Please';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(labelText: 'Confirm'),
                        controller: confirmPasswordController,
                      )))
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 330,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate() &&
                            isAlpha(passwordController.text +
                                confirmPasswordController.text)) {
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
        ],
      ),
    ));
  }
}
