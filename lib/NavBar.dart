import 'package:dice/main.dart';
import 'package:dice/pages/about%20us.dart';
import 'package:dice/pages/settings.dart';
import 'package:dice/pages/terms%20and%20conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column( // Start of the Column widget
          children: [
            Expanded( // Let the list take up available space
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.close),
                    onTap: () {
                      HapticFeedback.vibrate();
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.home_filled),
                    title: const Text('Home'),
                    onTap: () => selectedItem(context, 0),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () => selectedItem(context, 1), // Changed index to 1
                  ),
                  ListTile(
                    leading: const Icon(Icons.description),
                    title: const Text('Terms And Conditions'),
                    onTap: () => selectedItem(context, 2), // Changed index to 2
                  ),
                  ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: const Text('About Us'),
                    onTap: () => selectedItem(context, 3), // Changed index to 3
                  ),
                  const Divider(), // Separate the Exit button
                ],
              ),
            ),
            const Spacer(), // Push the Exit button to the bottom
            const Divider(), // Separate the Exit button
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Exit'),
              onTap: () {
                HapticFeedback.vibrate();
                SystemNavigator.pop(); // Close the app
              },
            ),
          ], // Closing bracket for children
        ), // Closing bracket for Column
      ),
    );
  }
}

void selectedItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HomeApp(),
      ));
      break;

    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const SettingsPage(),
      ));
      break;

    case 3:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const AboutUs(),
      ));
      break;

    case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const TermsAndConditions(),
      ));
      break;
  }
}
