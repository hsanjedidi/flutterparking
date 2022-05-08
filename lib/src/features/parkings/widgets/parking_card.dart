import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/data/models/parking.dart';

class ParkingCard extends StatelessWidget {
  const ParkingCard({
    Key? key,
    required this.parking,
  }) : super(key: key);

  final Parking parking;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
                image: AssetImage('assets/images/' + parking.picture),
                fit: BoxFit.fill)),
      ),
    );
  }
}
