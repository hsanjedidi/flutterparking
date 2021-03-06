import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/constants/app_colors.dart';
import 'package:flutter_movie_app/src/core/data/models/parking.dart';
import 'package:flutter_movie_app/src/features/booking/booking_page.dart';
import 'package:flutter_movie_app/src/features/parking/animations/slideup_tween.dart';
import 'package:flutter_movie_app/auth/globals.dart' as globals;

import 'animations/opacity_tween.dart';
import 'widgets/parking_description.dart';

class ParkingPage extends StatelessWidget {
  const ParkingPage({
    Key? key,
    required this.parking,
  }) : super(key: key);

  final Parking parking;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrainsts) {
        final w = constrainsts.maxWidth;
        final h = constrainsts.maxHeight;

        return Scaffold(
          backgroundColor: AppColors.primaryBackgroudColor,
          appBar: _appBar(context),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 9,
                      child: ParkingDescription(parking: parking),
                    ),
                    Expanded(
                      flex: 2,
                      child: _parkingTitle(parking.name),
                    ),
                    Divider(
                      color: Colors.grey[800],
                    ),
                    Expanded(
                      flex: 7,
                      child: _synopsisParking(parking.description),
                    )
                  ],
                ),
              ),
              _backgroundGradient(h, w),
              _getReservationButtom(h, w, context)
            ],
          ),
        );
      },
    );
  }

  Widget _getReservationButtom(double h, double w, BuildContext context) {
    var TextB;
    if (globals.isLoggedIn){
      TextB='Get Reservation';
    }
    else TextB='View places';
    return Positioned(
      bottom: h * 0.02,
      left: (w - w * 0.6) / 2,
      child: OpacityTween(
        child: SlideUpTween(
          duration: const Duration(milliseconds: 1800),
          begin: const Offset(-200, 0),
          child: InkWell(
            onTap: () => {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) {
                    return const BookingPage();
                  },
                ),
              )
            },
            child: Container(
              child:  Center(
                child: Text(
                  TextB,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: AppColors.principalColor,
                borderRadius: BorderRadius.circular(50),
              ),
              height: h * 0.08,
              width: w * 0.6,
            ),
          ),
        ),
      ),
    );
  }

  Widget _backgroundGradient(double h, double w) {
    return Positioned(
      bottom: 0,
      height: h * 0.20,
      width: w,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 25,
              spreadRadius: 25,
              blurStyle: BlurStyle.normal,
            )
          ],
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black,
              Colors.black12,
              // Colors.transparent,
              // Colors.transparent,
            ],
          ),
        ),
      ),
    );
  }

  Widget _synopsisParking(String synopsis) {
    return OpacityTween(
      child: SlideUpTween(
        begin: const Offset(0, 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Description',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            RichText(
              maxLines: 7,
              overflow: TextOverflow.fade,
              text: TextSpan(
                text: synopsis,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.7,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _parkingTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: OpacityTween(
        child: SlideUpTween(
          begin: const Offset(0, 200),
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.primaryBackgroudColor,
      title: const Text(
        'Space Details',
        style: TextStyle(fontSize: 15),
      ),
      centerTitle: true,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          size: 16,
        ),
      ),
    );
  }
}
