import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/providers/share_state.dart';
import 'package:twitter/screens/chats_screen.dart';
import 'package:twitter/screens/home_screen.dart';
import 'package:twitter/screens/notifications_screen.dart';
import 'package:twitter/screens/search_screen.dart';

class BarMenu extends StatefulWidget {
  const BarMenu({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BarMenu();
  }
}

class _BarMenu extends State<BarMenu> {
  static const List<Widget> _screenOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    NotificationsScreen(),
    ChatsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // final int index = Provider.of<SharedState>(context, listen: false).pageNum;
    return Consumer<SharedState>(
      builder: (context, state, child) {
        return Scaffold(
          body: IndexedStack(
            index: state.pageNum,
            children: _screenOptions,
          ),
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.email), label: ''),
            ],
            currentIndex: state.pageNum,
            onTap: (int idenx) {
              state.setpageIndex = idenx;
            },
          ),
        );
      },
    );
  }
}
