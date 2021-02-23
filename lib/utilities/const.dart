import 'package:flutter/material.dart';

const kCityChooseTextField = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(Icons.location_city_outlined, color: Colors.white),
    hintText: '!شهر مورد نظر رو وارد کن',
    hintStyle: TextStyle(color: Colors.grey),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide.none));
