import 'package:flashscore_clone/constants/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool showOdds = true;
  String oddsFormat = 'EU (1.50)';
  ThemeMode _themeMode = ThemeMode.light; // Track the current theme mode

  void _toggleThemeMode() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode, // Set the current theme mode
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: secondarycolor,
          title: const Row(
            children: [
              Icon(
                CupertinoIcons.arrow_left,
                size: 40,
                color: nextcolor,
              ),
              SizedBox(width: 10),
              Text(
                'Settings',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            SettingsCategory(title: 'Push notifications'),
            SettingsTile(
              title: 'Notifications settings',
              icon: Icons.notifications,
            ),
            SettingsTile(
              title: 'Voice notifications',
              icon: Icons.record_voice_over,
            ),
            SettingsCategory(title: 'User'),
            SettingsTile(
              title: 'Not logged in',
              icon: Icons.person,
              trailingWidget: ElevatedButton(
                onPressed: () {
                  // Handle login
                },
                child: Text('LOG IN'),
              ),
            ),
            SettingsCategory(title: 'Theme'),
            SettingsTile(
              title: 'Dark mode',
              icon: Icons.brightness_2,
              trailingWidget: Switch(
                value: _themeMode ==
                    ThemeMode.dark, // Check if dark mode is enabled
                onChanged: (value) {
                  _toggleThemeMode(); // Call the toggle function
                },
              ),
            ),
            SettingsCategory(title: 'Betting odds'),
            SettingsTile(
              title: 'Show odds in the list of games',
              icon: Icons.show_chart,
              trailingWidget: Switch(
                value: showOdds,
                onChanged: (value) {
                  setState(() {
                    showOdds = value;
                  });
                },
              ),
            ),
            SettingsTile(
              title: 'Odds format',
              icon: Icons.format_list_numbered,
              trailingWidget: DropdownButton<String>(
                value: oddsFormat,
                onChanged: (newValue) {
                  setState(() {
                    oddsFormat = newValue!;
                  });
                },
                items: const [
                  DropdownMenuItem(
                    value: 'EU (1.50)',
                    child: Text('EU (1.50)'),
                  ),
                  DropdownMenuItem(
                    value: 'US (+150)',
                    child: Text('US (+150)'),
                  ),
                  // Add more options as needed
                ],
              ),
            ),
            SettingsCategory(title: 'Other'),
            SettingsTile(
              title: 'Primary sport after starting the app',
              icon: Icons.sports,
              trailingWidget: Text('Football'),
            ),
            SettingsTile(
              title: 'Primary tab after starting the app',
              icon: Icons.tab,
              trailingWidget: Text('All Games'),
            ),
            SettingsTile(
              title: 'Change sports order in the menu',
              icon: Icons.reorder,
            ),
            SettingsTile(
              title: 'Order matches by',
              icon: Icons.list,
              trailingWidget: Text('League name'),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsCategory extends StatelessWidget {
  final String title;

  SettingsCategory({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? trailingWidget;

  SettingsTile({
    required this.title,
    required this.icon,
    this.trailingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: trailingWidget,
    );
  }
}
