import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terra_discover_project/models/custom_character_model.dart';
import 'package:terra_discover_project/utils/db_helper/database_helper.dart';

part 'custom_character_list_event.dart';
part 'custom_character_list_state.dart';

class CustomCharacterListBloc extends Bloc<CustomCharacterListEvent, CustomCharacterListState> {
  CustomCharacterListBloc() : super(CustomCharacterListInitial()) {
    late DatabaseHelper dbHelper = DatabaseHelper();

    on<FetchDatabaseEvent>((event, emit) async {
      List<CustomCharacterModel> characterList = await dbHelper.getCustomCharacter();

      return emit(
        CustomCharacterListLoaded(
          characterList: characterList
        )
      );
    });

    on<CustomCharacterListDeletedEvent>((event, emit) async {
      await dbHelper.deleteCustomCharacter(id : state.characterList[event.index].id);

      List<CustomCharacterModel> newCharacterList = await dbHelper.getCustomCharacter();

      return emit(
        CustomCharacterListLoaded(
          characterList: newCharacterList
        )
      );
    });
  }
}
