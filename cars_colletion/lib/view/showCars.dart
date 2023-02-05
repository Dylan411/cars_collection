import 'package:cars_colletion/model/cars.dart';
import 'package:cars_colletion/service/carAPI.dart';
import 'package:cars_colletion/view/searchCars.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

class ShowCars extends StatefulWidget {
  const ShowCars({super.key});

  @override
  State<ShowCars> createState() => _ShowCarsState();
}

class _ShowCarsState extends State<ShowCars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cars'),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchCar());
              },
              icon: Icon(Icons.search))
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
                                leading: Icon(Icons.storage),
                                title: Text(data[index].modelName),
                                subtitle: Text(data[index].brand),
                                trailing: FavoriteButton(
                                  isFavorite: false,
                                  valueChanged: (_isFavorite) {
                                    Api.insertCar(data[index].id);
                                  },
                                ),
                              );
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
