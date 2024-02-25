import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.apps), label: "Home" ),
          BottomNavigationBarItem(icon:Icon(Icons.apps), label: "Bookings" ),
          BottomNavigationBarItem(icon:Icon(Icons.apps), label: "Add" ),
          BottomNavigationBarItem(icon:Icon(Icons.apps), label: "Notifications" ),
          BottomNavigationBarItem(icon:Icon(Icons.apps), label: "Profile" ),
        ],
      ),
    );
  }
}