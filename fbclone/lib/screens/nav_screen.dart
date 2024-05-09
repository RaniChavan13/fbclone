import 'package:fbclone/data/data.dart';
import 'package:fbclone/screens/screens.dart';
import 'package:fbclone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context) ? PreferredSize(preferredSize: const Size.fromHeight( 100.0), child: CustomAppBar(
          currentUser: currentUser,
          icons:_icons,
          selectedIndex:_selectedIndex,
          onTap:(index)=> setState(()=> _selectedIndex=index),
        )): null,
        body:  IndexedStack(index: _selectedIndex, children: _screens,
          ),
        bottomNavigationBar: !Responsive.isDesktop(context) ? Container(
          padding: const EdgeInsets.only(bottom:12.0),
          child: CustomTabBar(
            icons: _icons,
            selectedIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
          ),
        )
        :const SizedBox.shrink(),
        ),
    );
  }
}
