import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terra_discover_project/models/api/operator_api.dart';

import '../../../models/operator_model.dart';

part 'operator_list_event.dart';
part 'operator_list_state.dart';

class OperatorListBloc extends Bloc<OperatorListEvent, OperatorListState> {
  OperatorListBloc() : super(OperatorListInitial()) {
    on<SearchOperatorEvent>((event, emit) async{
      try {
        emit(OperatorListLoading());
        final List<OperatorModel> operatorList = await OperatorApi().searchOperator(operatorName: event.operatorName);
        emit(
          OperatorListLoaded(
            operatorList: operatorList
          )
        );
      } catch (e) {
        emit(
          const OperatorListFailed(
            errorMessage: "Operator Not Found"
          )
        );
      }
    });

    on<GetAllOperatorEvent>((event, emit) async{
      try {
        emit(OperatorListLoading());
        final List<OperatorModel> operatorList = await OperatorApi().getAllOperator();
        emit(
          OperatorListLoaded(
            operatorList: operatorList
          )
        );
      } catch (e) {
        emit(
          const OperatorListFailed(
            errorMessage: "Operator Not Found"
          )
        );
      }
    });
  }
}
