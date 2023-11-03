import 'package:flutter/material.dart';
import 'package:terra_discover_project/themes/theme_text_styles.dart';
import 'package:terra_discover_project/widgets/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 26, 26),
      appBar: AppBar(
        title: const Text("Terra Discover", style: ThemeTextStyles.headlineSmall),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 100, right: 100, bottom: 40),
            child: Image.asset("assets/images/misc/sticker2.png"),
          ),
          const Text(
            "Welcome to Terra Discover",
            style: ThemeTextStyles.headlineLarge,
          ),
          const SizedBox(height: 20),
          const Text(
            "Created by Steven Oscar",
            style: ThemeTextStyles.bodyMedium,
          ),
          const Text(
            "Powered by RhodesAPI & ARImageSynthesizer",
            style: ThemeTextStyles.bodySmallYellow,
          )
        ],
      )
    );
  }
}