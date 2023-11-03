import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terra_discover_project/models/api/image_api.dart';
import 'package:terra_discover_project/models/custom_character_model.dart';
import 'package:terra_discover_project/utils/db_helper/database_helper.dart';

part 'custom_character_event.dart';
part 'custom_character_state.dart';

class CustomCharacterMakerBloc extends Bloc<CustomCharacterMakerEvent, CustomCharacterMakerState> {
  CustomCharacterMakerBloc() : super(CustomCharacterMakerInitial()) {
    late DatabaseHelper dbHelper = DatabaseHelper();

    on<ImageGenerateButtonPressed>((event, emit) async {
      try {
        emit(CustomCharacterMakerLoading());
        final String imageHash = await ImageApi().postImageQuery(prompt: event.imagePrompt);

        await Future.delayed(const Duration(seconds: 20),(){
          return emit(
            CustomCharacterMakerLoaded(
              imageHash: imageHash
            )
          );
        });
      } catch (e) {
        return emit(
          const CustomCharacterMakerFailed(
            errorMessage: "Character Create Failed"
          )
        );
      }
    });

    on<SaveButtonPressedEvent>((event, emit) async {
      int highestId = await dbHelper.getHighestId();

      await dbHelper.addCustomCharacter(
        customCharacterModel: CustomCharacterModel(
          id: highestId + 1,
          name: event.name,
          imageHash: event.imageHash,
          rarity: int.tryParse(event.rarity) ?? 0,
          mainClass: event.mainClass,
          talent: event.talent,
          skill: event.skill
        )
      );

      return emit(
        CustomCharacterMakerLoading()
      );
    });
  }
}
