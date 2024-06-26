import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Data {
  Data({
    required this.hotelName,
    required this.location,
    required this.address,
    required this.standing,
    required this.image,
    required this.description,
  });

  /*@JsonKey(name: 'hotel_name')
  String hotelName;
  @JsonKey(name: 'location')
  String location;
  @JsonKey(name: 'address')
  String address;
  @JsonKey(name: 'standing')
  String standing;
  String image;
  @JsonKey(name: 'description')
  String description;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);*/

  String hotelName;
  String location;
  String address;
  String standing;
  String image;
  String description;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    hotelName: json["hotel_name"],
    location: json["location"],
    address: json["address"],
    standing: json["standing"],
    image: json["image"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "hotel_name": hotelName,
    "location": location,
    "address": address,
    "standing": standing,
    "image": image,
    "description": description,
  };
}