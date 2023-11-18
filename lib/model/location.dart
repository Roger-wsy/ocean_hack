class Location {
  final String noStation;
  final String state;
  final String locationName;
  final double longitude;
  final double latitude;

  Location({
    required this.noStation,
    required this.state,
    required this.locationName,
    required this.longitude,
    required this.latitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      noStation: json['No Station'] as String,
      state: json['State'] as String,
      locationName: json['Location'] as String,
      longitude: double.parse(json['Longitude'] as String),
      latitude: double.parse(json['Latitude'] as String),
    );
  }
}
