import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

class LoadGif extends StatefulWidget{
  const LoadGif({
    super.key,
    required this.path
  });

  final String path;

  @override
  State<LoadGif> createState() => _LoadGifState();
}

class _LoadGifState extends State<LoadGif> with TickerProviderStateMixin{

  late GifController controller;


  @override
  void initState() {
    controller= GifController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose(); // Dispose your animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Gif(
      autostart: Autostart.loop,
      controller: controller,
      image: AssetImage(widget.path),
      //image: NetworkImage("https://cdn.dribbble.com/users/199340/screenshots/2146883/sunny-800x600.gif"),
    );
  }
}
