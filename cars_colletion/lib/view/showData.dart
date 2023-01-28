import 'package:cars_colletion/model/cars.dart';
import 'package:cars_colletion/model/connectionMongoDB.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future: Cars.getData(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.hasData) {
                    var totalData = snapshot.data.length;
                    print("Total Data" + totalData.toString());
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return displayCard(
                              Cars.fromJson(snapshot.data[index]));
                        });
                  } else {
                    return const Center(
                      child: Text("No Data Available"),
                    );
                  }
                }
              })),
    );
  }

  Widget displayCard(Cars data) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Text("Toy#: ${data.toyNum}"),
        const SizedBox(
          height: 5,
        ),
        Text("Number: ${data.colNum}"),
        const SizedBox(
          height: 5,
        ),
        Text("Model Name: ${data.modelName}"),
        const SizedBox(
          height: 5,
        ),
        Text("Series Name: ${data.series}"),
        const SizedBox(
          height: 5,
        ),
        Text("Series #: ${data.seriesNum}"),
        const SizedBox(
          height: 5,
        ),
        Text("Year: ${data.year}"),
        const SizedBox(
          height: 5,
        ),
        Text("Brand: ${data.brand}"),
        const SizedBox(
          height: 5,
        ),
      ]),
    ));
  }
}
