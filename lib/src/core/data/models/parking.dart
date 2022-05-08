// TODO Implement this library.import 'parking_location.dart';
import 'parking_location.dart';
import 'parking_date.dart';

class Parking {
  final String name;
  final String description;
  final String picture;
  final String gender;
  final String duractionMinutes;
  final double raiting;
  //final Location location;
  final ParkingDate dates;

  Parking({
    required this.name,
    required this.description,
    required this.picture,
    required this.gender,
    required this.duractionMinutes,
    required this.raiting,
    //required this.location,
    required this.dates,
  });
}
