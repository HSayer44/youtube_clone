import 'package:flutter/material.dart';
import 'package:youtube_clone/env/env.dart';
import 'package:youtube_clone/screens/search_screen.dart';
import 'package:youtube_clone/screens/shorts_screen.dart';
import 'package:youtube_clone/screens/mux_shorts_screen.dart';
import 'package:youtube_clone/services/video_client.dart';
import 'package:youtube_clone/shared/theme.dart';

Future<void> main() async {
  final videoClient  = VideoClient();
  final muxAssets = await videoClient.getMuxAssets();
  print(muxAssets);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube clone',
      theme: const AppTheme().themeData,
      initialRoute: '/search',
      routes: {
        '/shorts': (context) => const ShortsScreen(),
        '/search': (context) => const SearchScreen(),
      },
      home: SearchScreen(),
    );
  }
}
