import 'package:covid_19_tracker/Reusable_Row/ReusableRow.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String name;
  String image;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test,
      todayDeaths;

  DetailScreen(
      {required this.name,
      required this.image,
      required this.totalCases,
      required this.totalDeaths,
      required this.totalRecovered,
      required this.active,
      required this.critical,
      required this.todayRecovered,
      required this.test,
      required this.todayDeaths});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Container(
                child: Image.network(
                  widget.image,
                  fit: BoxFit.fill,
                ),
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.height * 0.4,
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .02),
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .05,
                          ),
                          ReusableRow(
                              title: 'Cases',
                              value: widget.totalCases.toString()),
                          ReusableRow(
                              title: 'Deaths',
                              value: widget.totalDeaths.toString()),
                          ReusableRow(
                              title: 'Recovered',
                              value: widget.totalRecovered.toString()),
                          ReusableRow(
                              title: 'Active', value: widget.active.toString()),
                          ReusableRow(
                              title: 'Critical',
                              value: widget.critical.toString()),
                          ReusableRow(
                              title: 'Tests', value: widget.test.toString()),
                          ReusableRow(
                              title: 'Today Deaths',
                              value: widget.todayDeaths.toString()),
                          ReusableRow(
                              title: 'Today Recovered',
                              value: widget.todayRecovered.toString()),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ])));
  }
}
