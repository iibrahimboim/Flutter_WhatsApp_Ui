import 'package:flutter/material.dart';

//membuat model pesan, blueprint
class Message {
  final String chat;
  final bool isme;

  Message({required this.chat, required this.isme});
}

class DetailChat extends StatefulWidget {
  const DetailChat({super.key});

  @override
  State<DetailChat> createState() => _DetailChatState();
}

class _DetailChatState extends State<DetailChat> {
  //menambahkan controller
  TextEditingController textPesan = new TextEditingController();

  final List<Message> pesan = [
    Message(chat: "Hi!", isme: true),
    Message(chat: "Hello!", isme: false),
    Message(chat: "apa kabar?", isme: true),
    Message(chat: "Alhamdulillah baik", isme: false),
    Message(chat: "oke!", isme: true),
  ];

  void kirimPesan() {
    if (textPesan.text.trim().isEmpty) return;
    setState(() {
      pesan.add(Message(chat: textPesan.text, isme: true));
    });
    textPesan.clear();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          pesan.add(Message(chat: "Y", isme: false));
        });
      }
    });
  }
  @override
  void dispose() {
    textPesan.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //widget memiliki property dan property memiliki widget, setiap wdiget di awalai huruf kapital
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: CircleAvatar(child: Icon(Icons.person)),
            ),
            Text("Boim"),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint("video call");
            },
            icon: Icon(Icons.videocam),
          ),
          IconButton(
            onPressed: () {
              debugPrint("telepon");
            },
            icon: Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {
              debugPrint("Membuka menu lain");
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: pesan.length,
              itemBuilder: (context, index) {
                final psn = pesan[index];
                return Align(
                  alignment: psn.isme
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: psn.isme ? Colors.green : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      psn.chat,
                      style: TextStyle(
                        color: psn.isme ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textPesan,
                    decoration: InputDecoration(
                      hintText: 'Tulis Pesan...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    kirimPesan();
                  },
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
