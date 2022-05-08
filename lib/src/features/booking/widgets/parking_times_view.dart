import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/data/models/parking.dart';
import 'package:flutter_movie_app/src/core/data/models/parking.dart';
import '../../../core/data/models/parking.dart';
import 'widgets.dart';

class ParkingTimes extends StatefulWidget {
  const ParkingTimes({
    Key? key,
    required this.parking,
  }) : super(key: key);

  final Parking parking;

  @override
  State<ParkingTimes> createState() => _ParkingTimesState();
}

class _ParkingTimesState extends State<ParkingTimes> {
  final pageController = PageController(viewportFraction: 0.19, initialPage: 3);
  double? page = 0;

  void _listenScroll() {
    setState(() {
      page = pageController.page;
    });
  }

  @override
  void initState() {
    pageController.addListener(() {
      _listenScroll();
    });
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _listenScroll();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: PageView.builder(
        controller: pageController,
        itemCount: widget.parking.dates.times.length,
        itemBuilder: (_, index) {
          return ParkingTimeCard(
            time: widget.parking.dates.times[index],
            isSelected: page == index,
          );
        },
        onPageChanged: (page) {
          pageController.animateToPage(
            page,
            duration: const Duration(milliseconds: 400),
            curve: Curves.bounceOut,
          );
        },
      ),
    );
  }
}
