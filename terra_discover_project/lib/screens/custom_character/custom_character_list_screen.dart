import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terra_discover_project/bloc/custom_character_list_bloc/custom_character_list_bloc.dart';
import 'package:terra_discover_project/routes_navigation.dart';
import 'package:terra_discover_project/themes/theme_colors.dart';
import 'package:terra_discover_project/themes/theme_text_styles.dart';
import 'package:terra_discover_project/widgets/custom_character_list_widgets/list_view_widget.dart';
import 'package:terra_discover_project/widgets/drawer_widget.dart';
import 'package:terra_discover_project/widgets/elevated_button_widget.dart';


class CustomCharacterListScreen extends StatelessWidget {
  const CustomCharacterListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<CustomCharacterListBloc>().add(FetchDatabaseEvent());
    return Scaffold(
      backgroundColor: ThemeColors.colorBlackBackground,
      appBar: AppBar(
        title: const Text("Custom Character List", style: ThemeTextStyles.headlineSmall),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButtonWidget(
                    onPressed: (){
                      Navigator.pushNamed(
                        context,
                        RoutesNavigation().customCharacterMakerScreen,
                      );
                    },
                    color: ThemeColors.colorLightGreen,
                    text: "Add new Character"
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                  child: Text(
                    "Custom character List",
                    style: ThemeTextStyles.headlineLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: BlocBuilder<CustomCharacterListBloc, CustomCharacterListState>(
                    builder: (context, state) {
                      if (state is CustomCharacterListLoaded){
                        return ListViewWidget(
                          characterList: state.characterList,
                        );
                      }
                      else {
                        return const SizedBox();
                      }
                    },
                  ),
                )
              ],
            )
          ),
        )
    );
  }
}
