import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terra_discover_project/themes/theme_colors.dart';
import 'package:terra_discover_project/themes/theme_text_styles.dart';
import 'package:terra_discover_project/widgets/drawer_widget.dart';
import 'package:terra_discover_project/widgets/elevated_button_widget.dart';
import 'package:terra_discover_project/widgets/operator_list_widgets/list_view_widget.dart';
import 'package:terra_discover_project/widgets/text_form_field_widget.dart';

import '../../bloc/operator_list_bloc/operator_list_bloc.dart';

class OperatorListScreen extends StatelessWidget {
  const OperatorListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      backgroundColor: ThemeColors.colorBlackBackground,
      appBar: AppBar(
        title: const Text("Operator List", style: ThemeTextStyles.headlineSmall),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                  child: Text(
                    "Operator List",
                    style: ThemeTextStyles.headlineLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: TextFormFieldWidget(
                    hintText: "Search Operator name here",
                    controller: nameController,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: ElevatedButtonWidget(
                    text : "Search",
                    color: ThemeColors.colorDarkBlue,
                    onPressed: () {
                      context.read<OperatorListBloc>().add(SearchOperatorEvent(operatorName: nameController.text));
                    }
                  )
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: const EdgeInsets.only(left: 24, right:24, bottom: 16),
                  child: ElevatedButtonWidget(
                    text : "Get all operator list",
                    color: ThemeColors.colorRed,
                    onPressed: () {
                      context.read<OperatorListBloc>().add(GetAllOperatorEvent());
                    }
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                  child: BlocBuilder<OperatorListBloc, OperatorListState>(
                    builder: (context, state) {
                      if(state is OperatorListLoading){
                        return const CircularProgressIndicator();
                      }
                      if (state is OperatorListLoaded){
                        return ListViewWidget(
                          operatorList: state.operatorList,
                        );
                      }
                      if (state is OperatorListFailed){
                        return Text(
                          state.errorMessage,
                          style: ThemeTextStyles.bodyMedium,
                        );
                      }
                      else {
                        return const SizedBox();
                      }
                    },
                  ),
                )
              ],
            )
          ),
        )
    );
  }
}
