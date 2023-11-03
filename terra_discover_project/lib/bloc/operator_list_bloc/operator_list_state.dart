part of 'operator_list_bloc.dart';

sealed class OperatorListState extends Equatable {
  const OperatorListState();

  @override
  List<Object> get props => [];
}

final class OperatorListInitial extends OperatorListState {}

final class OperatorListLoading extends OperatorListState {}

final class OperatorListLoaded extends OperatorListState {
  final List<OperatorModel> operatorList;

  const OperatorListLoaded({
    required this.operatorList
  });

  @override
  List<Object> get props => [operatorList];
}

final class OperatorListFailed extends OperatorListState {
  final String errorMessage;

  const OperatorListFailed({
    required this.errorMessage
  });

  @override
  List<Object> get props => [errorMessage];
}