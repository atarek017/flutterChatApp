import 'package:chat_aapp/chat_screan.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Frenzy Chat'),
      ),
      body:ChatScrean()
    );
  }
}
