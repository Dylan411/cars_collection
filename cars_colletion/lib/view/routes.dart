import 'package:cars_colletion/view/login.dart';
import 'package:cars_colletion/view/showCars.dart';
import 'package:flutter/cupertino.dart';

class Routes extends StatelessWidget {
  final int index;
  const Routes({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [const Login(), const ShowCars(name: '')];
    return myList[index];
  }
}
