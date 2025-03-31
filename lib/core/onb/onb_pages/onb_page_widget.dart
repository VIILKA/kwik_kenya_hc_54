import 'package:flutter/material.dart';

class TamplateOnbPageWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const TamplateOnbPageWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Background container with image
        SizedBox(
          width: double.infinity,
          height: 304,
          child: Stack(
            children: [
              // Background color
              Container(
                width: double.infinity,
                height: 503,
                color: const Color(0xFFFAF8F5),
              ),
              // Bottom wave decoration
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 71,
                  color: const Color(0xFFF9F0E3),
                ),
              ),
              // Image
              Center(
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                  height: 400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        // Text content
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 58),
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF3F414E),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFFA1A4B2),
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
