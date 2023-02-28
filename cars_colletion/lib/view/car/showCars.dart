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
  String user = 'DLN';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Cars'),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchCar(user: user));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: FutureBuilder(
                    future: Api.getCar(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          List<Cars> data = snapshot.data;
                          return ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (BuildContext context, index) {
                              return ListTile(
                                  leading: Image.network(
                                    data[index].image,
                                    height: 90,
                                    width: 90,
                                  ),
                                  title: Text(data[index].modelName),
                                  subtitle: Text(data[index].brand),
                                  trailing: IconButton(
                                      onPressed: () async {
                                        if (user == ' ') {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      AccessUser())));
                                        } else {
                                          QuickAlert.show(
                                              context: context,
                                              type: QuickAlertType.success,
                                              text:
                                                  '${data[index].modelName} ha sido añadido a su colección');
                                          Api.insertCar(user, data[index].id);
                                        }
                                      },
                                      icon: const Icon(
                                          Icons.add_circle_outline_outlined)));
                            },
                          );
                        }
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
