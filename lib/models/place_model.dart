import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel{
  final int id;
  final String name;
  final LatLng Latlng;

  PlaceModel({
    required this.id,
    required this.name,
    required this.Latlng
});
}
List<PlaceModel> Places = [
  PlaceModel(id: 1, name: "القرية الفرعونيه", Latlng:LatLng(30.002137458712973, 31.203362309073576)),
  PlaceModel(id: 2, name: "كرداسه", Latlng:LatLng(30.03156775411524, 31.11066517153982)),
  PlaceModel(id: 3, name: "ابو رواش", Latlng:LatLng(30.04583384380808, 31.09727558500717)),
];