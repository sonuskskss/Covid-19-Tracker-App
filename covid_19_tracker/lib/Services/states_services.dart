import 'dart:convert';

import 'package:covid_19_tracker/Utiltties/App_url.dart';
import 'package:http/http.dart' as http;

import '../Model/world_states_model.dart';

class StatesServices {
  Future<WorldStatesModel> fetchWorldStatesRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());

      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception("Something went wrong");
    }
  }

  Future<List<dynamic>> countriesListApi() async {
    var data;
    final response = await http.get(Uri.parse(AppUrl.contriesList));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());

      return data;
    } else {
      throw Exception("Something went wrong");
    }
  }
}
