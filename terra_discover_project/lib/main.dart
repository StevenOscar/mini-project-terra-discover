import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:terra_discover_project/bloc/custom_character_list_bloc/custom_character_list_bloc.dart';
import 'package:terra_discover_project/bloc/custom_character_maker_bloc/custom_character_bloc.dart';
import 'package:terra_discover_project/bloc/event_list_bloc/event_list_bloc.dart';
import 'package:terra_discover_project/bloc/gacha_simulator_bloc/gacha_simulator_bloc.dart';
import 'package:terra_discover_project/bloc/operator_detail_bloc/operator_detail_bloc.dart';
import 'package:terra_discover_project/bloc/operator_list_bloc/operator_list_bloc.dart';
import 'package:terra_discover_project/routes_navigation.dart';
import 'package:terra_discover_project/home_screen.dart';
import 'package:terra_discover_project/screens/custom_character/custom_character_list_screen.dart';
import 'package:terra_discover_project/screens/custom_character/custom_character_maker_screen.dart';
import 'package:terra_discover_project/screens/event_list/event_list_screen.dart';
import 'package:terra_discover_project/screens/gacha_simulator/gacha_simulator_screen.dart';
import 'package:terra_discover_project/screens/operator_detail/operator_detail_screen.dart';
import 'package:terra_discover_project/screens/operator_list/operator_list_screen.dart';
import 'package:terra_discover_project/screens/pull_tracker/pull_tracker_screen.dart';
import 'package:terra_discover_project/themes/theme_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OperatorListBloc(),
        ),
        BlocProvider(
          create: (context) => OperatorDataBloc(),
        ),
        BlocProvider(
          create: (context) => CustomCharacterMakerBloc(),
        ),
        BlocProvider(
          create: (context) => CustomCharacterListBloc(),
        ),
        BlocProvider(
          create: (context) => EventListBloc(),
        ),
        BlocProvider(
          create: (context) => GachaSimulatorBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesNavigation().homeScreen,
        theme: ThemeData(
          fontFamily: GoogleFonts.titilliumWeb().fontFamily,
          brightness: Brightness.dark,
          useMaterial3: false,
          appBarTheme: const AppBarTheme(
            backgroundColor: ThemeColors.colorBlack
          ),
        ),
        routes: {
          RoutesNavigation().homeScreen : (context) => const HomeScreen(),
          RoutesNavigation().operatorDetailInitScreen : (context) => const OperatorDetailInitScreen(),
          RoutesNavigation().operatorListScreen : (context) => const OperatorListScreen(),
          RoutesNavigation().pullTrackerInitScreen : (context) => const PullTrackerInitScreen(),
          RoutesNavigation().customCharacterMakerScreen : (context) => const CustomCharacterMakerScreen(),
          RoutesNavigation().customCharacterListScreen : (context) => const CustomCharacterListScreen(),
          RoutesNavigation().eventListScreen : (context) => const EventListInitScreen(),
          RoutesNavigation().gachaSimulatorInitScreen : (context) => const GachaSimulatorInitScreen(),
        },
        title: "Mini Project Terra Discover"
      )
    );
  }
}