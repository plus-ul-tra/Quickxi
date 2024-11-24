import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:quickxi_app/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'cargo.dart';

class MapMain extends StatefulWidget {
  const MapMain({super.key});

  @override
  State<MapMain> createState() => _MapMainState();
}

class _MapMainState extends State<MapMain> {
  final locationController = Location();

  static const sourLocation = LatLng(37.282470, 127.900079);
  static const destLocation = LatLng(37.280129, 127.9120728);

  LatLng? currentPosition= LatLng(37.282470, 127.900079);
  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) async => await initializeMap());
  }

  Future<void> initializeMap() async {
    await fetchLocationUpdates();
    final coordinates = await fetchPolylinePoints();
    generatePolyLineFromPoints(coordinates);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Quicxi',
        style: TextStyle(color: Colors.white),),
      backgroundColor: const Color.fromARGB(255, 0, 68, 2),
    ),
    body:Column(
      children: [
      currentPosition == null
        ? const Center(child: CircularProgressIndicator())
        :Container(
      height: 450,
      child: GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: sourLocation,
        zoom: 15,
      ),
      markers: {
        Marker(
          markerId: const MarkerId('currentLocation'),
          icon: BitmapDescriptor.defaultMarker,
          position: currentPosition!,
        ),
        const Marker(
          markerId: MarkerId('sourceLocation'),
          icon: BitmapDescriptor.defaultMarker,
          position: sourLocation,
        ),
        const Marker(
          markerId: MarkerId('destinationLocation'),
          icon: BitmapDescriptor.defaultMarker,
          position: destLocation,
        )
      },
      polylines: Set<Polyline>.of(polylines.values),
    ),
    ),
        Expanded(
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(

                color: const Color.fromARGB(255, 0, 68, 2),
                width:40,
              ),
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                    children: [
                      TextSpan(
                        text: '출발지와 도착지를\n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,),
                      ),
                      TextSpan(
                        text: '입력해주세요.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,),
                      ),
                    ],
                   ),
                  ),
                ),
              Container(
                height: 50,
                width: 400, // 원하는 너비로 설정
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: '현위치',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  style: TextStyle(color: Colors.grey),
                ),
              ),
               SizedBox(height: 5,),// 공간을 위해 SizedBox 추가
              Container(
                height: 50,
                width: 400, // 원하는 너비로 설정
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: '도착지',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: 5,),
              ElevatedButton(onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CargoScreen()),
                  );
                  },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Color.fromARGB(255, 0, 68, 2),
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50), // 버튼의 크기 조정
                ),

                  child: Text(
                  '등록하기',
                  style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  ),),),
            ],
          ),
        ),
        ),
    ],
    ),
  );

  Future<void> fetchLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await locationController.serviceEnabled();
    if (serviceEnabled) {
      serviceEnabled = await locationController.requestService();
    } else {
      return ;
    }

    permissionGranted = await locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationController.onLocationChanged.listen((currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          currentPosition = LatLng(
            currentLocation.latitude!,
            currentLocation.longitude!,
          );
        });
      }
    });
  }

  Future<List<LatLng>> fetchPolylinePoints() async {
    final polylinePoints = PolylinePoints();

    final result = await polylinePoints.getRouteBetweenCoordinates(
      googleMapsApiKey,
      PointLatLng(sourLocation.latitude, sourLocation.longitude),
      PointLatLng(destLocation.latitude, destLocation.longitude),
    );

    if (result.points.isNotEmpty) {
      return result.points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();
    } else {
      debugPrint(result.errorMessage);
      return [];
    }
  }

  Future<void> generatePolyLineFromPoints(
      List<LatLng> polylineCoordinates) async {
    const id = PolylineId('polyline');

    final polyline = Polyline(
      polylineId: id,
      color: Colors.blueAccent,
      points: polylineCoordinates,
      width: 2,
    );

    setState(() => polylines[id] = polyline);
  }
}