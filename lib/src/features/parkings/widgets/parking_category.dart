import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/constants/app_colors.dart';
import 'package:flutter_movie_app/src/core/constants/constants.dart';
import 'package:flutter_movie_app/src/features/parkings/widgets/categories_bar.dart';

class ParkingCategories extends StatelessWidget {
  const ParkingCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'vehicle category',
              style: TextStyle(
                color: AppColors.principalColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        const CategoriesBar(),
      ],
    );
  }
}
