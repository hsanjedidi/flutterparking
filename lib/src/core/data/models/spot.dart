class Spot {
  final bool isBusy;
  final bool isHidden;
  late bool isSelected;

  Spot({
    required this.isBusy,
    required this.isHidden,
    this.isSelected = false,
  });
  // receiving data from server
  factory Spot.fromMap(map) {
    return Spot(
      isBusy: map['isBusy'],
      isHidden: map['isHidden'],
      isSelected: map['isSelected'],
    );
  }
  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'isBusy': isBusy,
      'isHidden': isHidden,
      'isSelected': isSelected,
    };
  }
}
