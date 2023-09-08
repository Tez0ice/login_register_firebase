import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  var _messages = [
    {"sender": "Muz", "message": "Hakim", "dt": "7 Sept 8.00Am"},
    {"sender": "Muz", "message": "Hakim", "dt": "7 Sept 8.00Am"},
    {"sender": "Muz", "message": "Hakim", "dt": "7 Sept 8.00Am"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Page"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_messages[index]["message"]!),
                      subtitle: Text(
                          "${_messages[index]["sender"]} ${_messages[index]["dt"]}"),
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: "Enter Message"),
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.send)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
