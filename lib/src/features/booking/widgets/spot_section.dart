import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/data/models/parking_location.dart';
import 'widgets.dart';

class ParkingCinema extends StatelessWidget {
  final Location cinema;

  const ParkingCinema({
    Key? key,
    required this.cinema,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: cinema.sections
          .map((SpotSection) => ParkingSpotSection(spots: SpotSection.spots))
          .toList(),
    );
  }
}
