import 'dart:io';

class ServerConstants {
  static String serverURL =
      Platform.isAndroid ? 'http://192.168.2.48:8000' : 'http://10.0.2.2:8000';
}
