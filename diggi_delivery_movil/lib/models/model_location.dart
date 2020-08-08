// import 'package:location/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

class ModelLocationPermission with WidgetsBindingObserver{

  
  Future<void> request() async {
    final PermissionStatus status =
        await Permission.locationWhenInUse.request();

    print("STATUS :::::::::::::::::::::::: $status");

    switch (status) {
      case PermissionStatus.undetermined:
        
        break;
      case PermissionStatus.granted:
        
        break;
      case PermissionStatus.denied:
        
        break;
      case PermissionStatus.restricted:
        
        break;
      case PermissionStatus.permanentlyDenied:
        openAppSettings();
        break;
    }
  }

}
