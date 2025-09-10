import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:couldai_user_app/theme/colors.dart';
import 'package:couldai_user_app/widgets/glassmorphism.dart';
import 'package:couldai_user_app/widgets/score_card.dart';
import 'package:couldai_user_app/widgets/team_logo.dart';
import 'package:couldai_user_app/models/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Sports Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColors.primaryColor,
        textTheme: GoogleFonts.orbitronTextTheme(),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Game> _games = [
    Game(
      team1: 'CYBER DRAGONS',
      team2: 'VOID RUNNERS',
      logo1: 'https://firebasestorage.googleapis.com/v0/b/story-squad.appspot.com/o/dragon.png?alt=media&token=3857912d-72b2-4455-a075-4b353c44e99f',
      logo2: 'https://firebasestorage.googleapis.com/v0/b/story-squad.appspot.com/o/runner.png?alt=media&token=894b397c-1652-4e4f-a74b-8129524f5a3b',
      score1: 102,
      score2: 98,
      time: "Q4 02:30",
    ),
    Game(
      team1: 'GALAXY GLADIATORS',
      team2: 'NEBULA NINJAS',
      logo1: 'https://firebasestorage.googleapis.com/v0/b/story-squad.appspot.com/o/gladiator.png?alt=media&token=1b84e363-3e38-425b-9870-1da545c1114b',
      logo2: 'https://firebasestorage.googleapis.com/v0/b/story-squad.appspot.com/o/ninja.png?alt=media&token=a32f52ff-01e4-41b1-995b-78a0133b503d',
      score1: 88,
      score2: 95,
      time: "Q3 08:15",
    ),
  ];

  void _updateScores() {
    setState(() {
      for (var game in _games) {
        game.score1 += Random().nextInt(5);
        game.score2 += Random().nextInt(5);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'LIVE GAMES',
          style: GoogleFonts.orbitron(
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _games.length,
        itemBuilder: (context, index) {
          return GameCard(game: _games[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateScores,
        backgroundColor: AppColors.accentColor,
        child: const Icon(Icons.refresh),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}

class GameCard extends StatelessWidget {
  final Game game;

  const GameCard({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Glassmorphism(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TeamLogo(logoUrl: game.logo1),
                  Text(
                    'VS',
                    style: GoogleFonts.orbitron(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.accentColor,
                    ),
                  ),
                  TeamLogo(logoUrl: game.logo2),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ScoreCard(score: '${game.score1}', teamName: game.team1),
                  ScoreCard(score: '${game.score2}', teamName: game.team2),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                game.time,
                style: GoogleFonts.openSans(
                  fontSize: 16,
                  color: AppColors.textColor.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Glassmorphism(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      child: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: AppColors.textColor),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.bar_chart, color: AppColors.textColor),
              onPressed: () {},
            ),
            const SizedBox(width: 40),
            IconButton(
              icon: const Icon(Icons.person, color: AppColors.textColor),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: AppColors.textColor),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
