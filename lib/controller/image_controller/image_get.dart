import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class ImageGet with ChangeNotifier{

  var getImage, getProfileUpdateImage;

  /// Global Image Pick
  Future imagePick({from}) async {
    final selectedImage = await ImagePicker().pickImage(source: from == "camera" ? ImageSource.camera : ImageSource.gallery);
    if (selectedImage != null) {
      getImage = File(selectedImage.path);
    } else {
      debugPrint('No image selected.');
    }
    notifyListeners();
  }

  ///profile Update Image Pick
  Future profileUpdateImagePick({from}) async {
    final selectedImage = await ImagePicker().pickImage(source: from == "camera" ? ImageSource.camera : ImageSource.gallery);
    if (selectedImage != null) {
      getProfileUpdateImage = File(selectedImage.path);
    } else {
      debugPrint('No image selected.');
    }
    notifyListeners();
  }


  @override
  notifyListeners();
}