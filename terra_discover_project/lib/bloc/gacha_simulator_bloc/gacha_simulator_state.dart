part of 'gacha_simulator_bloc.dart';

sealed class GachaSimulatorState extends Equatable {
  const GachaSimulatorState();

  @override
  List<Object> get props => [];
}

final class GachaSimulatorInitial extends GachaSimulatorState {}

final class GachaSimulatorLoading extends GachaSimulatorState {}

final class GachaSimulatorLoaded extends GachaSimulatorState {
  final List<OperatorModel> operatorList;

  const GachaSimulatorLoaded({
    required this.operatorList,
  });

  @override
  List<Object> get props => [operatorList];
}

final class GachaSimulatorFailed extends GachaSimulatorState {
  final String errorMessage;

  const GachaSimulatorFailed({
    required this.errorMessage
  });

  @override
  List<Object> get props => [errorMessage];
}

final class RateupOperatorSelected extends GachaSimulatorState {
  final List<String> rateupOperator;
  final List<String> sixStarOperator;
  final List<String> fiveStarOperator;
  final List<String> fourStarOperator;
  final List<String> threeStarOperator;

  const RateupOperatorSelected({
    required this.rateupOperator,
    required this.sixStarOperator,
    required this.fiveStarOperator,
    required this.fourStarOperator,
    required this.threeStarOperator,
  });

  @override
  List<Object> get props => [rateupOperator,sixStarOperator,fiveStarOperator,fourStarOperator,threeStarOperator];
}

class GachaSimulatorResultState extends GachaSimulatorState {
  final List<String> operatorName;
  final List<String> rateupOperator;
  final List<String> sixStarOperator;
  final List<String> fiveStarOperator;
  final List<String> fourStarOperator;
  final List<String> threeStarOperator;

  const GachaSimulatorResultState({
    required this.operatorName,
    required this.rateupOperator,
    required this.sixStarOperator,
    required this.fiveStarOperator,
    required this.fourStarOperator,
    required this.threeStarOperator,
  });

  @override
  List<Object> get props => [operatorName,rateupOperator,sixStarOperator,fiveStarOperator,fourStarOperator,threeStarOperator];
}