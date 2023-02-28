import 'package:cars_colletion/view/car/searchCarsCollection.dart';
import 'package:cars_colletion/view/user/accessUser.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/cars.dart';
import '../../service/carAPI.dart';

class CarsCollection extends StatefulWidget {
  const CarsCollection({Key? key}) : super(key: key);

  @override
  State<CarsCollection> createState() => _CarsCollectionState();
}

class _CarsCollectionState extends State<CarsCollection> {
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('My Collection'),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: SearchCarCollection(user: user));
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
                    future: Api.getCarsCollection(user: user),
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
                                            type: QuickAlertType.confirm,
                                            text:
                                                'Esta seguro que desea borrar ${data[index].modelName} de su coleccion',
                                            confirmBtnText: 'Si',
                                            cancelBtnText: 'No',
                                            confirmBtnColor: Colors.white,
                                            backgroundColor: Colors.black,
                                            confirmBtnTextStyle:
                                                const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            barrierColor: Colors.white,
                                            titleColor: Colors.white,
                                            textColor: Colors.white,
                                            onConfirmBtnTap: () {
                                              Api.deleteCar(
                                                  user, data[index].id);
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .pop();
                                            },
                                          );
                                        }
                                      },
                                      icon: const Icon(Icons
                                          .remove_circle_outline_outlined)));
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
