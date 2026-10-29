import 'package:flutter/material.dart';
import 'package:flutter_application_1/detail_chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
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
          title: const Text(
            'WhatsApp',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.green,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.chat)),
              Tab(icon: Icon(Icons.track_changes)),
              Tab(icon: Icon(Icons.call)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              // padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              children: [
                Card(
                  child: ListTile(
                    leading: Icon(Icons.archive),
                    title: Text("Diarsipkan"),
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("Chat Ditekan!");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailChat()),
                    );
                  },
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Ibrahim"),
                      subtitle: Row(
                        children: [
                          Icon(Icons.done_all, size: 15),
                          SizedBox(width: 4),
                          Text("Pak wifinya jelek"),
                        ],
                      ),
                      trailing: Text(
                        '5:31',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ListView(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              children: [
                const ListTile(
                  leading: Icon(Icons.add_circle_outline_sharp, size: 40),
                  title: Text(
                    'My status',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Tap to add status update'),
                ),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 12.0, bottom: 8.0),
                  child: Text(
                    'Recent updates',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.person, size: 35),
                  title: Text('Boim'),
                  subtitle: Text('2 minutes ago'),
                ),
              ],
            ),
            ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const Text(
                  'Favourites',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFF00A884),
                      child: Icon(Icons.person_add, color: Colors.black),
                    ),
                    title: const Text(
                      'Add favourite',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Recent',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage('assets/profile.png'),
                  ),
                  title: const Text(
                    'Boim',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Row(
                    children: [
                      Icon(Icons.call_missed, color: Colors.red, size: 18),
                      SizedBox(width: 4),
                      Text('Missed (2)', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                  trailing: const Text(
                    '21/09/2026',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
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