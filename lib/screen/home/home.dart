import 'package:a9wiki/screen/events/events.dart';
import 'package:a9wiki/screen/list_operators/operators_list.dart';
import 'package:a9wiki/screen/recruit/recruit.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //String title = 'Operators';
  int tab = 0;
  List<Widget> screen = [OperatorsList(), RecruitScreen(), EventScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 224, 224, 224),
      //   title: Text(
      //     title,
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   elevation: 0,
      // ),
      body: screen[tab],
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 224, 224, 224),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
          child: GNav(
              backgroundColor: Color.fromARGB(255, 224, 224, 224),
              tabBackgroundColor: Color.fromARGB(255, 206, 205, 205),
              padding: EdgeInsets.all(10),
              gap: 8,
              onTabChange: (value) {
                switch (value) {
                  case 0:
                    setState(() {
                      tab = value;
                      //title = 'Operators';
                    });
                    print(value);
                    break;
                  case 1:
                    setState(() {
                      tab = value;
                      //title = 'Recruit';
                    });
                    print(value);
                    break;
                  case 2:
                    setState(() {
                      tab = value;
                      //title = 'Events';
                    });
                    print(value);
                    break;
                  default:
                }
              },
              tabs: const [
                GButton(
                  icon: Icons.people_alt,
                  text: 'Operators',
                ),
                GButton(
                  icon: Icons.recent_actors_outlined,
                  text: 'Recruit',
                ),
                GButton(
                  icon: Icons.event,
                  text: 'Events',
                ),
              ]),
        ),
      ),
    );
  }
}
