part of 'custom_character_bloc.dart';

sealed class CustomCharacterMakerState extends Equatable {
  const CustomCharacterMakerState();

  @override
  List<Object> get props => [];
}

final class CustomCharacterMakerInitial extends CustomCharacterMakerState {}

final class CustomCharacterMakerLoading extends CustomCharacterMakerState {}

final class CustomCharacterMakerFailed extends CustomCharacterMakerState {
  final String errorMessage;

  const CustomCharacterMakerFailed({
    required this.errorMessage
  });

  @override
  List<Object> get props => [errorMessage];
}

class CustomCharacterMakerLoaded extends CustomCharacterMakerState {
  final String imageHash;

  const CustomCharacterMakerLoaded({
    required this.imageHash
  });

  @override
  List<Object> get props => [imageHash];
}