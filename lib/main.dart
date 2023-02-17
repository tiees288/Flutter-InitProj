import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom App Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const TextStyle optionsStyle =
      TextStyle(fontSize: 1, fontWeight: FontWeight.bold, color: Colors.black);
  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionsStyle,
    ),
    Text(
      'Orders',
      style: optionsStyle,
    ),
    Text('Profile', style: optionsStyle),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue.shade800,
        elevation: 20,
        // selectedFontSize: 13,
        unselectedLabelStyle: TextStyle(
          color: Colors.black,
          // fontSize: 13,
        ),
        unselectedItemColor: Colors.black,
        unselectedFontSize: 14,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              child: Icon(Icons.home),
              padding: EdgeInsets.all(1),
            ),
            label: 'Home',
            // backgroundColor: Colors.black,
          ),
          // BottomNavigationBarItem(
          //   icon: Padding(
          //     child: Icon(Icons.search),
          //     padding: EdgeInsets.all(1),
          //   ),
          //   label: 'Search',
          // ),
          BottomNavigationBarItem(
            icon: Padding(
              child: Icon(Icons.history),
              padding: EdgeInsets.all(1),
            ),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              child: Icon(Icons.person),
              padding: EdgeInsets.all(1),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
