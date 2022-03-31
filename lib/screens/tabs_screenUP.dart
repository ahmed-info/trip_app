import 'package:flutter/material.dart';
import 'package:trip_app/models/trip.dart';
import 'package:trip_app/screens/categories_screen.dart';
import 'package:trip_app/screens/favoratites_screen.dart';

class TabsScreen extends StatelessWidget {
  //const TabsScreen({Key key}) : super(key: key);
  final List<Trip> favoriteTrips;
  TabsScreen(this.favoriteTrips);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('الدليل السياحي'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.dashboard),
                text: 'التصنيفات',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'المفضلة',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [CategoriesScreen(), FavoratesScreen(this.favoriteTrips)],
        ),
      ),
    );
  }
}
