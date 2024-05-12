import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app_data.dart';
import 'layout_menu.dart';

class LayoutWeapons extends StatefulWidget {
  const LayoutWeapons({super.key});

  @override
  LayoutWeaponsState createState() => LayoutWeaponsState();
}

class LayoutWeaponsState extends State<LayoutWeapons> {
  final AppData appData = AppData();
  int i = 0;
  int j = 0;

  @override
  void initState() {
    super.initState();
    appData.initDatabase();
    _loadImages();
  }

  Future<void> _loadImages() async {
    await loadImages();
    if (kDebugMode) {
      print('Weapons: ${appData.weapons}');
    }
    setState(() {});
  }

  Future<void> loadImages() async {
    await appData.addWeapons();
    setState(() {});
  }

  void toggleBrightness() {
    setState(() {
      appData.isBright = !appData.isBright;
    });
  }

  void navigateToLayoutMenu(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LayoutMenu()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: const Color.fromARGB(255, 200, 13, 0),
                  onPressed: () {
                    navigateToLayoutMenu(context);
                  },
                ),
                GestureDetector(
                  onTap: toggleBrightness,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      appData.isBright ? CupertinoIcons.lightbulb : CupertinoIcons.lightbulb_slash,
                      size: 36,
                      color: appData.isBright ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Color.fromARGB(255, 200, 13, 0),
              thickness: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Icon(
                    CupertinoIcons.back,
                    color: Color.fromARGB(255, 200, 13, 0),
                  ),
                  onPressed: () {
                    if (i == 0) {
                      i = appData.weapons.length - 1;
                    } else {
                      i--;
                    }
                    j = 0;
                    setState(() {});
                  },
                ),
                const Text(
                  'Weapons',
                  style: TextStyle(
                    color: Color.fromARGB(255, 200, 13, 0),
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Icon(
                    CupertinoIcons.forward,
                    color: Color.fromARGB(255, 200, 13, 0),
                  ),
                  onPressed: () {
                    if (i == appData.weapons.length - 1) {
                      i = 0;
                    } else {
                      i++;
                    }
                    j = 0;
                    setState(() {});
                  },
                ),
              ],
            ),
            const Divider(
              color: Color.fromARGB(255, 200, 13, 0),
              thickness: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: SizedBox(
                width: 400,
                height: 230,
                child: Image.asset(appData.weapons[i]['images']![j]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Icon(
                      CupertinoIcons.back,
                      color: Color.fromARGB(255, 200, 13, 0),
                    ),
                    onPressed: () {
                      if (j == 0) {
                        j = appData.weapons[i]['names']!.length - 1;
                      } else {
                        j--;
                      }
                      setState(() {});
                    },
                  ),
                  Text(
                    appData.weapons[i]['names']![j],
                    style: const TextStyle(
                      color: Color.fromARGB(255, 200, 13, 0),
                      fontSize: 14.0,
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Icon(
                      CupertinoIcons.forward,
                      color: Color.fromARGB(255, 200, 13, 0),
                    ),
                    onPressed: () {
                      if (j == appData.weapons[i]['names']!.length - 1) {
                        j = 0;
                      } else {
                        j++;
                      }
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 200, 13, 0),
              thickness: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Type: ${appData.weapons[i]['type']![0]}\n'
                'Fire Mode: ${appData.weapons[i]['fire_mode']![0]}\n'
                'Ammo Type: ${appData.weapons[i]['ammo_type']![0]}\n'
                'Damage: ${appData.weapons[i]['damage']![0]}\n\n'
                '${appData.weapons[i]['description']![0]}',
                style: const TextStyle(
                  color: Color.fromARGB(255, 200, 13, 0),
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: appData.isBright ? Colors.white : Colors.black,
    );
  }
}
