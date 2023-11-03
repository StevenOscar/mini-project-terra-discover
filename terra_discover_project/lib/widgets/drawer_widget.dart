import 'package:flutter/material.dart';
import 'package:terra_discover_project/themes/theme_colors.dart';
import 'package:terra_discover_project/themes/theme_text_styles.dart';

import '../routes_navigation.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ThemeColors.colorBlackBackground,
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: ThemeColors.colorBlack
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                  child :Image.asset("assets/images/misc/sticker1.png")
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Terra Discover",
                    style: ThemeTextStyles.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
          ),
          ListTile(
            leading: const Padding(
              padding: EdgeInsets.only(left: 8, top: 5, bottom: 5),
              child: Icon(Icons.person, size: 30),
            ),
            title: const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Operator List",
                style: ThemeTextStyles.headlineExtraSmall
              ),
            ),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                RoutesNavigation().operatorListScreen,
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: ThemeColors.colorGrey,
              thickness: 1,
            ),
          ),
          ListTile(
            leading: const Padding(
              padding: EdgeInsets.only(left: 8, top: 5, bottom: 5),
              child: Icon(Icons.attach_money, size: 30),
            ),
            title: const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Pull Tracker",
                style: ThemeTextStyles.headlineExtraSmall
              ),
            ),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                RoutesNavigation().pullTrackerInitScreen,
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: ThemeColors.colorGrey,
              thickness: 1,
            ),
          ),
          ListTile(
            leading: const Padding(
              padding: EdgeInsets.only(left: 8, top: 5, bottom: 5),
              child: Icon(Icons.auto_awesome_rounded, size: 30),
            ),
            title: const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Custom Character",
                style: ThemeTextStyles.headlineExtraSmall
              ),
            ),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                RoutesNavigation().customCharacterListScreen,
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: ThemeColors.colorGrey,
              thickness: 1,
            ),
          ),
          ListTile(
            leading: const Padding(
              padding: EdgeInsets.only(left: 8, top: 5, bottom: 5),
              child: Icon(Icons.event, size: 30),
            ),
            title: const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Event List",
                style: ThemeTextStyles.headlineExtraSmall
              ),
            ),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                RoutesNavigation().eventListScreen,
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: ThemeColors.colorGrey,
              thickness: 1,
            ),
          ),
          ListTile(
            leading: const Padding(
              padding: EdgeInsets.only(left: 8, top: 5, bottom: 5),
              child: Icon(Icons.question_mark, size: 30),
            ),
            title: const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Gacha Simulator",
                style: ThemeTextStyles.headlineExtraSmall
              ),
            ),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                RoutesNavigation().gachaSimulatorInitScreen,
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: ThemeColors.colorGrey,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}