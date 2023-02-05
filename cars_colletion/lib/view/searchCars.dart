import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

import '../model/cars.dart';
import '../service/carAPI.dart';

class SearchCar extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: FutureBuilder(
                  future: Api.getCar(query: query),
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
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Search Car'),
    );
  }
}
