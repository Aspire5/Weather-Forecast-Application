import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    this.title = 'Alert!',
    this.description = 'Action is invalid',
    this.buttonText = 'OK',
    required this.onPressed
  });

  final String title;
  final String description;
  final String buttonText;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black
              ),
            ),

            const SizedBox(height: 20,),

            Text(
              description,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20,),

            ElevatedButton(
              onPressed: onPressed,
              child: Text(
                buttonText,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
