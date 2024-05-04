import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'dart:io';
import 'package:image/image.dart' as img;

class AppData with ChangeNotifier {
  String convertToBase64(String file) {
    // Carreguem la imatge
    img.Image? image = img.decodeImage(File(file).readAsBytesSync());

    // Convertim la imatge en bits
    List<int> pngBytes = img.encodePng(image!);

    // Convertim els bits a Base64
    String base64Image = base64Encode(pngBytes);

    if (kDebugMode) {
      print(base64Image);
    }

    return base64Image;
  }
}
