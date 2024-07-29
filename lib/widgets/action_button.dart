import 'package:api_tranning/components/super_heroes_colors.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const ActionButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),

        color: SuperHeroesColors.blue,),
        child: Text(
          text.toUpperCase(),
          style:  TextStyle(fontWeight: FontWeight.w700, color: Colors.white,fontSize: 14),
        ),
      ),
    );
  }
}
