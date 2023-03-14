import 'package:cars_colletion/model/cars.dart';
import 'package:cars_colletion/service/carAPI.dart';
import 'package:cars_colletion/view/car/global/searchCars.dart';
import 'package:cars_colletion/view/user/auth/accessUser.dart';
import 'package:cars_colletion/view/user/auth/login/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import '../user/showCarsCollection.dart';

class ShowCars extends StatefulWidget {
  const ShowCars({Key? key}) : super(key: key);

  @override
  State<ShowCars> createState() => _ShowCarsState();
}

class _ShowCarsState extends State<ShowCars> {
  String user = '';
  String query = '';

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

  void onSearch(String _query) {
    setState(() {
      query = _query;
    });
  }

  @override
  // ignore: prefer_const_constructors
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              floating: true,
              pinned: true,
              delegate: SearchCar(onSearch: onSearch),
            ),
            ShowCard(),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 28, 35, 51),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print(user);
            if (user != '') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const ShowCarsCollection())));
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => AccessUser())));
            }
          },
          backgroundColor: Color.fromARGB(255, 28, 35, 51),
          child: const Icon(Icons.car_repair),
        ),
      );

  Widget ShowCard() => SliverToBoxAdapter(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  "New cars",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            FutureBuilder(
              future: Api.getCar(query: query),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<Cars> data = snapshot.data;
                  return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding:
                            EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 16,
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                childAspectRatio: 0.65),
                        itemCount: data.length,
                        itemBuilder: (context, i) {
                          return Buildcard(
                              data[1].image, data[i].modelName, data[i].id);
                          ;
                        },
                      ));
                } else {
                  return Text("Loading...");
                }
              },
            ),
          ],
        ),
      );

  Widget Buildcard(String url, String name, String id) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(61, 72, 92, 1.0),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 15.0, right: 25),
            child: Image.network(
              url,
              height: 200,
            ),
          ),
          Positioned(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, top: 215.0, right: 15.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          name,
                          style: const TextStyle(
                              color: Color.fromRGBO(28, 33, 46, 1.0),
                              fontSize: 15.0,
                              letterSpacing: 1.0),
                          textAlign: TextAlign.justify,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: -1,
              right: 2,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.add,
                              color: Colors.grey[350]?.withOpacity(0.3)),
                          onPressed: () {
                            ToastContext().init(context);
                            if (user != '') {
                              Api.insertCar(user, id);
                              Toast.show('Car was added');
                            } else {
                              Toast.show('Please login');
                            }
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
