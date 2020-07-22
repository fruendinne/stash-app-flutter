import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ImgurService {
  static const String API_HOST = "api.imgur.com";
  static const String API_BASE_URL = "/3/";

  static const String _CLIENT_ID = "5a00c4034e297f2";

  static Future<String> uploadImage(File image) async {
    final uri = Uri.https(API_HOST, API_BASE_URL + "upload");

    final request = http.MultipartRequest("POST", uri);
    request.headers['Authorization'] = "Client-ID " + _CLIENT_ID;

    request.files.add(
        http.MultipartFile.fromBytes("image", await image.readAsBytes(), filename: "image.jpg", contentType: new MediaType('image', 'jpeg')),
    );

    final response = await request.send();

    if (response.statusCode == 200) {
      var data = json.decode(await response.stream.bytesToString());
      return data['data']['link'];
    } else {
      return null;
    }
  }
}