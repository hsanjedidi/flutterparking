import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/constants/app_colors.dart';
import 'package:flutter_movie_app/src/core/constants/constants.dart';
import 'package:flutter_movie_app/src/features/parkings/widgets/parkings_view.dart';
import '../../core/data/models/user.dart';
import 'widgets/widgets.dart';


  class ParkingPages extends StatefulWidget {
    bool name=true;
   ParkingPages( {Key? key,required this.name} ) : super(key: key);

  @override
  _ParkingPagesState createState() => _ParkingPagesState();
  }

  class _ParkingPagesState extends State<ParkingPages> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  final double spacerHight = 18;


  @override
  void initState() {
  super.initState();
  FirebaseFirestore.instance
      .collection("users")
      .doc(user!.uid)
      .get()
      .then((value) {
  this.loggedInUser = UserModel.fromMap(value.data());
  setState(() {});
  });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        //final w = constraints.maxWidth;
        final h = constraints.maxHeight;
        return SafeArea(
          child: Container(
            color: AppColors.primaryBackgroudColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                appBar: const PreferredSize(
                  child: ParkingAppBar(),
                  preferredSize: Size.fromHeight(kToolbarHeight),
                ),
                backgroundColor: AppColors.primaryBackgroudColor,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: spacerHight),
                    ParkingQuoteBar(height: h * 0.075),
                    SizedBox(height: spacerHight),
                    const ParkingCategories(),
                    SizedBox(height: spacerHight),
                    const Text(
                      'Our spaces: ',
                      style: titleSecound,
                    ),
                    const Expanded(
                      child: ParkingsView(),
                    ),
                    // IdentifierParkingSelecter(),
                  ],
                ),
                bottomNavigationBar: const BottomBar(),
              ),
            ),
          ),
        );
      },
    );
  }
}
