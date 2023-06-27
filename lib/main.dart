import 'package:flutter/material.dart';
import 'package:post_api/post_api_screen.dart';

void main() {
  runApp(const PostApiCallingDemo());
}

class PostApiCallingDemo extends StatelessWidget {
  const PostApiCallingDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PostApiDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}
