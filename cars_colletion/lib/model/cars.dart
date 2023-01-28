import 'package:cars_colletion/model/connectionMongoDB.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'dart:convert';

Cars mongoDBFromJson(String str) => Cars.fromJson(jsonDecode(str));
String mongoDBtoJson(Cars data) => jsonEncode(data.toJson());

class Cars {
  Cars({
    required this.id,
    required this.toyNum,
    required this.colNum,
    required this.modelName,
    required this.series,
    required this.seriesNum,
    required this.year,
    required this.brand,
  });

  ObjectId id;
  String toyNum;
  int colNum;
  String modelName;
  String series;
  String seriesNum;
  int year;
  String brand;

  factory Cars.fromJson(Map<String, dynamic> json) => Cars(
      id: json["_id"],
      toyNum: json["Toy#"],
      colNum: json["Col#"],
      modelName: json["ModelName"],
      series: json["Series"],
      seriesNum: json["Series#"],
      year: json["Year"],
      brand: json["Brand"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "Toy#": toyNum,
        "Col#": colNum,
        "ModelName": modelName,
        "Series": series,
        "Series#": seriesNum,
        "Year": year,
        "Brand": brand
      };

  static Future<List<Map<String, dynamic>>> getData() async {
    final listCars = await ConnectionMongoDB.carCollection.find().toList();
    return listCars;
  }
}
