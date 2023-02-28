import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Cars {
  String id;
  String toyNum;
  int colNum;
  String modelName;
  String series;
  String seriesNum;
  int year;
  String brand;
  String version;
  String image;

  Cars(
      {required this.id,
      required this.toyNum,
      required this.colNum,
      required this.modelName,
      required this.series,
      required this.seriesNum,
      required this.year,
      required this.brand,
      required this.version,
      required this.image});

  factory Cars.fromJson(Map<String, dynamic> json) => Cars(
      id: json["_id"],
      toyNum: json["ToyNum"],
      colNum: json["ColNum"],
      modelName: json["ModelName"],
      series: json["Series"],
      seriesNum: json["SeriesNum"],
      year: json["Year"],
      brand: json["Brand"],
      version: json["Version"],
      image: json["Img"]);
}
