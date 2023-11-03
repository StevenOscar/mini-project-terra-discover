import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terra_discover_project/bloc/gacha_simulator_bloc/gacha_simulator_bloc.dart';
import 'package:terra_discover_project/themes/theme_colors.dart';
import 'package:terra_discover_project/themes/theme_text_styles.dart';
import 'package:terra_discover_project/widgets/drawer_widget.dart';
import 'package:terra_discover_project/widgets/elevated_button_widget.dart';


// Halaman ini belum berjalan dengan baik

class GachaSimulatorInitScreen extends StatelessWidget {
  const GachaSimulatorInitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GachaSimulatorBloc>(
      create: (context) {
        return GachaSimulatorBloc()..add(GetAllOperatorEvent());
      },
      child: const GachaSimulatorScreen());
  }
}

class GachaSimulatorScreen extends StatelessWidget {
  const GachaSimulatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.colorBlackBackground,
      appBar: AppBar(
        title: const Text("Gacha Simulator", style: ThemeTextStyles.headlineSmall),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<GachaSimulatorBloc, GachaSimulatorState>(
              builder: (context, state) {
                if(state is GachaSimulatorLoading){
                  return const CircularProgressIndicator();
                }
                if(state is GachaSimulatorFailed){
                  return Text(state.errorMessage);
                }
                if(state is GachaSimulatorLoaded){
                  String firstOperatorValue = "Muelsyse";
                  String secondOperatorValue = "SilverAsh";
                  return Column(
                    children: [
                      // DropdownButton<String>(
                      //   value: firstOperatorValue,
                      //   isDense: true,
                      //   onChanged: (val) {
                      //     firstOperatorValue = val ?? "";
                      //   },
                      //   items: state.operatorList.where((operator) => operator.rarity == 6).map((operator) {
                      //     return DropdownMenuItem<String>(
                      //       value: operator.name,
                      //       child: Text(operator.name),
                      //     );
                      //   }).toList(),
                      // ),
                      // DropdownButton<String>(
                      //   value: secondOperatorValue,
                      //   isDense: true,
                      //   onChanged: (val) {
                      //     secondOperatorValue = val ?? "";
                      //   },
                      //   items: state.operatorList.where((operator) => operator.rarity == 6).map((operator) {
                      //     return DropdownMenuItem<String>(
                      //       value: operator.name,
                      //       child: Text(operator.name),
                      //     );
                      //   }).toList(),
                      // ),
                      ElevatedButtonWidget(
                        onPressed: () {
                          context.read<GachaSimulatorBloc>().add(
                            SelectOperatorButtonPressed(
                              firstOperator: firstOperatorValue,
                              secondOperator: secondOperatorValue,
                              operatorList: state.operatorList
                            )
                          );
                        },
                        color: ThemeColors.colorLightGreen,
                        text: "Select as rateup character"
                      )
                    ],
                  );
                }
                if(state is RateupOperatorSelected){
                  return Column(
                    children: [
                      ElevatedButtonWidget(
                        onPressed: () {
                          context.read<GachaSimulatorBloc>().add(
                            SinglePullButtonPressed(
                              rateupOperator: state.rateupOperator,
                              sixStarOperator: state.sixStarOperator,
                              fiveStarOperator: state.fiveStarOperator,
                              fourStarOperator: state.fourStarOperator,
                              threeStarOperator: state.threeStarOperator
                            )
                          );
                        },
                        color: ThemeColors.colorLightGreen,
                        text: "1x Pull"
                      ),
                      ElevatedButtonWidget(
                        onPressed: () {
                          context.read<GachaSimulatorBloc>().add(
                            TenPullButtonPressed(
                              rateupOperator: state.rateupOperator,
                              sixStarOperator: state.sixStarOperator,
                              fiveStarOperator: state.fiveStarOperator,
                              fourStarOperator: state.fourStarOperator,
                              threeStarOperator: state.threeStarOperator
                            )
                          );
                        },
                        color: ThemeColors.colorLightGreen,
                        text: "10x Pull"
                      ),
                    ],
                  );
                }
                if(state is GachaSimulatorResultState){
                  return Column(
                    children: [
                      ElevatedButtonWidget(
                        onPressed: () {
                          context.read<GachaSimulatorBloc>().add(
                            SinglePullButtonPressed(
                              rateupOperator: state.rateupOperator,
                              sixStarOperator: state.sixStarOperator,
                              fiveStarOperator: state.fiveStarOperator,
                              fourStarOperator: state.fourStarOperator,
                              threeStarOperator: state.threeStarOperator
                            )
                          );
                        },
                        color: ThemeColors.colorLightGreen,
                        text: "1x Pull"
                      ),
                      ElevatedButtonWidget(
                        onPressed: () {
                          context.read<GachaSimulatorBloc>().add(
                            TenPullButtonPressed(
                              rateupOperator: state.rateupOperator,
                              sixStarOperator: state.sixStarOperator,
                              fiveStarOperator: state.fiveStarOperator,
                              fourStarOperator: state.fourStarOperator,
                              threeStarOperator: state.threeStarOperator
                            )
                          );
                        },
                        color: ThemeColors.colorLightGreen,
                        text: "10x Pull"
                      ),
                      GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2
                        ),
                        itemCount: state.operatorName.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Text(
                              state.operatorName[index],
                              style: ThemeTextStyles.bodyMedium,
                            )
                          );
                        },
                      )
                    ],
                  );
                }
                else {
                  return const SizedBox();
                }
              },
            )
          ],
      ),
    ));
  }
}