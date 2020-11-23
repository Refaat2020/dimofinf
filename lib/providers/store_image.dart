import 'package:dimofinf/models/picture_model.dart';
import 'package:flutter/material.dart';

class StoreImage with ChangeNotifier {
  List<Picture> _items = [];

  List<Picture> get items {
    return [..._items];
  }

  storeImage(Picture pickedImage) {
    final newImage = Picture(
      picName: pickedImage.picName,
    );
    _items.add(newImage);
    notifyListeners();
  }
}
