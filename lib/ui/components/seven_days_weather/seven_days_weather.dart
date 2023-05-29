import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/domain/provider/weather_provider.dart';
import 'package:weather/ui/ui_theme/app_colors.dart';
import 'package:weather/ui/ui_theme/app_style.dart';

class SevenDaysWeather extends StatelessWidget {
  const SevenDaysWeather({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<WeatherProvider>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 34),
      height: 380,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.sevenDaysColor,
      ),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 0),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return SevenDaysWidget(
            text: model.date[index],
            dailyIcon: model.setDailyIcons(index),
            dayTemp: model.setDayTemp(index),
            nightTemp: model.setNightTemp(index),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 17),
        itemCount: 7,
      ),
    );
  }
}

class SevenDaysWidget extends StatelessWidget {
  const SevenDaysWidget({
    super.key,
    required this.text,
    required this.dailyIcon,
    this.dayTemp = 0,
    this.nightTemp = 0,
  });

  final String text;
  final String dailyIcon;
  final int dayTemp;
  final int nightTemp;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: 150,
          child: Text(
            text,
            style: AppStyle.fontStyle.copyWith(color: AppColors.darkBlueColor),
          ),
        ),
        const SizedBox(width: 30),
        Image.network(dailyIcon, width: 30, height: 30),
        const SizedBox(width: 20),
        Text(
          '$dayTemp°C',
          style: AppStyle.fontStyle.copyWith(color: AppColors.darkBlueColor),
        ),
        const SizedBox(width: 10),
        Text(
          '$nightTemp°C',
          style: AppStyle.fontStyle,
        ),
      ],
    );
  }
}
