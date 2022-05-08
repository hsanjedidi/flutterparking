import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/constants/app_colors.dart';
import 'package:flutter_movie_app/src/features/parking/animations/opacity_tween.dart';
import 'package:flutter_movie_app/src/features/parking/animations/slideup_tween.dart';

class ParkingQuoteBar extends StatelessWidget {
  const ParkingQuoteBar({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;
  final TextStyle textStyle = const TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: OpacityTween(
        child: SlideUpTween(
          begin: const Offset(-100, 0),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.secundaryBackgroudColor,
            ),
            child: const Text(
              'Life is a journey, but don\'t worry, you\'ll find a parking spot at the end',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          )  ,
        ),
      ),
    );
  }
}
