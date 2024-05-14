import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'layout_characters.dart';
import 'layout_demons.dart';
import 'layout_weapons.dart';

class LayoutMenu extends StatefulWidget {
  const LayoutMenu({super.key});

  @override
  LayoutMenuState createState() => LayoutMenuState();
}

class LayoutMenuState extends State<LayoutMenu> {
  bool isBright = true;

  void toggleBrightness() {
    setState(() {
      isBright = !isBright;
    });
  }
  
  void navigateToLayoutCharacters(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LayoutCharacters()),
    );
  }

  void navigateToLayoutDemons(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LayoutDemons()),
    );
  }

  void navigateToLayoutWeapons(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LayoutWeapons()),
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
                  icon: const Icon(Icons.exit_to_app_rounded),
                  iconSize: 40.0,
                  color: const Color.fromARGB(255, 200, 13, 0),
                  onPressed: () {
                    exit(0);
                  },
                ),
                GestureDetector(
                  onTap: toggleBrightness,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      isBright ? CupertinoIcons.lightbulb : CupertinoIcons.lightbulb_slash,
                      size: 36,
                      color: isBright ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Color.fromARGB(255, 200, 13, 0),
              thickness: 5,
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'The DOOM Guide',
                style: TextStyle(color: Color.fromARGB(255, 200, 13, 0), fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 200, 13, 0),
              thickness: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                './assets/menu.jpg',
                width: 400,
                height: 275,
              ),
            ),
            CupertinoButton(
              onPressed: () {
                navigateToLayoutCharacters(context);
              },
              color: const Color.fromARGB(255, 200, 13, 0),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.people_outlined,
                    size: 28,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Characters',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              onPressed: () {
                navigateToLayoutDemons(context);
              },
              color: const Color.fromARGB(255, 200, 13, 0),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    CupertinoIcons.ant_circle,
                    size: 28,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Demons',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              onPressed: () {
                navigateToLayoutWeapons(context);
              },
              color: const Color.fromARGB(255, 200, 13, 0),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    CupertinoIcons.burst,
                    size: 28,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Weapons',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Divider(
              color: Color.fromARGB(255, 200, 13, 0),
              thickness: 5,
            ),
            const SizedBox(height: 15),
            const Text(
              'A Flutter app by JBA',
              style: TextStyle(
                color: Color.fromARGB(255, 200, 13, 0),
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: isBright ? Colors.white : Colors.black,
    );
  }
}
