import 'package:cars_colletion/view/user/account.dart';
import 'package:cars_colletion/view/car/showCars.dart';
import 'package:cars_colletion/view/car/showCarsCollection.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Navigation Bar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;
  final _pageOptions = [new ShowCars(), new Account(), new CarsCollection()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_box_outlined,
                  color: Color(0xFF282858),
                ),
                label: 'Account'),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: 'My Collection'),
          ],
        ),
      ),
    );
  }
}
