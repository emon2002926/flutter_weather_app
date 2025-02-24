import 'package:flutter_weather_app/api/fetch_weather.dart';
import 'package:flutter_weather_app/model/weather_data.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {

  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt _cardIndex = 0.obs;

  RxBool checkLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;

  final weatherData = WeatherData().obs;
  WeatherData getWeatherData(){
   return weatherData.value;
  }
  @override
  void onInit() {
    // TODO: implement onInit
    if(_isLoading.isTrue) {
      getLocation();
      }else{
      getIndex();
    }
    super.onInit();
  }
  getLocation()async{

    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    //return if service is not enabled
    if(!isServiceEnabled){
      return Future.error("Location services are disabled");}

    //Status of premission
    locationPermission  = await Geolocator.checkPermission();

    if(locationPermission == LocationPermission.deniedForever){
      return Future.error("Location permissions are permanently denied");

    }else if(locationPermission == LocationPermission.denied){
      locationPermission = await Geolocator.requestPermission();
      //request permission
      if(locationPermission == LocationPermission.denied){
       return Future.error("Location not enabled");}
    }

    //get current location
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((value){
          _latitude.value = value.latitude;
          _longitude.value = value.longitude;
          return FetchWeather().prossesData(_latitude, _longitude).then((onValue){
            weatherData.value = onValue;
            _isLoading.value = false;

          });

    });
  }

  RxInt getIndex() => _cardIndex;
}