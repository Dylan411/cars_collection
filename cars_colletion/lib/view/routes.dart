import 'package:cars_colletion/view/user/account.dart';
import 'package:cars_colletion/view/car/showCars.dart';
import 'package:cars_colletion/view/car/showCarsCollection.dart';
import 'package:flutter/cupertino.dart';

class Routes extends StatelessWidget {
  final int index;
  const Routes({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [ShowCars(), Account(), CarsCollection()];
    return myList[index];
  }
}
