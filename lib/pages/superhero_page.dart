import 'package:api_tranning/components/super_heroes_colors.dart';
import 'package:api_tranning/widgets/action_button.dart';
import 'package:flutter/material.dart';

class SuperheroPage extends StatelessWidget {
  final String name;

  const SuperheroPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SuperHeroesColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ActionButton(
                  text: "Back",
                  onTap: () {
                    Navigator.of(context).pop();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
