import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Shafwan',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MainNavigation(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    ProfilePage(),
    PertemuanPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
Stack(
  alignment: Alignment.center,
  clipBehavior: Clip.none,
  children: [
    Image.network(
      'https://picsum.photos/800/200',
      height: 200,
      width: double.infinity,
      fit: BoxFit.cover,
    ),
    Positioned(
      bottom: -50,
      child: CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage(
          'https://randomuser.me/api/portraits/men/20.jpg',
        ),
      ),
    ),
  ],
),

          SizedBox(height: 60),
          Text(
            "Muhammad Shafwan",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text("Kota Tangerang, Indonesia", style: TextStyle(color: Colors.grey)),
          Text("MuhammadShafwan680@gmail.com",
              style: TextStyle(color: Colors.grey.shade600)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Column(
                children: [
                  Text("Kelas", style: TextStyle(color: Colors.blue)),
                  SizedBox(height: 5),
                  Text("06TPLP031", style: TextStyle(fontSize: 18)),
                ],
              ),
              Column(
                children: [
                  Text("NIM", style: TextStyle(color: Colors.blue)),
                  SizedBox(height: 5),
                  Text("221011401159", style: TextStyle(fontSize: 18)),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class PertemuanPage extends StatelessWidget {
  final List<Map<String, String>> pertemuanList = [
    {'title': 'Pertemuan 1', 'subtitle': 'Pengenalan Android'},
    {'title': 'Pertemuan 2', 'subtitle': 'Widget & Button'},
    {'title': 'Pertemuan 3', 'subtitle': 'Activity & Intent'},
    {'title': 'Pertemuan 4', 'subtitle': 'Toast & AlertDialog'},
    {'title': 'Pertemuan 5', 'subtitle': 'ListView'},
    {'title': 'Pertemuan 6', 'subtitle': 'Checkbox'},
    {'title': 'Pertemuan 7', 'subtitle': 'Radio Button'},
  ];

  PertemuanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pertemuan 5"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: pertemuanList.length,
        itemBuilder: (context, index) {
          final item = pertemuanList[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.list),
              title: Text(item['title']!),
              subtitle: Text(item['subtitle']!),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailPage(title: item['title']!, subtitle: item['subtitle']!),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  final String subtitle;

  const DetailPage({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          '$title\n$subtitle',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
