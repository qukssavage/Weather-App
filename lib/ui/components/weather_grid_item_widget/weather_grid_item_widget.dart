import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:weather/domain/provider/weather_provider.dart';
import 'package:weather/ui/ui_theme/app_colors.dart';
import 'package:weather/ui/ui_theme/app_style.dart';

class WeatherGridItemWidget extends StatelessWidget {
  const WeatherGridItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherProvider>();
    return GridView.builder(
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: AppColors.sevenDaysColor,
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 57),
            leading: SvgPicture.asset(
              WeatherGridIcons.weatherGridIcons[index],
            ),
            title: Text(
              '${model.setValues(index)} ${WeatherGridUnits.weatherGridUnits[index]}',
              style: AppStyle.fontStyle.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
            subtitle: Text(
              WeatherGridDescription.weatherGridDescription[index],
              style: AppStyle.fontStyle.copyWith(
                color: AppColors.darkBlueColor,
                fontSize: 10,
              ),
            ),
          ),
        );
      },
      itemCount: 4,
    );
  }
}

class WeatherGridIcons {
  static List<String> weatherGridIcons = [
    'assets/icons/wind_speed.svg',
    'assets/icons/thermometer.svg',
    'assets/icons/raindrops.svg',
    'assets/icons/visibility.svg',
  ];
}

class WeatherGridDescription {
  static List<String> weatherGridDescription = [
    'Скорость ветра',
    'Ощущается',
    'Влажность',
    'Видимость',
  ];
}

class WeatherGridUnits {
  static List<String> weatherGridUnits = [
    'км/ч',
    '˚',
    '%',
    'км',
  ];
}
