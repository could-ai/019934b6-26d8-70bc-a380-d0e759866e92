import 'package:flutter/material.dart';

class TeamLogo extends StatelessWidget {
  final String logoUrl;
  const TeamLogo({super.key, required this.logoUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.1),
      ),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.transparent,
        child: Image.network(logoUrl, height: 40),
      ),
    );
  }
}
