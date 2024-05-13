import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app_data.dart';
import 'layout_menu.dart';

class LayoutDemons extends StatefulWidget {
  const LayoutDemons({super.key});

  @override
  LayoutDemonsState createState() => LayoutDemonsState();
}

class LayoutDemonsState extends State<LayoutDemons> {
  final AppData appData = AppData();
  bool isLoading = true;
  int i = 0;
  int j = 0;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    await appData.initDatabase();
    if (kDebugMode) {
      print('\nDDBB initialized!\n');
    }
    await _loadImages();
  }

  Future<void> _loadImages() async {
    await loadImages();
    if (kDebugMode) {
      print('Demons: ${appData.demons}');
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> loadImages() async {
    await appData.addDemons();
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
    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: Color.fromARGB(255, 200, 13, 0), strokeWidth: 50.0,),
        ),
      );
    }

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
                      i = appData.demons.length - 1;
                    } else {
                      i--;
                    }
                    j = 0;
                    setState(() {});
                  },
                ),
                const Text(
                  'Demons',
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
                    if (i == appData.demons.length - 1) {
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
                child: Image.asset(appData.demons[i]['images']![j]),
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
                        j = appData.demons[i]['names']!.length - 1;
                      } else {
                        j--;
                      }
                      setState(() {});
                    },
                  ),
                  Text(
                    appData.demons[i]['names']![j],
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
                      if (j == appData.demons[i]['names']!.length - 1) {
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
                'Class: ${appData.demons[i]['class']![0]}\n'
                'Rank: ${appData.demons[i]['rank']![0]}\n'
                'Health Points: ${appData.demons[i]['health_points']![0]}\n'
                'Damage: ${appData.demons[i]['damage']![0]}\n\n'
                '${appData.demons[i]['description']![0]}',
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
