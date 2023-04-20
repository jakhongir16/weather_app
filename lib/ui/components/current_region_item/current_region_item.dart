import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/provider/weather_provider.dart';
import 'package:weather_app/ui/ui_theme/app_colors.dart';
import 'package:weather_app/ui/ui_theme/app_style.dart';

class CurrentRegionItem extends StatelessWidget {
  const CurrentRegionItem({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherProvider>();
    return InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        width: 382,
        height: 96,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(model.setBg(),),
          ),
          
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CurrentRegionTimeZone(currentCity: model.weatherData?.timezone,
            currentZone: model.weatherData?.timezone,
            ),
            CurrentRegionTemp(
              currentTemp: model.setCurrentTemp(),
              icon: model.setIcon(),
            ),
          ],
        ),
      ),
    );
  }
}


class CurrentRegionTimeZone extends StatelessWidget {
  const CurrentRegionTimeZone({super.key, required this.currentCity, required this.currentZone});


  final String? currentCity, currentZone;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Текущее место', 
          style: AppStyle.fontStyle.copyWith(
          color: AppColors.favoriteColor, 
          fontSize: 12,
           
        ),
        
        ),
        const SizedBox(height: 6,),
        Text(currentZone ?? 'Error', 
        style: AppStyle.fontStyle.copyWith(fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.favoriteColor,
        ),
        ),
        const SizedBox(height: 4,),
        Text(currentCity ?? 'Error', 
        style: AppStyle.fontStyle.copyWith(fontSize: 14,
        
        color: AppColors.favoriteColor,
        ),
        ),
        
      ],
    );
  }
}


class CurrentRegionTemp extends StatelessWidget {
  const CurrentRegionTemp({super.key, required this.currentTemp, required this.icon});
  final String icon;
  final int currentTemp;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(icon),
        Text('$currentTemp °C', 
        style: AppStyle.fontStyle.copyWith(
          fontSize: 18, color: AppColors.favoriteColor
        ),
        ),
      ],
    );
  }
}