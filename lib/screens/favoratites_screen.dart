import 'package:flutter/material.dart';
import 'package:trip_app/models/trip.dart';
import 'package:trip_app/widgets/trip_item.dart';

class FavoratesScreen extends StatelessWidget {
  //const FavoratesScreen({Key key}) : super(key: key);
  final List<Trip> favoriteTrips;
  FavoratesScreen(this.favoriteTrips);
  @override
  Widget build(BuildContext context) {
    if (favoriteTrips.isEmpty) {
      return Center(
        child: Text('ليس لديك اي رحلة في القائمة المفضلة'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            id: favoriteTrips[index].id,
            title: favoriteTrips[index].title,
            imageUrl: favoriteTrips[index].imageUrl,
            duration: favoriteTrips[index].duration,
            tripType: favoriteTrips[index].tripType,
            season: favoriteTrips[index].season,
            // removeItem: _removeItem,
          );
        },
        itemCount: favoriteTrips.length,
      );
    }
  }
}
