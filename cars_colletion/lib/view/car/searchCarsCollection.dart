import 'package:cars_colletion/view/user/accessUser.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/cars.dart';
import '../../service/carAPI.dart';
import '../user/login.dart';

class SearchCarCollection extends SearchDelegate {
  SearchCarCollection({
    @required this.user,
  });

  final user;

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
                  future: Api.getCarsCollection(query: query, user: user),
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
                                    onPressed: () {
                                      if (user == null) {
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
                                          confirmBtnTextStyle: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          barrierColor: Colors.white,
                                          titleColor: Colors.white,
                                          textColor: Colors.white,
                                          onConfirmBtnTap: () {
                                            Api.deleteCar(user, data[index].id);
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop();
                                          },
                                        );
                                      }
                                    },
                                    icon: const Icon(
                                        Icons.remove_circle_outline_outlined)));
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
