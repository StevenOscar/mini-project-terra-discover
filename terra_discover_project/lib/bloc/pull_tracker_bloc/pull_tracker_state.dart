part of 'pull_tracker_bloc.dart';

sealed class PullTrackerState extends Equatable {
  const PullTrackerState();
}

final class PullTrackerInitial extends PullTrackerState {
  @override
  List<Object> get props => [];
}

class PullTrackerLoading extends PullTrackerState {
  @override
  List<Object> get props => [];
}

class PullTrackerLoaded extends PullTrackerState {
  final int? orundumValue;
  final int? originiumValue;
  final int? oneHeadhuntingValue;
  final int? tenHeadhuntingValue;
  final int? totalPull;


  const PullTrackerLoaded({
    required this.orundumValue,
    required this.originiumValue,
    required this.oneHeadhuntingValue,
    required this.tenHeadhuntingValue,
    required this.totalPull,

  });

  @override
  List<Object?> get props => [orundumValue,originiumValue,oneHeadhuntingValue,tenHeadhuntingValue,totalPull];
}

final class PullTrackerFailed extends PullTrackerState {
  final String errorMessage;

  const PullTrackerFailed({
    required this.errorMessage
  });

  @override
  List<Object> get props => [errorMessage];
}