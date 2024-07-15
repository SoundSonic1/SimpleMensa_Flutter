import 'package:flutter/material.dart';
import 'package:simple_mensa/extension/build_context_extension.dart';
import 'package:simple_mensa/ui/about/about_screen.dart';
import 'package:simple_mensa/ui/home/home_screen.dart';
import 'package:simple_mensa/ui/settings/settings_screen.dart';

class SimpleDrawer extends StatelessWidget {
  const SimpleDrawer({super.key, required this.selectedIndex});

  final selectedColor = Colors.deepPurple;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0),
                  child: Icon(
                    Icons.local_cafe_rounded,
                    color: Colors.white,
                  ),
                ),
              )),
          ListTile(
            selected: selectedIndex == 0,
            selectedColor: selectedColor,
            leading: const Icon(Icons.fastfood),
            title: Text(
              context.loc.canteens,
              style: const TextStyle(fontSize: 20.0),
            ),
            onTap: () => _navigateTo(context, const HomeScreen()),
          ),
          ListTile(
            selected: selectedIndex == 1,
            selectedColor: selectedColor,
            leading: const Icon(Icons.settings),
            title: Text(
              context.loc.settings,
              style: const TextStyle(fontSize: 20.0),
            ),
            onTap: () => _navigateTo(context, const SettingsScreen()),
          ),
          ListTile(
            selected: selectedIndex == 2,
            selectedColor: selectedColor,
            leading: const Icon(Icons.info_outline),
            title: Text(
              context.loc.about,
              style: const TextStyle(fontSize: 20.0),
            ),
            onTap: () => _navigateTo(context, const AboutScreen()),
          ),
        ],
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => screen), (route) => false);
  }
}
