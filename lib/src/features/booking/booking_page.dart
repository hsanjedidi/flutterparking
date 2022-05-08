import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/constants/app_colors.dart';
import 'package:flutter_movie_app/src/core/data/models/data.dart';
import 'package:flutter_movie_app/src/core/data/models/parking.dart';
import 'package:flutter_movie_app/src/features/booking/animations/buttom_size_animation.dart';
import 'package:flutter_movie_app/src/features/booking/animations/opacity_animation.dart';
import '../../core/data/models/parking_location.dart';
import '../../core/data/models/section_spot.dart';
import '../../core/data/models/spot.dart';
import 'widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_movie_app/auth/globals.dart' as globals;
import 'package:fluttertoast/fluttertoast.dart';

import 'package:firebase_core/firebase_core.dart';
class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}
getSpots()async {
  await FirebaseFirestore.instance.collection("SpotSections").get().then((value) {
    List A = value.docs[0].get("A");
    print(A);
    return A;
  });
}
reserver() async {
  var uid='GNmpacY1hQOMqwV6Lksq';
  var A;
  await FirebaseFirestore.instance.collection("SpotSections").get().then((value) {
    A = value.docs[0].get("A");
    print(A);});
  if (A.length<2){
  var B=A+A.length.toString();
  await FirebaseFirestore.instance.collection("SpotSections").doc(uid).set(
      {'A':B});
  }
  else toaster();
}
annuler() async {
  var uid='GNmpacY1hQOMqwV6Lksq';
  var A;
  await FirebaseFirestore.instance.collection("SpotSections").get().then((value) {
    A = value.docs[0].get("A");
    print(A);});
  var   B = A.substring(0, A.length - 1); // Hello
  await FirebaseFirestore.instance.collection("SpotSections").doc(uid).set(
      {'A':B});

}



//var A;
 toaster(){
Fluttertoast.showToast(
msg: "Parking is reserved",
toastLength: Toast.LENGTH_SHORT,
gravity: ToastGravity.CENTER,
timeInSecForIosWeb: 1,
backgroundColor: Colors.red,
textColor: Colors.white,
fontSize: 16.0
);
}
class _BookingPageState extends State<BookingPage>
    with TickerProviderStateMixin {
  late ButtomSizeAnimationController controller;

  final parking = parkings.first;





  @override
  void initState() {
    //A=getSpots();
    print("********************************************************************************************");
    print(globals.isLoggedIn);
    controller = ButtomSizeAnimationController(
      contentController: AnimationController(
          vsync: this,
          duration: const Duration(
            milliseconds: 750,
          )),
      buttonController: AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 750,
        ),
      ),
    );
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      await controller.buttonController.forward();
      await controller.buttonController.reverse();
      await controller.contentController.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            child: OpacityAnimation(
              animation: controller.inicialOpacityAnimation,
              child: const CustomAppBar(),
            ),
            preferredSize: const Size.fromHeight(kToolbarHeight),
          ),
          backgroundColor: AppColors.primaryBackgroudColor,
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                width: w,
                child: Column(
                  children: [
                    OpacityAnimation(
                      animation: controller.inicialOpacityAnimation,
                      child: _ParkingLayout(h: h, w: w, ),
                    ),
                    OpacityAnimation(
                      animation: controller.endOpatictyAnimation,
                      child: _ButtomPage(height: h * 0.42, parking: parking),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                //left: (w - w * 0.6) / 2,
                child: _ScaleButton(controller: controller, w: w, h: h),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ScaleButton extends StatelessWidget {
  const _ScaleButton({
    Key? key,
    required this.controller,
    required this.w,
    required this.h,
  }) : super(key: key);

  final ButtomSizeAnimationController controller;
  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.buttonController,
      builder: (_, child) {
        final size = controller
            .buttonSizeAnimation(
              begin: Size(w * 0.0, h * 0.0),
              end: Size(w * 1.2, h * 1.1),
            )
            .value;
        final margin = controller.buttomMarginAnimation((h) * 0.02).value;

        return Center(
          child: Container(
            margin: EdgeInsets.only(bottom: margin),
            decoration: BoxDecoration(
                color: AppColors.principalColor,
                borderRadius: BorderRadius.circular(50)),
            height: size.height,
            width: size.width,
            // height: h * 0.08,
            // width: w * 0.6,
          ),
        );
      },
    );
  }
}

class _ParkingLayout extends StatefulWidget {

  const _ParkingLayout({
    Key? key,
    required this.h,
    required this.w,

    //required this.location,
  }) : super(key: key);

  final double h;
  final double w;


  @override
  State<_ParkingLayout> createState() => _ParkingLayoutState();
}
final  List<dynamic> H =[0,1,2,3];

class _ParkingLayoutState extends State<_ParkingLayout> {
  var A;

  Future<String> getSpots() async => await FirebaseFirestore.instance.collection("SpotSections").get().then((value) {
       A = value.docs[0].get("A");
      return A;
    });
  List<Location> parkingLocation = [
    Location(
      name: "A1",
      ailes: 9,
      sections: [
        SpotSection( spots:List.generate(24,
              (index) => Spot(
            isBusy: H.contains(index),
                isSelected: H.contains(index),
                isHidden: [].contains(index),
          ),
        )),
          //  SpotSection( spots: spotsB),
        SpotSection( spots: List.generate(12,
              (index) => Spot(
            isBusy: H.contains(index),
            isHidden: [].contains(index),
          ),
        )),
      ],
    )
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline2!,
      textAlign: TextAlign.center,
      child: FutureBuilder<String>(
        future: getSpots(), // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Result: ${snapshot.data}'),
              )
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ];
          }
          return Padding(
            padding:
            const EdgeInsets.only(top: kToolbarHeight * 1.6, right: 25, left: 25),
            child: Column(
              children: [
                SizedBox(
                  height: widget.h * 0.06,
                  width: widget.w,
                  child: CustomPaint(
                    painter: ScreenPainter(),
                  ),
                ),
                SizedBox(height: widget.h * 0.03),
                SizedBox(
                  width: widget.w,
                  child: ParkingCinema(
                    cinema:  Location(
                      name: "A1",
                      ailes: 9,
                      sections: [
                        SpotSection( spots:List.generate(8,
                              (index) => Spot(
                            isBusy: H.contains(index),
                            isSelected: H.contains(index),
                            isHidden: [].contains(index),
                          ),
                        )),
                        SpotSection( spots:List.generate(2,
                              (index) => Spot(
                            isBusy: A.split('').map(int.parse).toList().contains(index),
                            isSelected: [0,1].contains(index),
                            isHidden: [].contains(index),
                          ),
                        )),
                        //  SpotSection( spots: spotsB),
                        /*SpotSection( spots: List.generate(12,
                              (index) => Spot(
                            isBusy: H.contains(index),
                            isHidden: [].contains(index),
                          ),
                        )),*/
                      ],
                    )
                    ,
                  ),
                ),
                SizedBox(height: widget.h * 0.02),
                const ParkingSpotlabels(),
                SizedBox(height: widget.h * 0.03),
              ],
            ),
          );

        },
      ),
    );
  }
}


  //final Location location;
 /* @override
  Widget build(BuildContext context) {
      return Padding(
      padding:
          const EdgeInsets.only(top: kToolbarHeight * 1.6, right: 25, left: 25),
      child: Column(
        children: [
          SizedBox(
            height: widget.h * 0.06,
            width: widget.w,
            child: CustomPaint(
              painter: ScreenPainter(),
            ),
          ),
          SizedBox(height: widget.h * 0.03),
          SizedBox(
            width: widget.w,
            child: ParkingCinema(
              cinema: parkingLocation[0],
            ),
          ),
          SizedBox(height: widget.h * 0.02),
          const ParkingSpotlabels(),
          SizedBox(height: widget.h * 0.03),
        ],
      ),
    );

  }*/



class _ButtomPage extends StatelessWidget {
  const _ButtomPage({
    Key? key,
    required this.height,
    required this.parking,
  }) : super(key: key);

  final double height;
  final Parking parking;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: const BoxDecoration(
        color: AppColors.secundaryBackgroudColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 22),
          const Text(
            'Select Date and Time',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 30),
          ParkingDates(
            parking: parking,
          ),
          const SizedBox(height: 15),
          ParkingTimes(
            parking: parking,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 25, left: 25, top: 30, bottom: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Total Price',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '5DT',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      )
                    ],
                  ),
                if (globals.isLoggedIn) ... [ // These children are only visible if condition is true

              GestureDetector(
                    onTap: () { print("Container was tapped");reserver();
                    Navigator.pop(context);
                    },
                    child: Container(
                      child: const Center(
                        child: Text(
                          'Book Ticket',
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
                      // height: h * 0.08,
                      width: 150,
                    )
                  ),
                  FloatingActionButton(
                    onPressed : () { annuler();
                      Navigator.pop(context);},
                    backgroundColor: Colors.red,
                    tooltip: 'Annuler La reservation',
                    child: new Icon(Icons.remove),
                  ), // This tr
                ],
    ]
              ),
            ),
          )
        ],
      ),
    );
  }
}
