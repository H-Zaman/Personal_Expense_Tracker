import 'package:expensetracker/app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      body: PageView(
        onPageChanged: _controller.pageViewIndex,
        controller: _controller.pageViewController,
        children: _controller.homeViews
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _controller.pageViewIndex.value,
        onTap: (index){
          _controller.pageViewController.jumpToPage(index);
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home
            )
          ),
          BottomNavigationBarItem(
            label: 'History',
            icon: Icon(
              Icons.history
            )
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(
              Icons.settings
            )
          ),
        ],
      ),
    ));
  }
}