
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xff0ee5dd),
                  Color(0xffc5e3e2),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            )
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.sizeOf(context).width
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              CircularProgressIndicator(
                color: Color(0xff08b9b1),
                strokeWidth: 4,
                backgroundColor: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'WEATHER',
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 40,
                ),
              ),
              Text(
                'FORECAST',
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
