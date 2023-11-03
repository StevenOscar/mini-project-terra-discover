part of 'custom_character_list_bloc.dart';

sealed class CustomCharacterListState extends Equatable {
  final List<CustomCharacterModel> characterList;

  const CustomCharacterListState({
    required this.characterList
  });

  @override
  List<Object> get props => [];
}

final class CustomCharacterListInitial extends CustomCharacterListState {
  CustomCharacterListInitial() : super(characterList : []);
}

class CustomCharacterListLoaded extends CustomCharacterListState {
  const CustomCharacterListLoaded({
    required super.characterList
  });

  @override
  List<Object> get props => [characterList];
}
