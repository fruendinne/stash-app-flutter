import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stash/services/imgur.dart';

void main() {
  test('image upload', () async {
    File image = new File("test_resources/image.jpg");
    String response = await ImgurService.uploadImage(image);

    debugPrint(response);
    assert(response.length > 0);
  });
}