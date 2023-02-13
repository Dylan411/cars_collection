import 'package:flutter/material.dart';
import '../model/cars.dart';
import '../service/carAPI.dart';
import 'login.dart';

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
                                trailing: IconButton(
                                    onPressed: () {
                                      if (1 == '') {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    Login())));
                                      } else {
                                        Api.insertCar(data[index].id);
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
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Search Car'),
    );
  }
}
