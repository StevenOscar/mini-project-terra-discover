import 'package:dio/dio.dart';

import '../operator_model.dart';

class OperatorApi {
  Future<List<OperatorModel>> getAllOperator() async {
    List<OperatorModel> operatorList = [];
    final response = await Dio().get(
      'http://rhodesapi.up.railway.app/api/operator/',
    );

    for (var element in response.data) {
      operatorList.add(OperatorModel.fromJson(element));
    }

    return operatorList;
  }

  Future<List<OperatorModel>> searchOperator({required String operatorName}) async {
    String nameQuery = operatorName.replaceAll(' ', '%20');
    List<OperatorModel> operatorList = [];

    final response = await Dio().get('http://rhodesapi.up.railway.app/api/operator/$nameQuery');

    operatorList.add(OperatorModel.fromJson(response.data));

    return operatorList;
  }
}