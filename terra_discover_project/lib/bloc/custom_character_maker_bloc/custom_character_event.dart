part of 'custom_character_bloc.dart';

sealed class CustomCharacterMakerEvent extends Equatable {
  const CustomCharacterMakerEvent();

  @override
  List<Object> get props => [];
}

class ImageGenerateButtonPressed extends CustomCharacterMakerEvent{
  final String imagePrompt;

  const ImageGenerateButtonPressed({
    required this.imagePrompt
  });

  @override
  List<Object> get props => [];
}

class SaveButtonPressedEvent extends CustomCharacterMakerEvent {
  final String name;
  final String rarity;
  final String imageHash;
  final String mainClass;
  final String talent;
  final String skill;

  const SaveButtonPressedEvent({
    required this.name,
    required this.rarity,
    required this.imageHash,
    required this.mainClass,
    required this.talent,
    required this.skill,
  });

  @override
  List<Object> get props => [name, rarity, imageHash, mainClass, talent, skill];
}