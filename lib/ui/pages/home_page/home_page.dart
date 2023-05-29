import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/domain/provider/weather_provider.dart';
import 'package:weather/ui/components/current_weather_status/current_weather_status.dart';
import 'package:weather/ui/components/max_min_temp/max_min_temp.dart';
import 'package:weather/ui/components/seven_days_weather/seven_days_weather.dart';
import 'package:weather/ui/components/sun_widget/sun_widget.dart';
import 'package:weather/ui/components/weather_appbar/weather_appbar.dart';
import 'package:weather/ui/components/weather_grid_item_widget/weather_grid_item_widget.dart';
import 'package:weather/ui/pages/splash_page/splash_page.dart';
import 'package:weather/ui/ui_theme/app_colors.dart';
import 'package:weather/ui/ui_theme/app_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<WeatherProvider>(context).setUp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const HomePageWidget();
          } else {
            return const SplashPage();
          }
        },
      ),
    );
  }
}

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<WeatherProvider>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(model.setBg()),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          const WeatherAppBar(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              children: [
                Text(
                  '${model.date.last} ${model.currentTime}',
                  textAlign: TextAlign.center,
                  style: AppStyle.fontStyle.copyWith(
                    color: AppColors.darkBlueColor,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 36),
                const CurrentWeatherStatus(),
                const SizedBox(height: 28),
                Text(
                  '${model.setCurrentTemp()}°C',
                  textAlign: TextAlign.center,
                  style: AppStyle.fontStyle.copyWith(
                    color: AppColors.darkBlueColor,
                    fontSize: 90,
                  ),
                ),
                const SizedBox(height: 18),
                const MaxMinTemp(),
                const SizedBox(height: 40),
                const SevenDaysWeather(),
                const SizedBox(height: 28),
                const SizedBox(
                  height: 395,
                  child: WeatherGridItemWidget(),
                ),
                const SizedBox(height: 30),
                const SunWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
