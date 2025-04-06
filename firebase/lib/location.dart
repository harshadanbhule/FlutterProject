import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:tutorial1/locationdetail.dart';

class LocationMapPage extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String phoneNumber;

  LocationMapPage({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });


  @override
  _LocationMapPageState createState() => _LocationMapPageState();
}

class _LocationMapPageState extends State<LocationMapPage> {
  LatLng? _currentPosition;
  String _address = "Fetching address...";

  @override
  void initState() {
    super.initState();
    _getLocationAndAddress();
  }

  Future<void> _getLocationAndAddress() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _address = "Location services are disabled.";
      });
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _address = "Location permissions are denied.";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _address = "Location permissions are permanently denied.";
      });
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
    });

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      setState(() {
        _address =
            "${place.name}, ${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      setState(() {
        _address = "Unable to get address.";
      });
    }
  }

 void _confirmLocation() {
  if (_currentPosition != null) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationDetailsPage(
          address: _address,
          coordinates: _currentPosition!,
          firstName: widget.firstName,
          lastName: widget.lastName,
          phoneNumber: widget.phoneNumber, // updated
        ),
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Current Location'),
      ),
      body: _currentPosition == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  flex: 3,
                  child: FlutterMap(
                    options: MapOptions(
                      initialCenter: _currentPosition!,
                      initialZoom: 15.0,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: _currentPosition!,
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.location_on,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Your Location:\n$_address',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton.icon(
                    onPressed: _confirmLocation,
                    icon: Icon(Icons.check),
                    label: Text("Confirm Location"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
