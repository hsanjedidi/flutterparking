import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/constants/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);
getSpots()async {
  await FirebaseFirestore.instance.collection("SpotSections").get().then((value) {
  List A = value.docs[0].get("A");
  print(A);
  return A;
  });
}
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 1,
      child: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_ios,
            size: 16,
          ),
        ),
        backgroundColor: AppColors.primaryBackgroudColor,
        elevation: 0,
        title: const Text(
          'Select Spots',
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),
    );
  }
}
