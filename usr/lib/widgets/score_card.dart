import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:couldai_user_app/theme/colors.dart';

class ScoreCard extends StatelessWidget {
  final String score;
  final String teamName;

  const ScoreCard({super.key, required this.score, required this.teamName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          score,
          style: GoogleFonts.orbitron(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: AppColors.scoreColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          teamName,
          style: GoogleFonts.openSans(
            fontSize: 16,
            color: AppColors.textColor,
          ),
        ),
      ],
    );
  }
}
