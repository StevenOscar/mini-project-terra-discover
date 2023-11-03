import 'package:flutter/material.dart';
import 'package:terra_discover_project/models/operator_model.dart';
import 'package:terra_discover_project/themes/theme_colors.dart';
import 'package:terra_discover_project/themes/theme_text_styles.dart';

class OperatorCostsSection extends StatelessWidget {
  final OperatorModel operatorData;

  const OperatorCostsSection({
    super.key,
    required this.operatorData
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedBackgroundColor: ThemeColors.colorBlack,
      backgroundColor: ThemeColors.colorBlack,
      tilePadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      title: const Text(
        "Upgrade Costs",
        style: ThemeTextStyles.headlineMedium,
      ),
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left:30,
            right: 30,
            top: 5,
            bottom: 40
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                "Total Material Costs",
                style: ThemeTextStyles.headlineSmallLightBlue,
              ),
              const SizedBox(height: 20),
              operatorData.costs.isEmpty ?
              const Text(
                "This Operator doesn't have material costs",
                style: ThemeTextStyles.bodyMedium,
                textAlign: TextAlign.center,
              ) :
              Column(
                children: [
                  for(int i = 0; i<operatorData.costs.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Column(
                      children: [
                        Text(
                          "${operatorData.costs[i].name} : ${operatorData.costs[i].amount}",
                          style: ThemeTextStyles.bodyMedium,
                        )
                      ]
                    )
                  )
                ]
              ),
              const SizedBox(height: 15)
            ],
          ),
        )
      ],
    );
  }
}