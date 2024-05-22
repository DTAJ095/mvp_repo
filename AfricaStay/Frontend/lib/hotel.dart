class Hotel {
  final String hotelName;
  final String location;
  final String address;

  Hotel({
    required this.hotelName,
    required this.location,
    required this.address
});
  factory Hotel.fromJson (Map<String, dynamic> json) {
    return Hotel(
      hotelName: json['hotelName'],
      location: json['location'],
      address: json['address'],
    );
  }
  Map<String, dynamic> toJson () => {
    'hotelName': hotelName,
    'location': location,
    'address': address,
  };
}