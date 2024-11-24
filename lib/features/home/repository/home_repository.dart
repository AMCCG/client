import 'dart:io';

import 'package:client/core/constants/server_constant.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  Future<void> uploadSong(File selectedImage, File selectedAudio) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('${ServerConstants.serverURL}/song/upload'),
    );
    request
      ..files.addAll(
        [
          await http.MultipartFile.fromPath('song', selectedAudio.path),
          await http.MultipartFile.fromPath('thumbnail', selectedImage.path),
        ],
      )
      ..fields.addAll(
        {
          'artist': 'Pantera',
          'song_name': 'Walk',
          'hex_code': 'FFFFFF',
        },
      )
      ..headers.addAll(
        {
          'x-auth-token':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUwNWE0ODAyLWMwMGEtNGM5ZS1hODI1LTdiMjAzZThhYmVmOSJ9.P712G7Hxjms2TvFQiYWBarhVi0dMBw03JZ948T4KdtQ',
        },
      );
    print("Send...");
    final res = await request.send();
    print(res);
  }
}
