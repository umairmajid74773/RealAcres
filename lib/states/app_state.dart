
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppState with ChangeNotifier{

  static LatLng _initialPosition;
  LatLng _lastPosition = _initialPosition;
  LatLng get initialPosition => _initialPosition;
  String currentlocation;
  bool locationServiceActive = true;
  GoogleMapController _mapController;
  GoogleMapController get mapController => _mapController;
  LatLng get lastPosition => _lastPosition;

  AppState(){
    _getUserLocation();
    _loadingInitialPosition();
  }

  void _getUserLocation() async{
    print("GET USER METHOD RUNNING =========");
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);
    _initialPosition = LatLng(position.latitude, position.longitude);
    print("the latitude is: ${position.longitude} and th longitude is: ${position.longitude} ");
    print("initial position is : ${_initialPosition.toString()}");
    notifyListeners();
  }

  //  LOADING INITIAL POSITION
  void _loadingInitialPosition()async{
    await Future.delayed(Duration(seconds: 5)).then((v) {
      if(_initialPosition == null){
        locationServiceActive = false;
        notifyListeners();
      }
    });
  }

  // ! ON CREATE
  void onCreated(GoogleMapController controller) {
    _mapController = controller;
    notifyListeners();
  }

  void onCameraMove(CameraPosition position) {
    _lastPosition = position.target;
    notifyListeners();
  }

}