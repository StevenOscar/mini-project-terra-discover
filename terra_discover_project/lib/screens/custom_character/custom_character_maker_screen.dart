import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terra_discover_project/bloc/custom_character_maker_bloc/custom_character_bloc.dart';
import 'package:terra_discover_project/constant/image_api_constant.dart';
import 'package:terra_discover_project/routes_navigation.dart';
import 'package:terra_discover_project/themes/theme_colors.dart';
import 'package:terra_discover_project/themes/theme_text_styles.dart';
import 'package:terra_discover_project/widgets/drawer_widget.dart';
import 'package:terra_discover_project/widgets/elevated_button_widget.dart';
import 'package:terra_discover_project/widgets/text_form_field_widget.dart';

class CustomCharacterMakerScreen extends StatelessWidget {
  const CustomCharacterMakerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController queryController = TextEditingController();
    return Scaffold(
      backgroundColor: ThemeColors.colorBlackBackground,
      appBar: AppBar(
        title: const Text("Character Maker", style: ThemeTextStyles.headlineSmall),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    "Character Maker",
                    style: ThemeTextStyles.headlineLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: TextFormFieldWidget(
                    controller: queryController,
                    hintText: 'Enter your character prompt here',
                    maxLines: 3,
                  ),
                ),
                ElevatedButtonWidget(
                  onPressed: (){
                    context.read<CustomCharacterMakerBloc>().add(ImageGenerateButtonPressed(imagePrompt: queryController.text));
                    queryController.clear();
                  },
                  color: ThemeColors.colorLightGreen,
                  text: 'Generate Image',
                ),
                const SizedBox(height: 30),
                BlocBuilder<CustomCharacterMakerBloc, CustomCharacterMakerState>(
                  builder: (context, state) {
                    if(state is CustomCharacterMakerLoading){
                      return const CircularProgressIndicator();
                    }
                    if(state is CustomCharacterMakerLoaded){
                      TextEditingController nameController = TextEditingController();
                      TextEditingController rarityController = TextEditingController();
                      TextEditingController mainClassController = TextEditingController();
                      TextEditingController talentController = TextEditingController();
                      TextEditingController skillController = TextEditingController();
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 40),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Image.network(
                                "https://arimagesynthesizer.p.rapidapi.com/get?hash=${state.imageHash}",
                                headers: {
                                  'X-RapidAPI-Key' : apiKey,
                                  'X-RapidAPI-Host' : "arimagesynthesizer.p.rapidapi.com"
                                },
                              ),
                            ),
                            const SizedBox(height: 30),
                            const Text(
                              "Name",
                              style: ThemeTextStyles.headlineSmall,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical : 20),
                              child: TextFormFieldWidget(
                                controller: nameController,
                                hintText: "Enter your operator name",
                              ),
                            ),
                            const Text(
                              "Rarity",
                              style: ThemeTextStyles.headlineSmall,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical : 20),
                              child: TextFormFieldWidget(
                                controller: rarityController,
                                hintText: "Enter your operator rarity",
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const Text(
                              "Main Class",
                              style: ThemeTextStyles.headlineSmall,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical : 20),
                              child: TextFormFieldWidget(
                                controller: mainClassController,
                                hintText: "Enter your operator main class",
                              ),
                            ),
                            const Text(
                              "Talent",
                              style: ThemeTextStyles.headlineSmall,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical : 20),
                              child: TextFormFieldWidget(
                                controller: talentController,
                                hintText: "Enter your operator talent",
                                maxLines: 2,
                              ),
                            ),
                            const Text(
                              "Skill",
                              style: ThemeTextStyles.headlineSmall,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical : 20),
                              child: TextFormFieldWidget(
                                controller: skillController,
                                hintText: "Enter your operator \nmain skill description",
                                maxLines: 2,
                              ),
                            ),
                            const SizedBox(height: 40),
                            ElevatedButtonWidget(
                              onPressed: () {
                                if(
                                  nameController.value.text.isEmpty ||
                                  rarityController.value.text.isEmpty ||
                                  mainClassController.value.text.isEmpty ||
                                  talentController.value.text.isEmpty
                                ){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Name, Rarity, Class, and Talent can't be empty",
                                        style: TextStyle(fontSize: 16)
                                      ),
                                    ),
                                  );
                                } else {
                                  context.read<CustomCharacterMakerBloc>().add(SaveButtonPressedEvent(
                                    name: nameController.text,
                                    rarity: rarityController.text,
                                    imageHash: state.imageHash,
                                    mainClass: mainClassController.text,
                                    talent: talentController.text,
                                    skill: skillController.text
                                  ));

                                  nameController.clear();
                                  rarityController.clear();
                                  mainClassController.clear();
                                  talentController.clear();
                                  skillController.clear();

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Your character data saved successfully on local Database',
                                        style: TextStyle(fontSize: 16)
                                      ),
                                    ),
                                  );

                                  Navigator.pop(context);
                                  Navigator.pushNamed(
                                    context,
                                    RoutesNavigation().customCharacterListScreen
                                  );
                                }
                              },
                              color: ThemeColors.colorDarkBlue,
                              text: "Save data to Local Storage"
                            ),
                            const SizedBox(height: 100)
                          ],
                        ),
                      );
                    }
                    if(state is CustomCharacterMakerFailed){
                      return Text(
                        state.errorMessage,
                        style: ThemeTextStyles.bodyMedium,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                )
              ],
                ),
          ),
        ),
    ));
  }
}