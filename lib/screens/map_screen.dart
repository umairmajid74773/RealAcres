
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:real_acres_app/states/app_state.dart';



class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  double _camerazoom = 12.0;

  @override
  Widget build(BuildContext context) {

    final appState = Provider.of<AppState>(context);

    return Scaffold(
      body: SafeArea(
          child: appState.initialPosition == null ?
          Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SpinKitDoubleBounce(
                        color: Colors.redAccent,
                        size: 50.0,
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Visibility(
                    visible: appState.locationServiceActive == false,
                    child: Text("Please enable location services!", style: TextStyle(color: Colors.grey, fontSize: 18),),
                  )
                ],
              )
          ) :Stack(
            children: <Widget>[
              GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: appState.initialPosition, zoom: _camerazoom),
                onMapCreated: appState.onCreated,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                mapType: MapType.normal,
                compassEnabled: true,
                onCameraMove: appState.onCameraMove,
              ),
            ],
          )
      ),
    );
  }
}