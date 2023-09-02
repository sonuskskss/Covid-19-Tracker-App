import 'dart:core';

class AppUrl {
  //This is our base url
  static const String baseUrl = "https://disease.sh/v3/covid-19/";

  //Fetch world covid states

  static const String worldStatesApi = "${baseUrl}all";
  static const String contriesList = "${baseUrl}countries";
}
