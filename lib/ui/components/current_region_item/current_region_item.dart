import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:weather/domain/provider/weather_provider.dart';
import 'package:weather/ui/ui_theme/app_colors.dart';
import 'package:weather/ui/ui_theme/app_style.dart';

class CurrentRegionItem extends StatelessWidget {
  const CurrentRegionItem({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherProvider>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            model.setBg(),
          ),
        ),
      ),
      width: 382,
      height: 96,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CurrentRegionTimeZone(
            currentCity: model.currentZone,
            currentZone: model.weatherData?.timezone,
          ),
          CurrentRegionTemp(
            icon: model.iconData(),
            currentTemp: model.setCurrentTemp(),
          ),
        ],
      ),
    );
  }
}

class CurrentRegionTimeZone extends StatelessWidget {
  const CurrentRegionTimeZone({
    super.key,
    required this.currentCity,
    required this.currentZone,
  });

  final String? currentCity, currentZone;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 4),
        Text(
          'Текушее место',
          style: AppStyle.fontStyle.copyWith(
            color: AppColors.darkBlueColor,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          currentZone ?? 'Error',
          style: AppStyle.fontStyle.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.darkBlueColor,
              fontSize: 18),
        ),
        const SizedBox(height: 4),
        Text(
          currentCity ?? 'Error',
          style: AppStyle.fontStyle.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.darkBlueColor,
              fontSize: 18),
        ),
      ],
    );
  }
}

class CurrentRegionTemp extends StatelessWidget {
  const CurrentRegionTemp(
      {super.key, required this.icon, required this.currentTemp});

  final String icon;
  final int currentTemp;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(icon),
        Text(
          '$currentTemp °C',
          style: AppStyle.fontStyle.copyWith(
            fontSize: 18,
            color: AppColors.darkBlueColor,
          ),
        ),
      ],
    );
  }
}
