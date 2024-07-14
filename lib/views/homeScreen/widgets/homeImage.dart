
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeImage extends StatelessWidget {
  const HomeImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Animate(
      onPlay: (controller) => controller.repeat(reverse: true) ,
      effects: const [
        ShimmerEffect(
          duration: Duration(milliseconds: 1500),
          delay: Duration(milliseconds: 1000),
        )
      ],
      child: const Image(
          image: AssetImage('images/homeIcon1.png')
      ),
    );
  }
}