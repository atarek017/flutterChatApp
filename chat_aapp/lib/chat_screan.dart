import 'package:flutter/material.dart';
import 'package:chat_aapp/chat_message.dart';

class ChatScrean extends StatefulWidget {
  @override
  _ChatScreanState createState() => _ChatScreanState();
}

class _ChatScreanState extends State<ChatScrean> {
  final TextEditingController _textContoller = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  void _handelSubmitted(String text) {
    _textContoller.clear();

    ChatMessage message = new ChatMessage(
      text: text,
    );

    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _textComposerWidget() {
    return IconTheme(
      data: IconThemeData(color: Colors.blue),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                  decoration:
                      InputDecoration.collapsed(hintText: 'send message'),
                  controller: _textContoller,
                  onSubmitted: _handelSubmitted),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handelSubmitted(_textContoller.text),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
          ),
        ),
        Divider(
          height: 1.0,
        ),
        Container(
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
          child: _textComposerWidget(),
        )
      ],
    );
  }
}
