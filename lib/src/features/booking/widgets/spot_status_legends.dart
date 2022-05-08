import 'package:flutter/material.dart';
import '../../../core/data/models/data.dart';
import 'widgets.dart';

class ParkingSpotlabels extends StatelessWidget {
  const ParkingSpotlabels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 46),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: seatLabels
            .map(
              (label) => SpotsStatusLabel(
                color: label.color,
                label: label.name,
              ),
            )
            .toList(),
      ),
    );
  }
}
