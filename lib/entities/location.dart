class GeoLocation {
  String name;
  double lat;
  double long;

  GeoLocation(this.name, this.lat, this.long);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'latitude': lat,
      'longitude': long,
    };
  }

  static GeoLocation fromMap(Map<String, dynamic> map) {
    return GeoLocation(
      map['name'],
      map['latitude'],
      map['longitude'],
    );
  }
}

GeoLocation TALLINN_LOCATION = GeoLocation('Tallinn', 59.41769, 24.804062);