import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  Chart({Key? key}) : super(key: key);

  final List<Sales> data = [
    Sales(year: "2011", products: 10),
    Sales(year: "2012", products: 20),
    Sales(year: "2013", products: 30),
    Sales(year: "2014", products: 40),
    Sales(year: "2015", products: 50),
  ];

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<Sales, String>> series = [
      charts.Series(
        id: "Products",
        data: widget.data,
        domainFn: (Sales series, _) => series.year,
        measureFn: (Sales series, _) => series.products,
      )
    ];

    return Scaffold(
      backgroundColor: Color(0xff005bc5),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "Data Sensor Suhu",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: charts.BarChart(
                      series,
                      animate: true,
                      barGroupingType: charts.BarGroupingType.grouped,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Jarak antara dua container
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "Data Sensor Lainnya",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: charts.BarChart(
                      series,
                      animate: true,
                      barGroupingType: charts.BarGroupingType.grouped,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Sales {
  final String year;
  final int products;

  Sales({
    required this.year,
    required this.products,
  });
}
