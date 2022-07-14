import 'package:flutter/material.dart';
import 'package:plow/screens/HomeScreen.dart';
import 'package:plow/screens/events/CalendarScreen.dart';
import 'package:plow/screens/events/MapScreen.dart';
import 'package:plow/screens/main/LiveScreen.dart';
import 'package:plow/screens/main/NewsScreen.dart';
import 'package:plow/screens/profile/CabinetScreen.dart';
import 'package:plow/screens/profile/ProfileScreen.dart';
import 'package:plow/screens/profile/SettingsScreen.dart';
import 'package:plow/screens/profile/ShopScreen.dart';
import 'package:plow/screens/profile/TeamScreen.dart';
import 'package:plow/screens/stats/StatScreen.dart';
import 'package:plow/services/ColorService.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

enum Screens {
  news,
  live,
  map,
  profile,
  settings,
  shop,
  team,
  calendar,
  cabinet,
  stat,
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: ColorService().primaryColor),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  Screens _screen = Screens.news;
  bool _isMap = false;

  @override
  Widget build(BuildContext context) {
    Widget body = NewsScreen();
    String appBarTitle = 'Главная';
    List<Widget> actions = [];

    switch (_screen) {
      case Screens.news:
        body = NewsScreen();
        appBarTitle = 'Главная';
        break;
      case Screens.live:
        body = LiveScreen();
        appBarTitle = 'Главная';
        break;
      case Screens.map:
        body = MapScreen();
        appBarTitle = 'Карта';
        actions.add(IconButton(onPressed: () {
          setState(() {
            _isMap = false;
            _screen = Screens.calendar;
          });
        }, icon: Icon(Icons.calendar_month, size: 30.0,)));
        break;
      case Screens.profile:
        body = ProfileScreen();
        appBarTitle = 'Профиль';
        break;
      case Screens.settings:
        body = SettingsScreen();
        appBarTitle = 'Настройки';
        break;
      case Screens.shop:
        body = ShopScreen();
        appBarTitle = 'Магазин';
        break;
      case Screens.team:
        body = TeamScreen();
        appBarTitle = 'Команды';
        break;
      case Screens.calendar:
        body = CalendarScreen();
        appBarTitle = 'Календарь';
        actions.add(IconButton(onPressed: () {
          setState(() {
            _isMap = true;
            _screen = Screens.map;
          });
        }, icon: Icon(Icons.map_outlined, size: 30.0,)));
        break;
      case Screens.cabinet:
        body = CabinetScreen();
        appBarTitle = 'Кабинет';
        break;
      case Screens.stat:
        body = StatScreen();
        appBarTitle = 'Рейтинг';
        break;
    }

    actions.add(SizedBox(width: 12.0,));

    return Scaffold(
      appBar: _appBar(title: appBarTitle, actions: actions),
      bottomNavigationBar: _bottomNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: body,
      ),
    );
  }

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          _screen = Screens.news;
          break;
        case 1:
          if (_isMap) {
            _screen = Screens.map;
          } else {
            _screen = Screens.calendar;
          }
          break;
        case 2:
          _screen = Screens.stat;
          break;
        case 3:
          _screen = Screens.cabinet;
          break;
      }
    });
  }

  Widget _bottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        color: Colors.white
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SalomonBottomBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        itemPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        items: <SalomonBottomBarItem>[
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text('Главная'),
          ),
          SalomonBottomBarItem(
              icon: Icon(Icons.event), title: Text('Мероприятия')),
          SalomonBottomBarItem(
              icon: Icon(Icons.leaderboard), title: Text('Рейтинг')),
          SalomonBottomBarItem(icon: Icon(Icons.person), title: Text('Кабинет')),
        ],
      ),
    );
  }

  PreferredSize _appBar({required String title, required List<Widget> actions}) {
    return PreferredSize(
      preferredSize: Size.fromHeight(65.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 8.0,
          ),
          AppBar(
            centerTitle: false,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 2.0,
            shadowColor: Colors.grey.withOpacity(0.5),
            actions: actions,
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0),
            ),
          ),
        ],
      ),
    );
  }
}
