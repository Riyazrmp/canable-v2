import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  final String image;
  ImageView({this.image});
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.network(widget.image),
      ),
    );
  }
}
