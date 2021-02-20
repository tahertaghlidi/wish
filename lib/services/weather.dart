import './location.dart';
import './networking.dart';

const apiKey = 'e961a7e9bb758d8ed17701e9d68c8aab';
const weatherSiteURL = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  // Future gettingCityWeather(String cityName) async {
  //   var url = '$weatherSiteURL?q=$cityName&appid=$apiKey&units=metric';
  //   NetworkConnection networkConnection = NetworkConnection(url: url);
  //   return await networkConnection.gettingData();
  // }

  Future gettingLocationWeather() async {
    Location location = Location();
    await location.gettingCurrentloc();
    String url =
        '$weatherSiteURL?lat=${location.lat}&lon=${location.lon}&appid=$apiKey&units=metric';
    NetworkConnection networkConnection = NetworkConnection(url: url);
    return await networkConnection.gettingData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'هوا گرم و خوبخ بستنی یادت نره';
    } else if (temp > 20) {
      return 'امروز وقت لباس نازک و تابستونیه';
    } else if (temp < 10) {
      return 'به لباس گرم نیاز داری امروز. حسابی بیرون سرده';
    } else {
      return 'محض احتیاط یه ژاکت بردار';
    }
  }
}
