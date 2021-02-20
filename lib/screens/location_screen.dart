import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wish/services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int tempeture;
  String weatherIcon;
  String weatherMassage;
  String cityName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeUI(widget.locationWeather);
  }

  void changeUI(weatherData) {
    setState(() {
      if (weatherData == null) {
        tempeture = 0;
        weatherIcon = 'خطا';
        weatherMassage = 'نتونستیم مکان شمارو بیابیم شرمنده جنابعالی';
        cityName = 'ناکجاآباد';
        return;
      }
      double temp = weatherData['main']['temp'];
      tempeture = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      weatherMassage = weather.getMessage(tempeture);
      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Color(0xFFFDB7C2),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: Text(
                      '$weatherMassage',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: 'iransans',
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      FlatButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.near_me,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.near_me,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Text('$weatherIcon'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('$cityName'),
                      Text('$tempeture'),
                    ],
                  ),
                  Container(
                    child: bluryContainer(Text('windyyy')),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget bluryContainer(Widget child) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
        child: Container(
          width: 90,
          height: 70,
          color: Colors.black.withOpacity(0.1),
          child: Center(child: child),
        ),
      ),
    );
  }
}
