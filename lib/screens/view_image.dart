import 'package:dimofinf/widgets/image_grid.dart';
import 'package:flutter/material.dart';

class ViewImages extends StatelessWidget {
  static const routeName = '/view-images';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ImagesGrid(),

    );
  }
}
