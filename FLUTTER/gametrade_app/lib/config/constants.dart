// lib/config/constants.dart


import 'dart:io' show Platform; // Used to check if running on Android

import 'package:flutter/foundation.dart'; // Used for kDebugMode


class AppConstants {


  static const String _yourLocalComputerIp = "192.168.1.103"; 

  static const String _androidEmulatorIp = "10.0.2.2";


  static const String _backendPort = "8000";




  static String get apiBaseUrl {

    if (kDebugMode) { 

      // On Android (physical device or emulator)

      if (Platform.isAndroid) {


        return "http://$_yourLocalComputerIp:$_backendPort/api";

      

      }


      return "http://localhost:$_backendPort/api";

    }

    return "https://api.yourvideotradeapp.com/api"; 

  }


}
