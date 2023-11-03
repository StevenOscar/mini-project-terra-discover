part of 'pull_tracker_bloc.dart';

sealed class PullTrackerEvent extends Equatable {
  const PullTrackerEvent();

  @override
  List<Object> get props => [];
}

class GetCurrenciesDataEvent extends PullTrackerEvent {
  const GetCurrenciesDataEvent();

  @override
  List<Object> get props => [];
}

class SaveButtonPressedEvent extends PullTrackerEvent {
  final int orundumValue;
  final int originiumValue;
  final int oneHeadhuntingValue;
  final int tenHeadhuntingValue;

  const SaveButtonPressedEvent({
    required this.orundumValue,
    required this.originiumValue,
    required this.oneHeadhuntingValue,
    required this.tenHeadhuntingValue,
  });

  @override
  List<Object> get props => [orundumValue,originiumValue,oneHeadhuntingValue,tenHeadhuntingValue];
}

class FormFieldChangedEvent extends PullTrackerEvent {
  final int orundumValue;
  final int originiumValue;
  final int oneHeadhuntingValue;
  final int tenHeadhuntingValue;

  const FormFieldChangedEvent({
    required this.orundumValue,
    required this.originiumValue,
    required this.oneHeadhuntingValue,
    required this.tenHeadhuntingValue,
  });

  @override
  List<Object> get props => [orundumValue,originiumValue,oneHeadhuntingValue,tenHeadhuntingValue];
}