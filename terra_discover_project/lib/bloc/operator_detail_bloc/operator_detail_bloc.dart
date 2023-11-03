import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terra_discover_project/models/operator_model.dart';

part 'operator_detail_event.dart';
part 'operator_detail_state.dart';

class OperatorDataBloc extends Bloc<OperatorDataEvent, OperatorDataState> {
  OperatorDataBloc() : super(OperatorDataInitial()) {
    on<OperatorDataFetchEvent>((event, emit) {
      OperatorModel newOperatorData = event.operator;

      for (int i = 0; i < newOperatorData.art.length; i++) {
        if(newOperatorData.art[i].name == "Base"){
          newOperatorData.art[i].link = "assets/images/avatar/${newOperatorData.name}.png";
        }
      }

      if(newOperatorData.operatorClass!.isNotEmpty){
        for (int i = 1; i <newOperatorData.operatorClass!.length; i++){
          if (newOperatorData.operatorClass![0] == "Guard") {
            if(
              newOperatorData.operatorClass![1] == "AoE" ||
              newOperatorData.operatorClass![1] == "Duelist" ||
              newOperatorData.operatorClass![1] == "Brawler" ||
              newOperatorData.operatorClass![1] == "Support" ||
              newOperatorData.operatorClass![1] == "Ranged" ||
              newOperatorData.operatorClass![1] == "Enmity" ||
              newOperatorData.operatorClass![1] == "Dualstrike"
            ){
              newOperatorData.operatorClass!.removeAt(1);
            }
          } else if(newOperatorData.operatorClass![0] == "Vanguard") {
            if(
              newOperatorData.operatorClass![1] == "Summoner" ||
              newOperatorData.operatorClass![1] == "DP-On-Kill" ||
              newOperatorData.operatorClass![1] == "Skill-DP" ||
              newOperatorData.operatorClass![1] == "Flagbearer"
            ){
              newOperatorData.operatorClass!.removeAt(1);
            }
          } else if(newOperatorData.operatorClass![0] == "Supporter") {
            if(
              newOperatorData.operatorClass![1] == "Buffer" ||
              newOperatorData.operatorClass![1] == "Aura" ||
              newOperatorData.operatorClass![1] == "Slower" ||
              newOperatorData.operatorClass![1] == "Debuffer"
            ){
              newOperatorData.operatorClass!.removeAt(1);
            }
          } else if(newOperatorData.operatorClass![0] == "Specialist") {
            if(
              newOperatorData.operatorClass![1] == "Substitute" ||
              newOperatorData.operatorClass![1] == "Fast-Redeploy" ||
              newOperatorData.operatorClass![1] == "Sacrificial" ||
              newOperatorData.operatorClass![1] == "Puller" ||
              newOperatorData.operatorClass![1] == "DP-Drain" ||
              newOperatorData.operatorClass![1] == "Pusher"
            ){
              newOperatorData.operatorClass!.removeAt(1);
            }
          } else if(newOperatorData.operatorClass![0] == "Defender") {
            if(
              newOperatorData.operatorClass![1] == "Healing" ||
              newOperatorData.operatorClass![1] == "Enmity" ||
              newOperatorData.operatorClass![1] == "Normal"
            ){
              newOperatorData.operatorClass!.removeAt(1);
            }
          } else if(newOperatorData.operatorClass![0] == "Caster") {
            if(
              newOperatorData.operatorClass![1] == "Burninator" ||
              newOperatorData.operatorClass![1] == "ST" ||
              newOperatorData.operatorClass![1] == "Drone" ||
              newOperatorData.operatorClass![1] == "Charge" ||
              newOperatorData.operatorClass![1] == "Modal" ||
              newOperatorData.operatorClass![1] == "AoE"
            ){
              newOperatorData.operatorClass!.removeAt(1);
            }
          } else if(newOperatorData.operatorClass![0] == "Sniper") {
            if(
              newOperatorData.operatorClass![1] == "AoE" ||
              newOperatorData.operatorClass![1] == "Heavyweight" ||
              newOperatorData.operatorClass![1] == "Long-Range" ||
              newOperatorData.operatorClass![1] == "Aftershock" ||
              newOperatorData.operatorClass![1] == "Close Range" ||
              newOperatorData.operatorClass![1] == "Anti-Air" ||
              newOperatorData.operatorClass![1] == "Boomstick"
            ){
              newOperatorData.operatorClass!.removeAt(1);
            }
          } else if(newOperatorData.operatorClass![0] == "Medic") {
            if(
              newOperatorData.operatorClass![1] == "ST" ||
              newOperatorData.operatorClass![1] == "AoE" ||
              newOperatorData.operatorClass![1] == "Wide-Range"
            ){
              newOperatorData.operatorClass!.removeAt(1);
            }
          }
        }
      }

      if(newOperatorData.rarity == 3){
        newOperatorData.skills[0].variations.removeRange(7,10);
      }

      return emit(OperatorDataFiltered(
        operatorData: newOperatorData,
      ));
    });
  }
}
