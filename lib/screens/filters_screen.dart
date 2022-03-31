import 'package:flutter/material.dart';
import 'package:trip_app/widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String screenRoute = '/filters-screen';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _summer = false;
  var _winter = false;
  var _family = false;
  @override
  void initState() {
    _summer = widget.currentFilters['summer'];
    _winter = widget.currentFilters['winter'];
    _family = widget.currentFilters['family'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الفلترة'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedfilters = {
                  'summer': _summer,
                  'winter': _winter,
                  'family': _family,
                };
                widget.saveFilters(selectedfilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile('الرحلات الصيفية',
                    'اظهار الرحلات في فصل الصيف فقط', _summer, (newValue) {
                  setState(() {
                    _summer = newValue;
                  });
                }),
                buildSwitchListTile('الرحلات الشتوية',
                    'اظهار الرحلات في فصل الشتاء فقط', _winter, (newValue) {
                  setState(() {
                    _winter = newValue;
                  });
                }),
                buildSwitchListTile(
                    'الرحلات العائلية', 'اظهار الرحلات العائلية فقط', _family,
                    (newValue) {
                  setState(() {
                    _family = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(
      String title, String subTitle, var currentValue, Function updateValue) {
    return SwitchListTile(
        value: currentValue,
        title: Text(title),
        subtitle: Text(subTitle),
        onChanged: updateValue);
  }
}
