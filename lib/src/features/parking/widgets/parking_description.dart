import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/data/models/parking.dart';
import 'parking_detail_card.dart';

class ParkingDescription extends StatelessWidget {
  const ParkingDescription({
    Key? key,
    required this.parking,
  }) : super(key: key);
  final Parking parking;

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(height: 15);

    return Row(
      children: [
        _parkingPhoto(parking),
        const SizedBox(width: 25),
        _cardDetails(parking, spacer)
      ],
    );
  }

  Widget _cardDetails(Parking parking, SizedBox spacer) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          const ParkingDetailCard(
            icon: Icons.accessible_forward_outlined,
            iconColor: Colors.white,
            iconSize: 35,
            primaryText: 'Handicap',
            secundaryText: '',
          ),
          spacer,
          const ParkingDetailCard(
            icon: Icons.hdr_auto_sharp,
            iconColor: Colors.white,
            iconSize: 35,
            primaryText: '',
            secundaryText: 'Section A',
          ),
          spacer,
          ParkingDetailCard(
            icon: Icons.star,
            iconColor: Colors.white,
            iconSize: 35,
            primaryText: parking.raiting.toString() + ' / 10',
            secundaryText: 'Raiting',
          ),
        ],
      ),
    );
  }

  Widget _parkingPhoto(Parking parking) {
    return Expanded(
      flex: 4,
      child: Hero(
        tag: parking.picture,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage('assets/images/' + parking.picture),
            ),
          ),
        ),
      ),
    );
  }
}
