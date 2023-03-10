import 'package:cars_colletion/model/cars.dart';
import 'package:cars_colletion/service/carAPI.dart';
import 'package:cars_colletion/view/user/accessUser.dart';
import 'package:cars_colletion/view/user/login.dart';
import 'package:cars_colletion/view/car/searchCars.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowCars extends StatefulWidget {
  const ShowCars({Key? key}) : super(key: key);

  @override
  State<ShowCars> createState() => _ShowCarsState();
}

class _ShowCarsState extends State<ShowCars> {
  String user = '';
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences name = await SharedPreferences.getInstance();
    // setState(() {
    //   user = name.getString('user')!;
    //   print('userInit:' + user);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(28, 33, 46, 1.0),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(
                color: const Color.fromRGBO(61, 72, 92, 1.0),
                height: 120.0,
                child: Padding(
                  padding: const EdgeInsets.only(right: 18.0, left: 18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const <Widget>[
                            Icon(
                              Icons.account_circle,
                              color: Colors.white,
                              size: 35.0,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Garage',
                              style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(5.0, 7.0, 5.0, 7.0),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0)),
                            color: Color.fromRGBO(83, 97, 125, 1.0),
                            boxShadow: [BoxShadow(color: Colors.black26)]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: TextField(
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.grey[350]?.withOpacity(0.3),
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                    bottom: 10.0,
                                    right: 10.0,
                                    top: 10.0,
                                    left: -12.0),
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                  color: Colors.grey[350]?.withOpacity(0.3),
                                )),
                            style: TextStyle(
                              color: Colors.grey[350]?.withOpacity(0.3),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 100.0,
                child: Stack(
                  children: <Widget>[
                    ListView(
                      // This next line does the trick.
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[],
                    ),
                    //gradient in end of list effect
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Opacity(
                          opacity: 0.03,
                          child: RotationTransition(
                            turns: new AlwaysStoppedAnimation(360 / 360),
                            child: Image.network(
                                'http://samaritan-counseling.com/wp-content/themes/Stellar_Responsive/images/right-fade.png'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
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
                      future: Api.getCar(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<Cars> data = snapshot.data;
                          return SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.only(
                                    left: 5.0, right: 5.0, top: 5.0),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 16,
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        childAspectRatio: 0.65),
                                itemCount: data.length,
                                itemBuilder: (context, i) {
                                  return Buildcard(
                                      data[1].image,
                                      data[i].modelName,
                                      data[i].year.toString());
                                },
                              ));
                        } else {
                          return Text("Loading...");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          backgroundColor: Color.fromARGB(255, 28, 35, 51),
          child: const Icon(Icons.car_repair),
        ),
      ),
    );
  }
}

Widget Buildcard(String url, String name, String year) {
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
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
          child: Image.network(url),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
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
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    " $year",
                    style: const TextStyle(color: Colors.white, fontSize: 15.0),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
