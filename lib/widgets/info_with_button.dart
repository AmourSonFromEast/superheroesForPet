import 'package:api_tranning/components/super_heroes_colors.dart';
import 'package:api_tranning/widgets/action_button.dart';
import 'package:flutter/material.dart';

class InfoWithButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final String assetImagine;
  final double imageHeight;
  final double imageWidth;
  final double imageTopPadding;

  const InfoWithButton(
      {super.key,
        required this.title,
        required this.subtitle,
        required this.buttonText,
        required this.assetImagine,
        required this.imageHeight,
        required this.imageWidth,
        required this.imageTopPadding});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 108,
              width: 108,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: SuperHeroesColors.blue,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: imageTopPadding),
              child: Image.asset(assetImagine,
                  height: imageHeight, width: imageWidth),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 32,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          subtitle,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 30),
        ActionButton(text: buttonText, onTap: () {}),
      ],
    );
  }
}
