import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terra_discover_project/bloc/pull_tracker_bloc/pull_tracker_bloc.dart';
import 'package:terra_discover_project/themes/theme_colors.dart';
import 'package:terra_discover_project/themes/theme_text_styles.dart';
import 'package:terra_discover_project/widgets/drawer_widget.dart';
import 'package:terra_discover_project/widgets/elevated_button_widget.dart';
import 'package:terra_discover_project/widgets/text_form_field_widget.dart';


class PullTrackerInitScreen extends StatelessWidget {
  const PullTrackerInitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PullTrackerBloc>(
      create: (context) {
        return PullTrackerBloc()..add(const GetCurrenciesDataEvent());
      },
      child: const PullTrackerScreen()
    );
  }
}

class PullTrackerScreen extends StatelessWidget {
  const PullTrackerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.colorBlackBackground,
      appBar: AppBar(
        title: const Text("PULL TRACKER"),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: BlocBuilder<PullTrackerBloc, PullTrackerState>(
        builder: (context, state) {
          if(state is PullTrackerLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is PullTrackerLoaded){
            String orundumValue = state.orundumValue.toString();
            String originiumValue = state.originiumValue.toString();
            String oneHeadhuntingValue = state.oneHeadhuntingValue.toString();
            String tenHeadhuntingValue = state.tenHeadhuntingValue.toString();
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                      child: Text(
                        "Pull Tracker",
                        style: ThemeTextStyles.headlineLarge,
                      ),
                    ),
                    const Text("You have approximately", style: ThemeTextStyles.headlineSmall),
                    Text("${state.totalPull} Pull\n", style: ThemeTextStyles.headlineSmallLightBlue),
                    Container(
                      width: 100,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Image.asset("assets/images/misc/Orundum.png")
                    ),
                    const Text(
                      "Orundum",
                      style: ThemeTextStyles.headlineSmall,
                    ),
                    Container(
                      height: 100,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical : 20),
                      child: TextFormFieldWidget(
                        hintText: "Enter your Orundum amount here",
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        initialValue: state.orundumValue.toString(),
                        onChanged: (val){
                          if(val.isEmpty){
                            orundumValue = "0";
                          } else {
                            orundumValue = val;
                          }
                          context.read<PullTrackerBloc>().add(FormFieldChangedEvent(
                            orundumValue: int.parse(orundumValue),
                            originiumValue: int.parse(originiumValue),
                            oneHeadhuntingValue: int.parse(oneHeadhuntingValue),
                            tenHeadhuntingValue: int.parse(tenHeadhuntingValue),
                          ));
                        },
                      ),
                    ),
                    Container(
                      width: 100,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Image.asset("assets/images/misc/Originium.png")
                    ),
                    const Text(
                      "Originite Prime",
                      style: ThemeTextStyles.headlineSmall,
                    ),
                    Container(
                      height: 100,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical : 20),
                      child: TextFormFieldWidget(
                        hintText: "Enter your Originite Prime amount here",
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        initialValue: state.originiumValue.toString(),
                        onChanged: (val){
                          if(val.isEmpty){
                            originiumValue = "0";
                          } else {
                            originiumValue = val;
                          }
                          context.read<PullTrackerBloc>().add(FormFieldChangedEvent(
                            orundumValue: int.parse(orundumValue),
                            originiumValue: int.parse(originiumValue),
                            oneHeadhuntingValue: int.parse(oneHeadhuntingValue),
                            tenHeadhuntingValue: int.parse(tenHeadhuntingValue),
                          ));
                        },
                      ),
                    ),
                    Container(
                      width: 100,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Image.asset("assets/images/misc/Headhunting_Permit.png")
                    ),
                    const Text(
                      "1x Headhunting Ticket",
                      style: ThemeTextStyles.headlineSmall,
                    ),
                    Container(
                      height: 100,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical : 20),
                      child: TextFormFieldWidget(
                        hintText: "Enter your 1x Headhunting Ticket amount here",
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        initialValue: state.oneHeadhuntingValue.toString(),
                        onChanged: (val){
                          if(val.isEmpty){
                            oneHeadhuntingValue = "0";
                          } else {
                            oneHeadhuntingValue = val;
                          }
                          context.read<PullTrackerBloc>().add(FormFieldChangedEvent(
                            orundumValue: int.parse(orundumValue),
                            originiumValue: int.parse(originiumValue),
                            oneHeadhuntingValue: int.parse(oneHeadhuntingValue),
                            tenHeadhuntingValue: int.parse(tenHeadhuntingValue),
                          ));
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 100,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Image.asset("assets/images/misc/Ten-roll_Headhunting_Permit.png")
                    ),
                    const Text(
                      "10x Headhunting Ticket",
                      style: ThemeTextStyles.headlineSmall,
                    ),
                    Container(
                      height: 100,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical : 20),
                      child: TextFormFieldWidget(
                        hintText: "Enter your 10x Headhunting Ticket amount here",
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        initialValue: state.tenHeadhuntingValue.toString(),
                        onChanged: (val){
                          if(val.isEmpty){
                            tenHeadhuntingValue = "0";
                          } else {
                            tenHeadhuntingValue = val;
                          }
                          context.read<PullTrackerBloc>().add(FormFieldChangedEvent(
                            orundumValue: int.parse(orundumValue),
                            originiumValue: int.parse(originiumValue),
                            oneHeadhuntingValue: int.parse(oneHeadhuntingValue),
                            tenHeadhuntingValue: int.parse(tenHeadhuntingValue),
                          ));
                        }
                      ),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      height: 50,
                      child: ElevatedButtonWidget(
                        onPressed: () {
                          context.read<PullTrackerBloc>().add(SaveButtonPressedEvent(
                            orundumValue: int.parse(orundumValue),
                            originiumValue: int.parse(originiumValue),
                            oneHeadhuntingValue: int.parse(oneHeadhuntingValue),
                            tenHeadhuntingValue: int.parse(tenHeadhuntingValue),
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Your Currencies data saved successfully on local shared preference',
                                style: TextStyle(fontSize: 16)
                              ),
                            ),
                          );
                        },
                        color: ThemeColors.colorDarkBlue,
                        text: "Save data to Local Storage"
                      ),
                    ),
                    const SizedBox(height: 100)
                  ],
                ),
              ),
            );
          }
          if (state is PullTrackerFailed){
            return Text(
              state.errorMessage,
              style: ThemeTextStyles.bodyMedium,
            );
          } else {
            return const SizedBox();
          }
        }
      )
    );
  }
}