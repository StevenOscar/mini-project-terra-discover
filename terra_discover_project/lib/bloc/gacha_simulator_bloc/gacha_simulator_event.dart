part of 'gacha_simulator_bloc.dart';

sealed class GachaSimulatorEvent extends Equatable {
  const GachaSimulatorEvent();

  @override
  List<Object> get props => [];
}

class GetAllOperatorEvent extends GachaSimulatorEvent {
  @override
  List<Object> get props => [];
}

class SinglePullButtonPressed extends GachaSimulatorEvent {
  final List<String> rateupOperator;
  final List<String> sixStarOperator;
  final List<String> fiveStarOperator;
  final List<String> fourStarOperator;
  final List<String> threeStarOperator;

  const SinglePullButtonPressed({
    required this.rateupOperator,
    required this.sixStarOperator,
    required this.fiveStarOperator,
    required this.fourStarOperator,
    required this.threeStarOperator,
  });

  @override
  List<Object> get props => [rateupOperator,sixStarOperator,fiveStarOperator,fourStarOperator,threeStarOperator];
}

class TenPullButtonPressed extends GachaSimulatorEvent {
  final List<String> rateupOperator;
  final List<String> sixStarOperator;
  final List<String> fiveStarOperator;
  final List<String> fourStarOperator;
  final List<String> threeStarOperator;

  const TenPullButtonPressed({
    required this.rateupOperator,
    required this.sixStarOperator,
    required this.fiveStarOperator,
    required this.fourStarOperator,
    required this.threeStarOperator,
  });

  @override
  List<Object> get props => [rateupOperator,sixStarOperator,fiveStarOperator,fourStarOperator,threeStarOperator];
}

class SelectOperatorButtonPressed extends GachaSimulatorEvent {
  final String firstOperator;
  final String secondOperator;
  final List<OperatorModel> operatorList;

  const SelectOperatorButtonPressed({
    required this.firstOperator,
    required this.secondOperator,
    required this.operatorList
  });

  @override
  List<Object> get props => [firstOperator,secondOperator,operatorList];
}