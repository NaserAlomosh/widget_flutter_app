import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:widget_flutter_app/view/account.dart';
import 'package:widget_flutter_app/view/home.dart';
import 'package:widget_flutter_app/view/search.dart';
import 'package:widget_flutter_app/view/shopping_cart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller = PersistentTabController();
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PersistentTabView(
            context,
            controller: controller,
            screens: const [
              HomeView(),
              SearchView(),
              ShoppingCart(),
              AccountView(),
            ],
            items: [
              PersistentBottomNavBarItem(
                  icon: const Icon(
                Icons.home,
                color: Colors.white,
              )),
              PersistentBottomNavBarItem(
                  icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
              PersistentBottomNavBarItem(
                  icon: const Icon(
                Icons.shopping_bag,
                color: Colors.white,
              )),
              PersistentBottomNavBarItem(
                  icon: const Icon(
                Icons.person,
                color: Colors.white,
              )),
            ],
            confineInSafeArea: true,
            backgroundColor: Colors.black54, // Default is Colors.white.
            handleAndroidBackButtonPress: true, // Default is true.
            resizeToAvoidBottomInset: true,
            // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: true, // Default is true.
            hideNavigationBarWhenKeyboardShows:
                true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar: Colors.white,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),

            navBarStyle: NavBarStyle
                .style1, // Choose the nav bar style with this property.
          ),
        ),
      ),
    );
  }
}
