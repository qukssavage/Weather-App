import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/domain/provider/weather_provider.dart';
import 'package:weather/ui/components/current_region_item/current_region_item.dart';
import 'package:weather/ui/components/favorite_list/favorite_list.dart';
import 'package:weather/ui/components/search_page_appbar/search_page_appbar.dart';
import 'package:weather/ui/ui_theme/app_colors.dart';
import 'package:weather/ui/ui_theme/app_style.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WeatherSearchBody(),
    );
  }
}

class WeatherSearchBody extends StatelessWidget {
  const WeatherSearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherProvider>();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            model.setBg(),
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchPageAppbar(),
          const SizedBox(height: 28),
          const CurrentRegionItem(),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 23, top: 24, bottom: 16),
              child: Text(
                'Избранное',
                style: AppStyle.fontStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkBlueColor,
                ),
              ),
            ),
          ),
          const FavoriteList(),
        ],
      ),
    );
  }
}
