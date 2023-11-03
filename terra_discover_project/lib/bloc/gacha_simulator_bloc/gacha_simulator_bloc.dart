import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terra_discover_project/models/api/operator_api.dart';
import 'dart:math';

import 'package:terra_discover_project/models/operator_model.dart';

part 'gacha_simulator_event.dart';
part 'gacha_simulator_state.dart';

class GachaSimulatorBloc extends Bloc<GachaSimulatorEvent, GachaSimulatorState> {
  GachaSimulatorBloc() : super(GachaSimulatorInitial()) {
    on<GetAllOperatorEvent>((event, emit) async {
      try {
        emit(GachaSimulatorLoading());
        final List<OperatorModel> operatorList = await OperatorApi().getAllOperator();

        emit(
          GachaSimulatorLoaded(
            operatorList: operatorList,
          )
        );
      } catch (e) {
        emit(
          const GachaSimulatorFailed(
            errorMessage: "Failed to retrieve operator data"
          )
        );
      }
    });

    on<SelectOperatorButtonPressed>((event, emit) {
      emit(GachaSimulatorLoading());

      List<String> rateupOperator = [];
      List<String> sixStarOperator = [];
      List<String> fiveStarOperator = [];
      List<String> fourStarOperator = [];
      List<String> threeStarOperator = [];

      rateupOperator.add(event.firstOperator);
      rateupOperator.add(event.secondOperator);

      for(int i = 0; i < event.operatorList.length; i++){
        if(event.operatorList[i].rarity == 6){
          sixStarOperator.add(event.operatorList[i].name);
        } else if(event.operatorList[i].rarity == 5){
          fiveStarOperator.add(event.operatorList[i].name);
        } else if(event.operatorList[i].rarity == 4){
          fourStarOperator.add(event.operatorList[i].name);
        } else if(event.operatorList[i].rarity == 3){
          threeStarOperator.add(event.operatorList[i].name);
        }
      }

      sixStarOperator.removeWhere((element) => element == event.firstOperator);
      sixStarOperator.removeWhere((element) => element == event.secondOperator);

      emit(
        RateupOperatorSelected(
          rateupOperator: rateupOperator,
          sixStarOperator: sixStarOperator,
          fiveStarOperator: fiveStarOperator,
          fourStarOperator: fourStarOperator,
          threeStarOperator: threeStarOperator
        )
      );
    });

    on<SinglePullButtonPressed>((event, emit) {
      emit(GachaSimulatorLoading());

      List<String> randomOperatorList = [];

      Random random = Random();
      final int randomValue = random.nextInt(100);

      if(randomValue == 0){
        final int randomIndex = random.nextInt(event.rateupOperator.length);
        final String randomString = event.rateupOperator[randomIndex];
        randomOperatorList.add(randomString);
      } else if(randomValue <= 1){
        final int randomIndex = random.nextInt(event.sixStarOperator.length);
        final String randomString = event.sixStarOperator[randomIndex];
        randomOperatorList.add(randomString);
      } else if(randomValue <= 9){
        final int randomIndex = random.nextInt(event.fiveStarOperator.length);
        final String randomString = event.fiveStarOperator[randomIndex];
        randomOperatorList.add(randomString);
      } else if(randomValue <= 59){
        final int randomIndex = random.nextInt(event.fourStarOperator.length);
        final String randomString = event.fourStarOperator[randomIndex];
        randomOperatorList.add(randomString);
      } else {
        final int randomIndex = random.nextInt(event.threeStarOperator.length);
        final String randomString = event.threeStarOperator[randomIndex];
        randomOperatorList.add(randomString);
      }

      emit(
        GachaSimulatorResultState(
          operatorName: randomOperatorList,
          rateupOperator: event.rateupOperator,
          sixStarOperator: event.sixStarOperator,
          fiveStarOperator: event.fiveStarOperator,
          fourStarOperator: event.fourStarOperator,
          threeStarOperator: event.threeStarOperator,
        )
      );
    });

    on<TenPullButtonPressed>((event, emit) {
      emit(GachaSimulatorLoading());

      List<String> randomOperatorList = [];

      Random random = Random();
      final int randomValue = random.nextInt(100);

      for(int i = 0; i< 10; i++){
        if(randomValue == 0){
          final int randomIndex = random.nextInt(event.rateupOperator.length);
          final String randomString = event.rateupOperator[randomIndex];
          randomOperatorList.add(randomString);
        } else if(randomValue <= 1){
          final int randomIndex = random.nextInt(event.sixStarOperator.length);
          final String randomString = event.sixStarOperator[randomIndex];
          randomOperatorList.add(randomString);
        } else if(randomValue <= 9){
          final int randomIndex = random.nextInt(event.fiveStarOperator.length);
          final String randomString = event.fiveStarOperator[randomIndex];
          randomOperatorList.add(randomString);
        } else if(randomValue <= 59){
          final int randomIndex = random.nextInt(event.fourStarOperator.length);
          final String randomString = event.fourStarOperator[randomIndex];
          randomOperatorList.add(randomString);
        } else {
          final int randomIndex = random.nextInt(event.threeStarOperator.length);
          final String randomString = event.threeStarOperator[randomIndex];
          randomOperatorList.add(randomString);
        }
      }
      print(randomOperatorList[0]);
      emit(
        GachaSimulatorResultState(
          operatorName: randomOperatorList,
          rateupOperator: event.rateupOperator,
          sixStarOperator: event.sixStarOperator,
          fiveStarOperator: event.fiveStarOperator,
          fourStarOperator: event.fourStarOperator,
          threeStarOperator: event.threeStarOperator,
        )
      );
    });
  }
}
