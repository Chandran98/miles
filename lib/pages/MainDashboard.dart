

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milesed/bloc/bloc/dataBloc.dart';
import 'package:milesed/bloc/event/dataEvent.dart';
import 'package:milesed/pages/OtherScreen.dart';
import 'package:milesed/pages/homeScreen.dart';

class MainDashboard extends StatefulWidget {
  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {

    @override
  void initState() {
    load();
    super.initState();
  }

  load() {
    context.read<DataBloc>().add(GetHomeData());
  }
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Tasksscreen(),
    Trendingscreen(),
    Videosscreen()
  ];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        load();
      },child:  SafeArea(
        child: Scaffold(
          body: Center(
            child: _widgetOptions[_selectedIndex],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment),
                label: 'Tasks',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.whatshot),
                label: 'Trending',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.video_library),
                label: 'Videos',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
