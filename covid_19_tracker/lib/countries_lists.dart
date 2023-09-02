import 'package:covid_19_tracker/Services/states_services.dart';
import 'package:covid_19_tracker/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

StatesServices statesServices1 = StatesServices();

class CountriesListsScreen extends StatefulWidget {
  const CountriesListsScreen({super.key});

  @override
  State<CountriesListsScreen> createState() => _CountriesListsScreenState();
}

class _CountriesListsScreenState extends State<CountriesListsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    statesServices1.countriesListApi();
  }

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "S T A Y     S A F E",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.blue),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, left: 8.0, right: 8.0, bottom: 8.0),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: searchController,
                  decoration: InputDecoration(
                      // suffix: Icon(Icons.search),
                      hintText: "Search with country name",
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
              Expanded(
                  child: FutureBuilder(
                      future: statesServices1.countriesListApi(),
                      builder:
                          (context, AsyncSnapshot<List<dynamic>> snapshot) {
                        if (!snapshot.hasData) {
                          return ListView.builder(
                              itemCount: 100,
                              itemBuilder: (context, index) {
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey.shade700,
                                  highlightColor: Colors.grey.shade100,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Container(
                                          height: 10,
                                          width: 90,
                                          color: Colors.white,
                                        ),
                                        subtitle: Container(
                                          height: 10,
                                          width: 90,
                                          color: Colors.white,
                                        ),
                                        leading: Container(
                                          height: 50,
                                          width: 50,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              });
                        } else {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                String name = snapshot.data![index]['country'];

                                if (searchController.text.isEmpty) {
                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => DetailScreen(
                                                      image: snapshot.data![index]
                                                              ['countryInfo']
                                                          ['flag'],
                                                      name: snapshot.data![index]
                                                          ['country'],
                                                      totalCases:
                                                          snapshot.data![index]
                                                              ['cases'],
                                                      totalRecovered:
                                                          snapshot.data![index]
                                                              ['recovered'],
                                                      totalDeaths:
                                                          snapshot.data![index]
                                                              ['deaths'],
                                                      active: snapshot.data![index]
                                                          ['active'],
                                                      test: snapshot.data![index]['tests'],
                                                      todayRecovered: snapshot.data![index]['todayRecovered'],
                                                      critical: snapshot.data![index]['critical'],
                                                      todayDeaths: snapshot.data![index]['todayDeaths'])));
                                        },
                                        child: ListTile(
                                          title: Text(snapshot.data![index]
                                                  ['country']
                                              .toString()),
                                          subtitle: Text(snapshot.data![index]
                                                  ['cases']
                                              .toString()),
                                          leading: snapshot.data![index]
                                                      ['countryInfo']['flag'] ==
                                                  null
                                              ? Text('fsdf')
                                              : Image(
                                                  height: 50,
                                                  width: 50,
                                                  image: NetworkImage(snapshot
                                                          .data![index]
                                                      ['countryInfo']['flag'])),
                                        ),
                                      )
                                    ],
                                  );
                                } else if (name.toLowerCase().contains(
                                    searchController.text.toLowerCase())) {
                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailScreen(
                                                        image: snapshot.data![
                                                                    index]
                                                                ['countryInfo']
                                                            ['flag'],
                                                        name: snapshot
                                                                .data![index]
                                                            ['country'],
                                                        totalCases: snapshot
                                                                .data![index]
                                                            ['cases'],
                                                        totalRecovered: snapshot
                                                                .data![index]
                                                            ['recovered'],
                                                        totalDeaths: snapshot
                                                                .data![index]
                                                            ['deaths'],
                                                        active: snapshot
                                                                .data![index]
                                                            ['active'],
                                                        test: snapshot
                                                                .data![index]
                                                            ['tests'],
                                                        todayRecovered: snapshot
                                                                .data![index]
                                                            ['todayRecovered'],
                                                        critical: snapshot
                                                                .data![index]
                                                            ['critical'],
                                                        todayDeaths: snapshot
                                                                .data![index]
                                                            ['todayDeaths'],
                                                      )));
                                        },
                                        child: ListTile(
                                          title: Text(
                                            snapshot.data![index]['country']
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                          subtitle: Text(
                                            snapshot.data![index]['cases']
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                          leading: Image(
                                              height: 50,
                                              width: 50,
                                              image: NetworkImage(
                                                  snapshot.data![index]
                                                      ['countryInfo']['flag'])),
                                        ),
                                      )
                                    ],
                                  );
                                } else {
                                  return Container();
                                }
                              });
                        }
                      }))
            ],
          ),
        ));
  }
}
