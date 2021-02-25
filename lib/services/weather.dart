import './location.dart';
import './networking.dart';
import '../services/api.dart';

class WeatherModel {
  Future<dynamic> gettingCityWeather(String cityName) async {
    var url = '$weatherSiteURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkConnection networkConnection = NetworkConnection(url: url);
    var weatherData = await networkConnection.gettingData();
    return weatherData;
  }

  Future<dynamic> gettingLocationWeather() async {
    Location location = Location();
    await location.gettingCurrentloc();
    String url =
        '$weatherSiteURL?lat=${location.lat}&lon=${location.lon}&appid=$apiKey&units=metric';
    NetworkConnection networkConnection = NetworkConnection(url: url);
    var weatherData = await networkConnection.gettingData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'cloudlight.jpg';
    } else if (condition < 400) {
      return 'cloudwithrain.jpg';
    } else if (condition < 600) {
      return 'umbrella.jpg';
    } else if (condition < 700) {
      return 'snowman.jpg';
    } else if (condition < 800) {
      return 'fog.jpg';
    } else if (condition == 800) {
      return 'hot.jpg';
    } else if (condition <= 804) {
      return 'cold.jpg';
    } else {
      return 'panic.jpg';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'هوا گرم و خوبه بستنی یادت نره';
    } else if (temp > 20) {
      return 'امروز وقت لباس نازک و تابستونیه';
    } else if (temp < 10) {
      return 'به لباس گرم نیاز داری امروز. حسابی بیرون سرده';
    } else {
      return 'محض احتیاط یه ژاکت بردار';
    }
  }
}
