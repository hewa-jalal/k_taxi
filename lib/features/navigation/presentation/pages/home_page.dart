import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:k_taxi/features/user/presentation/bloc/user_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _googleMapCompleter = Completer();
  late GoogleMapController _googleMapController;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  static final _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  static late LatLng _initialPosition;

  void _getUserLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final latLngPosition = LatLng(position.latitude, position.longitude);
    final cameraPosition = CameraPosition(target: latLngPosition, zoom: 20);
    _googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    // List<Placemark> placemark =
    //     await placemarkFromCoordinates(position.latitude, position.longitude);
    // setState(() {
    //   _initialPosition = LatLng(position.latitude, position.longitude);
    //   print('${placemark[0].name}');
    // });
  }

  @override
  void initState() {
    super.initState();
    // _getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    Geolocator.requestPermission();
    context.read<UserBloc>().add(GetUserPosition());
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _kGooglePlex,
            // initialCameraPosition: CameraPosition(
            //   target: _initialPosition,
            //   zoom: 20.4746,
            // ),
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            onMapCreated: (controller) {
              _googleMapCompleter.complete(controller);
              _googleMapController = controller;
              _getUserLocation();
            },
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     context.read<UserBloc>().add(GetUserPosition());
          //   },
          //   child: FlutterLogo(),
          // ),
        ],
      ),
    );
  }
}
