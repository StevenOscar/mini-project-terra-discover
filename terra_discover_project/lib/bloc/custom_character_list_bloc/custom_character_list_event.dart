part of 'custom_character_list_bloc.dart';

sealed class CustomCharacterListEvent extends Equatable {
  const CustomCharacterListEvent();

  @override
  List<Object> get props => [];
}

class FetchDatabaseEvent extends CustomCharacterListEvent {}

class CustomCharacterListDeletedEvent extends CustomCharacterListEvent {
  final int index;

  const CustomCharacterListDeletedEvent({
    required this.index
  });

  @override
  List<Object> get props => [index];
}