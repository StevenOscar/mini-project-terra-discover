part of 'operator_detail_bloc.dart';

sealed class OperatorDataState extends Equatable {
  const OperatorDataState();

  @override
  List<Object> get props => [];
}

final class OperatorDataInitial extends OperatorDataState {}

class OperatorDataFiltered extends OperatorDataState {
  final OperatorModel operatorData;

  const OperatorDataFiltered({
    required this.operatorData,
  });

  @override
  List<Object> get props => [operatorData];
}