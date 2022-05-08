import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/constants/app_colors.dart';
import 'package:flutter_movie_app/src/core/data/models/spot.dart';

class ParkingSpotCard extends StatefulWidget {
  const ParkingSpotCard({
    Key? key,
    required this.spot,
  }) : super(key: key);

  final Spot spot;

  @override
  State<ParkingSpotCard> createState() => _ParkingSpotCardState();
}

class _ParkingSpotCardState extends State<ParkingSpotCard> {
  @override
  Widget build(BuildContext context) {
    final color = widget.spot.isHidden
        ? AppColors.primaryBackgroudColor
        : widget.spot.isBusy
            ? Colors.white
            : widget.spot.isSelected
                ? AppColors.principalColor
                : AppColors.secundaryBackgroudColor;
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.spot.isSelected = !widget.spot.isSelected;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 800),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
