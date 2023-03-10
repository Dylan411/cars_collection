import 'dart:convert';
import 'package:cars_colletion/model/cars.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl =
      "https://carcollectionapi-production.up.railway.app/api/";
  static const backUpUrl = "https://wild-lime-capybara-hat.cyclic.app/api/";

  static String url = '';

  static void verify() async {
    try {
      var testUrl = Uri.parse(baseUrl);
      final res = await http.get(testUrl);
      url = baseUrl;
    } catch (e) {
      url = backUpUrl;
    }
  }

  static getCar({String? query}) async {
    verify();
    List<Cars> listCars = [];

    var testUrl = Uri.parse("${url}car");
    print(url);
    try {
      final res = await http.get(testUrl);

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
    verify();
    List<Cars> listCars = [];

    var testUrl = Uri.parse("${url}car/getCarsById/$user");
    try {
      final res = await http.get(testUrl);

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
    verify();
    var testUrl = Uri.parse("${url}user/insertCar/$user/$car");

    try {
      final res = await http.put(testUrl);
      print(res.statusCode);
      print(url);
    } catch (e) {
      print(e.toString());
    }
  }

  static deleteCar(user, car) async {
    verify();
    var testUrl = Uri.parse("${url}user/deleteCarsById/$user/$car");

    try {
      final res = await http.put(testUrl);
      print(res.statusCode);
      print(url);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<int?> login(String user, String pass) async {
    verify();
    var testUrl = Uri.parse("${url}user/login/$user/$pass");

    try {
      final res = await http.get(testUrl);
      print(res.statusCode);
      print(url);
      return res.statusCode;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static signup(String user, String pass, String email) async {
    verify();
    final testUrl = Uri.parse("${url}user/signup/$user/$email/$pass");
    final response = await http.post(testUrl);

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
    verify();
    var testUrl = Uri.parse("${url}car/getCarsByModel/$car");

    try {
      final res = await http.put(testUrl);
      print(res.statusCode);
      print(url);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<Cars>> getCars() async {
    verify();
    final res = await http.get(Uri.parse('${baseUrl}car'));
    return compute(decodeJson, res.body);
  }

  List<Cars> decodeJson(String resBody) {
    final myJson = jsonDecode(resBody);
    return myJson['car'].map<Cars>((json) => Cars.fromJson(json)).toList();
  }
}
