import 'package:flutter/material.dart';
import 'package:prj_wisatacandisi51/widgets/detail_screen.dart';
import 'package:prj_wisatacandisi51/data/candi_data.dart';
import 'package:prj_wisatacandisi51/widgets/home_screen.dart';
import 'package:prj_wisatacandisi51/widgets/profile_screen.dart';
import 'package:prj_wisatacandisi51/widgets/search_screen.dart';
import 'package:prj_wisatacandisi51/widgets/signin_screen.dart';
import 'package:prj_wisatacandisi51/widgets/favorite_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Wisata Candi',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.deepPurple),
                titleTextStyle: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            colorScheme:
                ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
              primary: Colors.deepPurple,
              surface: Colors.deepPurple[50],
            ),
            useMaterial3: true),

        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   useMaterial3: true,
        // ),
        home: MainScreen()
        //SearchScreen(),
        //SignInScreen()
        //ProfileScreen(),
        //DetailScreen(candi: candiList[0]),
        );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.blueAccent[50]),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.blueAccent,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.blueAccent,
                ),
                label: "Pencarian"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.blueAccent,
                ),
                label: "Favorite"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.blueAccent,
                ),
                label: "Profile"),
          ],
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.blueAccent[100],
          showUnselectedLabels: true,
        ),
      ),
      //TODO 2 Buat Properti body berupa widget yg ditampilkan
      //TODO 3 Buat Properti bottomNavigatorBar dengan nilai Theme
      //TODO 4 Buat Buat data dan child dari Theme
    );
  }
}
