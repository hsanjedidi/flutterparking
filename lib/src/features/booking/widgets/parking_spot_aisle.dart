import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/data/models/spot.dart';
import 'widgets.dart';

class ParkingSpotSection extends StatelessWidget {
  const ParkingSpotSection({
    Key? key,
    required this.spots,
  }) : super(key: key);

  final List<Spot> spots;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          padding: const EdgeInsets.only(top: 0),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: spots.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (_, index) {
            final spot = spots[index];
            return ParkingSpotCard(spot: spot);
          },
        ),
      ),
    );
  }
}
