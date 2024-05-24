class Hotel {
  final String hotelName;
  final String location;
  final String address;

  Hotel(
      this.hotelName,
      this.location,
      this.address,
      );
  factory Hotel.fromMap(Map<String, dynamic> json) {
    return Hotel(
      json['hotelName'],
      json['location'],
      json['address'],
    );
  }
  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      json['hotelName'],
      json['location'],
      json['address']
    );
  }
}