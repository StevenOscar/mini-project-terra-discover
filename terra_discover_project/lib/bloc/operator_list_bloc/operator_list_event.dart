part of 'operator_list_bloc.dart';

sealed class OperatorListEvent extends Equatable {
  const OperatorListEvent();
}

class SearchOperatorEvent extends OperatorListEvent {
  final String operatorName;

  const SearchOperatorEvent({
    required this.operatorName
  });

  @override
  List<Object> get props => [operatorName];
}

class GetAllOperatorEvent extends OperatorListEvent {
  @override
  List<Object> get props => [];
}