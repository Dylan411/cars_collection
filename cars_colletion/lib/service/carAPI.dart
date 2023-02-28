import 'dart:convert';
import 'package:cars_colletion/model/cars.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = "http://10.0.2.2:4002/api/";

  static getCar({String? query}) async {
    List<Cars> listCars = [];

    var url = Uri.parse("${baseUrl}car");
    try {
      final res = await http.get(url);

      print(res.statusCode);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        data['car'].forEach((value) => {
              listCars.add(Cars(
                  id: value['_id'],
                  toyNum: value["ToyNum"],
                  colNum: value["ColNum"],
                  modelName: value["ModelName"],
                  series: value["Series"],
                  seriesNum: value["SeriesNum"],
                  year: value["Year"],
                  brand: value["Brand"],
                  version: value["Version"],
                  image: value["Img"]))
            });
        if (query != null) {
          listCars = listCars
              .where((element) =>
                  element.modelName.toLowerCase().contains(query.toLowerCase()))
              .toList();
        }
        return listCars;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static getCarsCollection({String? query, required String user}) async {
    List<Cars> listCars = [];

    var url = Uri.parse("${baseUrl}car/getCarsById/$user");
    try {
      final res = await http.get(url);

      print(res.statusCode);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        data['car'].forEach((value) => {
              listCars.add(Cars(
                  id: value['_id'],
                  toyNum: value["ToyNum"],
                  colNum: value["ColNum"],
                  modelName: value["ModelName"],
                  series: value["Series"],
                  seriesNum: value["SeriesNum"],
                  year: value["Year"],
                  brand: value["Brand"],
                  version: value["Version"],
                  image: value["Img"]))
            });
        if (query != null) {
          listCars = listCars
              .where((element) =>
                  element.modelName.toLowerCase().contains(query.toLowerCase()))
              .toList();
        }
        return listCars;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static insertCar(user, car) async {
    var url = Uri.parse("${baseUrl}user/insertCar/$user/$car");

    try {
      final res = await http.put(url);
      print(res.statusCode);
      print(url);
    } catch (e) {
      print(e.toString());
    }
  }

  static deleteCar(user, car) async {
    var url = Uri.parse("${baseUrl}user/deleteCarsById/$user/$car");

    try {
      final res = await http.put(url);
      print(res.statusCode);
      print(url);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<int?> login(String user, String pass) async {
    var url = Uri.parse("${baseUrl}user/login/$user/$pass");

    try {
      final res = await http.get(url);
      print(res.statusCode);
      print(url);
      return res.statusCode;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static signup(String user, String pass, String email) async {
    final url = Uri.parse("${baseUrl}user/signup/$user/$email/$pass");
    final response = await http.post(url);

    try {
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        return (jsonResponse);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static searchCar(car) async {
    var url = Uri.parse("${baseUrl}car/getCarsByModel/$car");

    try {
      final res = await http.put(url);
      print(res.statusCode);
      print(url);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<Cars>> getCars() async {
    final res = await http.get(Uri.parse('${baseUrl}car'));
    return compute(decodeJson, res.body);
  }

  List<Cars> decodeJson(String resBody) {
    final myJson = jsonDecode(resBody);
    return myJson['car'].map<Cars>((json) => Cars.fromJson(json)).toList();
  }
}
