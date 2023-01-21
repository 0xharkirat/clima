import 'dart:convert';

import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocation () async{
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }
  
  void getData() async {
    http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=97afc688398e7069addf4cc712e23535'));


    if (response.statusCode == 200){
      String data = response.body;
      var decodedData = jsonDecode(data);
      
      var temperature = decodedData['main']['temp'];
      var condition = decodedData(data)['weather'][0]['id'];
      var cityName = decodedData['name'];

      print(temperature);
      print(condition);
      print(cityName);

    } else{
      print(response.statusCode);
    }


  }


  @override
  void initState() {
    super.initState();
    getLocation();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(

    );
  }
}
