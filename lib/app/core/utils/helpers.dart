part of 'utils.dart';

///obtain the weather animation
String getWeatherAnimation(int weatherCode) {
  switch (weatherCode) {
    case 200:
    case 201:
      return AppAnimations.weatherStormShowersDay;
    case 202:
    case 230:
    case 231:
    case 232:
      return AppAnimations.weatherStorm;
    case 210:
    case 211:
    case 212:
    case 221:
      return AppAnimations.weatherThunder;
    case 300:
    case 301:
    case 302:
    case 310:
    case 311:
    case 312:
    case 313:
    case 314:
    case 321:
    case 500:
    case 501:
    case 502:
    case 503:
    case 504:
    case 511:
    case 520:
    case 521:
    case 522:
    case 531:
      return AppAnimations.weatherPartlyShower;
    case 600:
      return AppAnimations.weatherSnowSunny;
    case 601:
    case 602:
    case 611:
    case 612:
    case 613:
    case 615:
    case 616:
    case 620:
    case 621:
    case 622:
      return AppAnimations.weatherSnow;
    case 701:
      return AppAnimations.weatherMist;
    case 741:
      return AppAnimations.foggy;
    case 800:
      return AppAnimations.weatherSunny;
    case 801:
    case 802:
      return AppAnimations.weatherPartlyCloudy;
    case 803:
    case 804:
      return AppAnimations.weatherWindyClouds;
    default:
      return AppAnimations.weatherMist;
  }
}
