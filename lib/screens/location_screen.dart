import 'dart:ui';
import 'package:flutter/material.dart';
import '../services/weather.dart';

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
  int windSpeedDisplay;

  @override
  void initState() {
    super.initState();
    changeUI(widget.locationWeather);
  }

  void changeUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        tempeture = 0;
        weatherIcon = 'خطا';
        weatherMassage = 'نتونستیم مکان شمارو بیابیم شرمنده جنابعالی';
        cityName = 'ناکجاآباد';
        windSpeedDisplay = 0;
        return;
      }
      double temp = weatherData['main']['temp'];
      tempeture = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      weatherMassage = weather.getMessage(tempeture);
      cityName = weatherData['name'];
      var windSpeed = weatherData['wind']['speed'];
      windSpeedDisplay = windSpeed.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDB7C2),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20.0, top: 10.0),
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    '$weatherMassage',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'iransans',
                    ),
                  ),
                ),
                Column(
                  children: [
                    FlatButton(
                      onPressed: () async {
                        var weatherData =
                            await weather.gettingLocationWeather();
                        changeUI(weatherData);
                      },
                      child: Icon(
                        Icons.location_on,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.location_city_sharp,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              height: 220.0,
              width: 220.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/$weatherIcon"),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.circle,
                // color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        '$cityName',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                        ),
                      ),
                      Text(
                        '$tempeture°',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 75,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 110,
                ),
                Expanded(
                  child: bluryContainer(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$windSpeedDisplay',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        Text(
                          'm/s',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'سرعت باد',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget bluryContainer(Widget child) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
        child: Container(
          width: 110,
          height: 70,
          color: Colors.black.withOpacity(0.1),
          child: Center(child: child),
        ),
      ),
    );
  }
}
