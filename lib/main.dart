import 'package:flutter/material.dart';
import 'ui/posts/post_manager.dart';
import 'ui/posts/post_detail_screen.dart';
import 'ui/posts/post_overview_screen.dart';
import 'ui/posts/user_posts_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Review',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SafeArea(
        child: UserPostsScreen(),
      ),
    );
  }
}
