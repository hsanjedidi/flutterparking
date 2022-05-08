import 'package:flutter_movie_app/src/core/data/models/section_spot.dart';
import 'spot.dart';

class Location {
  final String name;
  final int ailes;
  final List<SpotSection> sections;



  Location({
    required this.name,
    required this.ailes,
    required this.sections,
  });
}
