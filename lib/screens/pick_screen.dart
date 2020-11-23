import 'dart:io';

import 'package:dimofinf/models/picture_model.dart';
import 'package:dimofinf/providers/store_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as pPath;

class TakePicScreen extends StatefulWidget {
  static const routeName = '/take-pic';

  @override
  _TakePicScreenState createState() => _TakePicScreenState();
}

class _TakePicScreenState extends State<TakePicScreen> {
  File _takenImage;
  Future<void> _takePicture() async {
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (imageFile == null) {
      return;
    }
    setState(() {
      _takenImage = imageFile;
    });
    final appDir = await pPath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');

    var _imageToStore = Picture(picName: savedImage);
    _storeImage() {
      Provider.of<StoreImage>(context, listen: false).storeImage(_imageToStore);
    }

    _storeImage();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FlatButton.icon(
          icon: Icon(
            Icons.photo_camera,
            size: 100,
          ),
          label: Text(''),
          textColor: Theme.of(context).primaryColor,
          onPressed: _takePicture,
        ),
      ),
    );
  }
}