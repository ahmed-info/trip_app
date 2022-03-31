import 'package:flutter/material.dart';
import 'package:trip_app/models/trip.dart';
import 'package:trip_app/screens/categories_screen.dart';
import 'package:trip_app/screens/favoratites_screen.dart';
import 'package:trip_app/widgets/app_drawer.dart';

class TabScreen extends StatefulWidget {
  //const TabScreen({Key key}) : super(key: key);
  final List<Trip> favoriteTrips;
  TabScreen(this.favoriteTrips);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;
  List<Map<String, Object>> _screens;
  @override
  void initState() {
    _screens = [
      {'screen': CategoriesScreen(), 'title': 'التصنيفات'},
      {
        'screen': FavoratesScreen(widget.favoriteTrips),
        'title': 'الرحلات المفضلة'
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedIndex]['title']),
      ),
      drawer: AppDrawer(),
      body: _screens[_selectedIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.greenAccent,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'التصنيفات'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'المفضلة')
        ],
      ),
    );
  }
}
