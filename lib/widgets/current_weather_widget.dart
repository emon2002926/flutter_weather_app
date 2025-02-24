import 'package:flutter/material.dart';
import 'package:flutter_weather_app/model/weather_data_current.dart';
import 'package:flutter_weather_app/utils/app_colors.dart';

class CurrentWeatherWidget extends StatelessWidget {

  final WeatherDataCurrent weatherDataCurrent ;

  const CurrentWeatherWidget({super.key, required this.weatherDataCurrent});


  @override
  Widget build(BuildContext context) {
    return  Column(

      children: [
        temperatureAreaWidget(),
        const SizedBox(height: 20,),
        currentWeatherMoreDetailsWidget()
      ],
    );
  }



  Widget temperatureAreaWidget(){

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset("assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
          height: 80,
          width: 80,),
        Container(
          width: 1,
          height: 50,
          color: CustomColors.dividerLine,
        ),
        RichText(
          text: TextSpan(
              children: [
                TextSpan(text: "${weatherDataCurrent.current.temp!.toInt()}°",
                    style: const TextStyle(
                        color: CustomColors.textColorBlack,
                        fontSize: 68,
                        fontWeight: FontWeight.w600
                    )),
                TextSpan(text: "${weatherDataCurrent.current.weather![0].description}°",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                    ))
              ]
          ),)
      ],
    );

  }
  Widget currentWeatherMoreDetailsWidget(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset("assets/icons/windspeed.png"),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset("assets/icons/clouds.png"),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset("assets/icons/humidity.png"),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 60,
              height: 20,
              child:
              Text("${weatherDataCurrent.current.windSpeed}km/h",
                style: const TextStyle(
                    fontSize: 12,
                    color: CustomColors.textColorBlack
                ),
                textAlign: TextAlign.center,
              ),
            )
            ,
            SizedBox(
              width: 60,
              height: 20,
              child:
              Text("${weatherDataCurrent.current.clouds}%",
                style: const TextStyle(
                  fontSize: 12,
                  color: CustomColors.textColorBlack,
                ),
                textAlign: TextAlign.center,
              )),
            SizedBox(
              width: 60,
              height: 20,
              child:
              Text("${weatherDataCurrent.current.humidity}%",
                style: const TextStyle(
                    fontSize: 12,
                    color: CustomColors.textColorBlack
                ),
                textAlign: TextAlign.center,
              ))

          ],
        )
      ],
    );
  }
}
