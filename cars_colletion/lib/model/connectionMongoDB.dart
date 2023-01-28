import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';

class ConnectionMongoDB {
  static const MONGO_CONN_URL =
      "mongodb+srv://DLN:1234@dln.aoi5wkx.mongodb.net/CarsColletionDB?retryWrites=true&w=majority";
  static const CARS_COLLECTION = "cars";
  static var db, carCollection;

  static connect() async {
    try {
      db = await Db.create(MONGO_CONN_URL);
      await db.open();
      inspect(db);
      carCollection = db.collection(CARS_COLLECTION);
      print('funko');
    } catch (e) {
      print('Error: ');
      print(e);
    }
  }
}
