part of 'operator_detail_bloc.dart';

sealed class OperatorDataEvent extends Equatable {
  const OperatorDataEvent();

  @override
  List<Object> get props => [];
}

class OperatorDataFetchEvent extends OperatorDataEvent {
  final OperatorModel operator;

  const OperatorDataFetchEvent({
    required this.operator
  });

  @override
  List<Object> get props => [operator];
}