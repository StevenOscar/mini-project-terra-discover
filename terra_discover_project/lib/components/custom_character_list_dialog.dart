import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terra_discover_project/bloc/custom_character_list_bloc/custom_character_list_bloc.dart';
import 'package:terra_discover_project/constant/image_api_constant.dart';
import 'package:terra_discover_project/themes/theme_text_styles.dart';

  void deleteCustomCharacterDialog({
    required index,
    required BuildContext context,
  }) async {
    final characterListBloc = context.read<CustomCharacterListBloc>();
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {return false;},
          child: AlertDialog(
            backgroundColor: const Color.fromARGB(255, 26, 26, 26),
            title: const Text(
              "Delete Character",
              style: ThemeTextStyles.headlineSmallLightBlue,
              textAlign: TextAlign.center,
            ),
            content: Padding(
              padding: const EdgeInsets.only(top : 15, bottom: 5),
              child: Text(
                "Are you sure you want to delete '${characterListBloc.state.characterList[index].name}' data?",
                style: ThemeTextStyles.bodyMedium,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'No',
                  style : ThemeTextStyles.bodyMedium
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  characterListBloc.add(CustomCharacterListDeletedEvent(index: index));
                },
                child: const Text(
                  'Yes',
                  style : ThemeTextStyles.bodyMedium
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  customCharacterDetailDialog({
    required int index,
    required BuildContext context
  }) {
    final characterListBloc = context.read<CustomCharacterListBloc>();
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {return false;},
          child: AlertDialog(
            backgroundColor: const Color.fromARGB(255, 26, 26, 26),
            title: const Text(
              "Character Detail",
              style: ThemeTextStyles.headlineSmallLightBlue,
              textAlign: TextAlign.center,
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl: "https://arimagesynthesizer.p.rapidapi.com/get?hash=${characterListBloc.state.characterList[index].imageHash}",
                        httpHeaders: {
                          'X-RapidAPI-Key' : apiKey,
                          'X-RapidAPI-Host' : "arimagesynthesizer.p.rapidapi.com"
                        },
                        placeholder: (context, url) => const Icon(Icons.image),
                        errorWidget: (context, url, error) => const Icon(Icons.image_not_supported),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  const Text(
                    "Name",
                    style: ThemeTextStyles.headlineExtraSmall,
                  ),
                  Text(
                    characterListBloc.state.characterList[index].name,
                    style: ThemeTextStyles.bodyMedium,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Rarity",
                    style: ThemeTextStyles.headlineExtraSmall,
                  ),
                  Text(
                    characterListBloc.state.characterList[index].rarity.toString(),
                    style: ThemeTextStyles.bodyMedium,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Talent",
                    style: ThemeTextStyles.headlineExtraSmall,
                  ),
                  Text(
                    characterListBloc.state.characterList[index].talent,
                    style: ThemeTextStyles.bodyMedium,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Skill",
                    style: ThemeTextStyles.headlineExtraSmall,
                  ),
                  Text(
                    characterListBloc.state.characterList[index].skill,
                    style: ThemeTextStyles.bodyMedium,
                  ),
                ],
              )
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'OK',
                  style : ThemeTextStyles.bodyMedium
                ),
              ),
            ],
          ),
        );
      },
    );
  }