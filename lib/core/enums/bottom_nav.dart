import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ads_app/ui/screens/home_screen/home_screen.dart'; 

enum BottomNavItem {
  home,
  messages,
  add,
  saved,
  profile;

  IconData get icon {
    switch (this) {
      case BottomNavItem.home:
        return Icons.home_outlined;
      case BottomNavItem.messages:
        return Icons.chat_outlined;
      case BottomNavItem.add:
        return Icons.add_circle_outline;
      case BottomNavItem.saved:
        return Icons.bookmark_outline;
      case BottomNavItem.profile:
        return Icons.person_outline;
    }
  }

  IconData get activeIcon {
    switch (this) {
      case BottomNavItem.home:
        return Icons.home;
      case BottomNavItem.messages:
        return Icons.chat;
      case BottomNavItem.add:
        return Icons.add_circle;
      case BottomNavItem.saved:
        return Icons.bookmark;
      case BottomNavItem.profile:
        return Icons.person;
    }
  }

  String get title {
    switch (this) {
      case BottomNavItem.home:
        return "الرئيسية";
      case BottomNavItem.messages:
        return "الرسائل";
      case BottomNavItem.add:
        return "الإضافة";
      case BottomNavItem.saved:
        return "المحفوظات";
      case BottomNavItem.profile:
        return "الملف الشخصي";
    }
  }
}

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() =>
      _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  BottomNavItem currentTab = BottomNavItem.home;

  final Map<BottomNavItem, Widget> screens = {
    
    BottomNavItem.home: const HomeScreen(), 
    
    BottomNavItem.messages: const Center(
      child: Text("الرسائل", style: TextStyle(fontSize: 30)),
    ),
    BottomNavItem.add: const Center(
      child: Text("الإضافة", style: TextStyle(fontSize: 30)),
    ),
    BottomNavItem.saved: const Center(
      child: Text("المحفوظات", style: TextStyle(fontSize: 30)),
    ),
    BottomNavItem.profile: const Center(
      child: Text("الملف الشخصي", style: TextStyle(fontSize: 30)),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: IndexedStack(
          index: currentTab.index,
          children: BottomNavItem.values
              .map((item) => screens[item]!)
              .toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentTab.index,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xff1E2A5A),
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              currentTab = BottomNavItem.values[index];
            });
          },
          items: BottomNavItem.values.map((item) {
            return BottomNavigationBarItem(
              icon: Icon(
                item == currentTab ? item.activeIcon : item.icon,
                size: item == BottomNavItem.add ? 40 : 24,
              ),
              label: item.title,
            );
          }).toList(),
        ),
      ),
    );
  }
}
