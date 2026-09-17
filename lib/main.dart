import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("WhatsApp"),
          backgroundColor: Colors.green,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.chat)),
              Tab(icon: Icon(Icons.circle_outlined)),
              Tab(icon: Icon(Icons.call)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Card(
                  elevation: 20,
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Boim"),
                    subtitle: Text("Kamuu lagi apa baim"),
                    trailing: Text("50", style: TextStyle(color: Colors.green)),
                  ),
                ),
                Card(
                  elevation: 20,
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Boim"),
                    subtitle: Text("Kamuu lagi apa baim"),
                    trailing: Text("50", style: TextStyle(color: Colors.green)),
                  ),
                ),    
              ],
            ),
            Column(
              children: [
                Card(
                  elevation: 20,
                  child: ListTile(
                    leading: Icon(Icons.link),
                    title: Text("Tambahkan status"),
                    subtitle: Text("bagikan cerita anda dengan mengunggah foto atau vidoe"),
                    trailing: Icon(Icons.add),
                  ),
                ),
                Card(
                  elevation: 20,
                  child: ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text("marvel", style: TextStyle(color: Colors.green)),
                    subtitle: Text("5 Menit yang lalu"),
                  ),
                ),    
              ],
            ),
            Column(
              children: [
                Card(
                  elevation: 20,
                  child: ListTile(
                    leading: Icon(Icons.account_circle_outlined),
                    title: Text("Add Favorite"),
                  ),
                ),
                Card(
                  elevation: 20,
                  child: ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text("marvel", style: TextStyle(color: Colors.green)),
                    subtitle: Text("5 Menit yang lalu"),
                    trailing: Icon(Icons.call),
                  ),
                ),    
              ],
            ),
          ],
        ),
      ),
    );
  }
}
