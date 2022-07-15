import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:plow/screens/events/CalendarScreen.dart';
import 'package:plow/screens/events/MapScreen.dart';
import 'package:plow/screens/main/LiveScreen.dart';
import 'package:plow/screens/main/MyNewsScreen.dart';
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
  my_news,
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

Future<void> main() async {
  Intl.defaultLocale = 'ru';
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
      locale: Locale('ru'),
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
  void initState() {
    super.initState();
    initializeDateFormatting('ru');
  }

  _callback(Screens screen) {
    setState(() {
      _screen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget body = NewsScreen();
    String appBarTitle = 'Главная';
    List<Widget> actions = [];
    bool _isBack = false;
    TabBar? bottom;
    double height = 65.0;

    switch (_screen) {
      case Screens.news:
        body = _tabView();
        bottom = _tabBar();
        height = 120.0;
        appBarTitle = 'Главная';
        break;
      case Screens.my_news:
        body = _tabView();
        bottom = _tabBar();
        height = 120.0;
        appBarTitle = 'Главная';
        break;
      case Screens.live:
        body = _tabView();
        bottom = _tabBar();
        height = 120.0;
        appBarTitle = 'Главная';
        break;
      case Screens.map:
        body = MapScreen();
        appBarTitle = 'Карта';
        actions.add(IconButton(
            onPressed: () {
              setState(() {
                _isMap = false;
                _screen = Screens.calendar;
              });
            },
            icon: Icon(
              Icons.calendar_month,
              size: 30.0,
            )));
        break;
      case Screens.profile:
        body = ProfileScreen();
        appBarTitle = 'Профиль';
        _isBack = true;
        break;
      case Screens.settings:
        body = SettingsScreen();
        appBarTitle = 'Настройки';
        _isBack = true;
        break;
      case Screens.shop:
        body = ShopScreen();
        appBarTitle = 'Магазин';
        _isBack = true;
        break;
      case Screens.team:
        body = TeamScreen();
        appBarTitle = 'Команды';
        _isBack = true;
        break;
      case Screens.calendar:
        body = CalendarScreen();
        appBarTitle = 'Календарь';
        actions.add(IconButton(
            onPressed: () {
              setState(() {
                _isMap = true;
                _screen = Screens.map;
              });
            },
            icon: Icon(
              Icons.map_outlined,
              size: 30.0,
            )));
        break;
      case Screens.cabinet:
        body = CabinetScreen(
          callback: _callback,
        );
        appBarTitle = 'Кабинет';
        break;
      case Screens.stat:
        body = StatScreen();
        appBarTitle = 'Рейтинг';
        break;
    }

    actions.add(SizedBox(
      width: 12.0,
    ));

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _appBar(
            title: appBarTitle,
            actions: actions,
            bottom: bottom,
            isBack: _isBack,
            height: height),
        bottomNavigationBar: _bottomNavigationBar(),
        body: body,
      ),
    );
  }

  TabBar _tabBar() {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: Colors.black,
      labelStyle: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
      indicatorWeight: 3.0,
      isScrollable: true,
      tabs: [
        Tab(text: 'Новости'),
        Tab(text: 'Для вас'),
        Tab(text: 'Прямые трансляции'),
      ],
    );
  }

  Widget _tabView() {
    return TabBarView(
      children: [
        NewsScreen(),
        MyNewsScreen(),
        LiveScreen(),
      ],
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
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 2,
          offset: Offset(0, 1), // changes position of shadow
        ),
      ], color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SalomonBottomBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        itemPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        items: <SalomonBottomBarItem>[
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text(
              'Главная',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          SalomonBottomBarItem(
              icon: Icon(Icons.event),
              title: Text(
                'Мероприятия',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )),
          SalomonBottomBarItem(
              icon: Icon(Icons.leaderboard),
              title: Text(
                'Рейтинг',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )),
          SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text(
                'Кабинет',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )),
        ],
      ),
    );
  }

  PreferredSize _appBar(
      {required String title,
      required List<Widget> actions,
      required TabBar? bottom,
      required bool isBack,
      required double height}) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 8.0,
          ),
          Expanded(
            child: AppBar(
              leading: isBack
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _screen = Screens.cabinet;
                        });
                      },
                      icon: Icon(Icons.arrow_back_ios),
                    )
                  : null,
              centerTitle: false,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 2.0,
              shadowColor: Colors.grey.withOpacity(0.5),
              actions: actions,
              bottom: bottom,
              title: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
