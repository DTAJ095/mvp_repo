import 'package:json_annotation/json_annotation.dart';
import 'hotel_data.dart';
part 'hotel.g.dart';

@JsonSerializable()
class Hotel {
  Hotel({
    required this.data,
});
  Data data;

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
  Map<String, dynamic> toJson() => _$HotelToJson(this);
  /*factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
      data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };*/
}