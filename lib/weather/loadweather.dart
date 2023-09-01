import 'package:flutter/material.dart';
import 'package:profile_app/weather/loaddata.dart';
import 'package:profile_app/weather/weather.dart';

class LoadWeather extends StatefulWidget {
  const LoadWeather({super.key});

  @override
  State<LoadWeather> createState() => _LoadWeatherState();
}

class _LoadWeatherState extends State<LoadWeather> {
  String? temp;
  String? hum;
  String? air_speed;
  String? des;
  String? main;
  void startApp() async {
    weatherdata instance = weatherdata(location: "Dhar");
    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    //  if (!mounted) return;
    // Navigator.pushReplacementNamed(
    //   context,
    //   MaterialPageRoute(builder:(contex)=>Weather( arguments: {
    //   "temp_value": temp,
    //   "hum_value": hum,
    //   "air_speed_value": air_speed,
    //   "des_value": des,
    //   "main_value": main
    // }))
    // );
  }

  @override
  void initState() {
    // TODO: implement initState

    startApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text("Loading")),
    );
  }
}
