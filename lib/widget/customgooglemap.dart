import 'package:flutter/material.dart';
import 'package:fluttermaps/utils/locationservice.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPostion;

  late LocationService locationService;
  @override
  void initState() {
    initialCameraPostion = const CameraPosition(
        zoom: 17, target: LatLng(31.187084851056554, 29.928110526889437));
    locationService = LocationService();
    updateLocation();
    super.initState();
  }

  GoogleMapController? googleMapController;

  Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: markers,
      zoomControlsEnabled: false,
      onMapCreated: (controller) {
        googleMapController = controller;
      },
      initialCameraPosition: initialCameraPostion,
    );
  }

  // void initMapStyle() async {
  //   var nightMapStyle = await DefaultAssetBundle.of(context)
  //       .loadString('assets/map_styles/night_map_style.json');
  //
  //   googleMapController!.setMapStyle(nightMapStyle);
  // }

  void updateLocation() async {
    await locationService.checkAndRequestLocationService();
    var hasPermission =
    await locationService.checkAndRequestLocationPermission();
    if (hasPermission) {
      locationService.getRealTimeLocation((locationData) {
        setMyMarker(locationData);
        setMyCamera(locationData);
      });
    } else {}
  }

  void setMyCamera(LocationData locationData) {
    var camerPosition = CameraPosition(
        target: LatLng(locationData.latitude!, locationData.longitude!),
        zoom: 15);

    googleMapController
        ?.animateCamera(CameraUpdate.newCameraPosition(camerPosition));
  }

  void setMyMarker(LocationData locationData) {
    var myLocationMarker = Marker(
        markerId: const MarkerId('my_location_marker'),
        position: LatLng(locationData.latitude!, locationData.longitude!));

    markers.add(myLocationMarker);
    setState(() {});
  }
}


// display
