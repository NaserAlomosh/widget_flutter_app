import 'package:flutter/material.dart';
import 'package:shadow/shadow.dart';

class ImageTest extends StatelessWidget {
  const ImageTest({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Shadow(
              options: const ShadowOptions(
                overlayColor: Colors.transparent,
                scale: 6,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/widget.gif',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
