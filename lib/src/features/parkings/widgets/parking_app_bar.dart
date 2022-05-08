import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class ParkingAppBar extends StatelessWidget {
  const ParkingAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [

            Text(
              'TUNISIA PARK',
              style: TextStyle(
                color: AppColors.principalColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              'welcome to our park',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const CircleAvatar(
          radius: 23.0,
          backgroundImage: AssetImage('assets/images/perfilFoto.jpg'),
        )
      ],
    );
  }
}
