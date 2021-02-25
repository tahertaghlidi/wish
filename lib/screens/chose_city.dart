import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../utilities/const.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/choose-city-screen.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.right,
                  decoration: kCityChooseTextField,
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 50),
                child: OutlineButton(
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  child: Text(
                    'بزن ببینیم اینجا هوا چطوره؟',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  borderSide: BorderSide(color: Colors.grey),
                  hoverColor: Colors.white,
                  mouseCursor: MouseCursor.defer,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
