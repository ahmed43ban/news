import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  // Obtain shared preferences.
  static late SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

/*// Save an integer value to 'counter' key.
  await prefs.setInt('counter', 10);
// Save an boolean value to 'repeat' key.
  await prefs.setBool('repeat', true);
// Save an double value to 'decimal' key.
  await prefs.setDouble('decimal', 1.5);
// Save an String value to 'action' key.
  await prefs.setString('action', 'Start');
// Save an list of strings to 'items' key.
  await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);*/
  static setTheme(bool value) {
    prefs.setBool("theme", value);
  }

  static bool getTheme() {
    return prefs.getBool("theme") ?? false;
  }
}
