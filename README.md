import 'package:flutter/material.dart';

void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Pertemuan ListView',
theme: ThemeData(
primarySwatch: Colors.blue,
),
home: PertemuanPage(),
);
}
}

class PertemuanPage extends StatefulWidget {
@override
_PertemuanPageState createState() => _PertemuanPageState();
}

class _PertemuanPageState extends State<PertemuanPage> {
int _selectedIndex = 1;

final List<Map<String, String>> pertemuanList = [
{"judul": "Pertemuan 1", "deskripsi": "Pengenalan Android"},
{"judul": "Pertemuan 2", "deskripsi": "Widget & Button"},
{"judul": "Pertemuan 3", "deskripsi": "Activity & Intent"},
{"judul": "Pertemuan 4", "deskripsi": "Toast & AlertDialog"},
{"judul": "Pertemuan 5", "deskripsi": "ListView"},
{"judul": "Pertemuan 6", "deskripsi": "Checkbox"},
{"judul": "Pertemuan 7", "deskripsi": "Radio Button"},
];

void _onItemTapped(int index) {
setState(() {
_selectedIndex = index;
// Kamu bisa tambahkan navigasi ke halaman lain di sini kalau mau
});
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Pertemuan 5'),
backgroundColor: Colors.blue,
),
body: ListView.builder(
itemCount: pertemuanList.length,
itemBuilder: (context, index) {
final item = pertemuanList[index];
return Card(
margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
child: ListTile(
leading: Icon(Icons.list),
title: Text(item['judul']!),
subtitle: Text(item['deskripsi']!),
trailing: Icon(Icons.arrow_forward_ios, size: 16),
onTap: () {
// Tambahkan aksi ketika diklik (navigasi atau detail)
},
),
);
},
),
bottomNavigationBar: BottomNavigationBar(
currentIndex: _selectedIndex,
selectedItemColor: Colors.blue,
onTap: _onItemTapped,
items: const [
BottomNavigationBarItem(
icon: Icon(Icons.person),
label: '',
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
