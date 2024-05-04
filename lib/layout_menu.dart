import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutMenu extends StatefulWidget {
  const LayoutMenu({super.key});

  @override
  LayoutMenuState createState() => LayoutMenuState();
}

class LayoutMenuState extends State<LayoutMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(20.0),
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
                height: 400,
              ),
            ),
            CupertinoButton(
              onPressed: () {
                // Handle button press for option 1
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
                // Handle button press for option 2
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
                // Handle button press for option 3
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
          ],
        ),
      ),
    );
  }
}
