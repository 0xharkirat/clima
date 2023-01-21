

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/location.dart';


const apiKey = '97afc688398e7069addf4cc712e23535#';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  late double latitude;
  late double longitude;

  void getLocationData () async{
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude =  location.longitude;

    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${apiKey}');

    var weatherData = await networkHelper.getData();
    // print(weatherData);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));

  }
  



  @override
  void initState() {
    super.initState();
    getLocationData();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),

    );
  }
}

// var temperature = decodedData['main']['temp'];
// var condition = decodedData['weather'][0]['id'];
// var cityName = decodedData['name'];
