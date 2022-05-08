import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/data/models/parking.dart';
import 'package:flutter_movie_app/src/core/data/models/parking_date.dart';
import 'widgets.dart';

class ParkingDates extends StatefulWidget {
  const ParkingDates({
    Key? key,
    required this.parking,
  }) : super(key: key);

  final Parking parking;

  @override
  State<ParkingDates> createState() => _ParkingDatesState();
}

class _ParkingDatesState extends State<ParkingDates> {
  final pageController =
      PageController(viewportFraction: 0.165, initialPage: 5);
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
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _listenScroll();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final parkingDates = List.generate(
        31,
        (index) => ParkingDate(
              'Mar',
              index + 1,
              widget.parking.dates.times,
            ));
    return SizedBox(
      height: 83,
      child: PageView.builder(
        onPageChanged: (page) {
          pageController.animateToPage(
            page,
            duration: const Duration(milliseconds: 400),
            curve: Curves.bounceOut,
          );
        },
        itemBuilder: (_, index) {
          double opacity = 1;
          if (pageController.position.haveDimensions) {
            opacity = index.toDouble() + 1 - (pageController.page!);
            opacity = (opacity).clamp(0, 2);
            if (opacity > 1) opacity = 0;
          }
          return ParkingDateOval(
            opacity: opacity,
            date: parkingDates[index],
            isSelected: index == page,
          );
        },
        itemCount: 31,
        controller: pageController,
      ),
    );
  }
}
