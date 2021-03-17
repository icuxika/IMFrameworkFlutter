import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with RestorationMixin {
  final RestorableInt _currentIndex = RestorableInt(0);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    var homeNavigationBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: const Icon(Icons.message), label: "消息"),
      BottomNavigationBarItem(icon: const Icon(Icons.people), label: "联系人"),
      BottomNavigationBarItem(
          icon: const Icon(Icons.account_circle), label: "我的"),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("标题"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        items: homeNavigationBarItems,
        currentIndex: _currentIndex.value,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        onTap: (index) {
          setState(() {
            _currentIndex.value = index;
          });
        },
        selectedItemColor: colorScheme.onPrimary,
        unselectedItemColor: colorScheme.onPrimary.withOpacity(0.36),
        backgroundColor: colorScheme.primary,
      ),
    );
  }

  @override
  // TODO: implement restorationId
  String get restorationId => "_home_navigation";

  @override
  void restoreState(RestorationBucket oldBucket, bool initialRestore) {
    registerForRestoration(_currentIndex, "_home_navigation");
  }

  @override
  void dispose() {
    _currentIndex.dispose();
    super.dispose();
  }
}
