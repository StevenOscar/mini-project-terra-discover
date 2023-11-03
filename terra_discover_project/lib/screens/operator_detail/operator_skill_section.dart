import 'package:flutter/material.dart';
import 'package:terra_discover_project/models/operator_model.dart';
import 'package:terra_discover_project/themes/theme_colors.dart';
import 'package:terra_discover_project/themes/theme_text_styles.dart';

class OperatorSkillSection extends StatelessWidget {
  final OperatorModel operatorData;

  const OperatorSkillSection({
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
        "Skills",
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
                "Operator Skills",
                style: ThemeTextStyles.headlineSmallLightBlue,
              ),
              const SizedBox(height: 20),
              operatorData.skills.isEmpty ?
              const Text(
                "This Operator doesn't have any skills",
                style: ThemeTextStyles.bodyMedium,
                textAlign: TextAlign.center,
              ) :
              Column(
                children: [
                  for(int i = 0; i<operatorData.skills.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Column(
                      children: [
                        const Divider(
                          color: ThemeColors.colorLightBlue,
                          thickness: 1.5,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Skill ${i+1}",
                          style: ThemeTextStyles.headlineMedium,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            operatorData.skills[i].name,
                            style: ThemeTextStyles.headlineSmall
                          ),
                        ),
                        Text(
                          "(Skill at Level : ${operatorData.skills[i].variations.last.level.toString()})",
                          style: ThemeTextStyles.bodySmall
                        ),
                        const SizedBox(height: 20),
                        Text(
                          operatorData.skills[i].variations.last.description,
                          style: ThemeTextStyles.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "Initial SP : ${operatorData.skills[i].variations.last.initialSp}",
                          style: ThemeTextStyles.bodySmallYellow
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "SP Cost : ${operatorData.skills[i].variations.last.spCost}",
                          style: ThemeTextStyles.bodySmallYellow
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Skill Duration : ${operatorData.skills[i].variations.last.duration}",
                          style: ThemeTextStyles.bodySmallYellow
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Skill Charge : ${operatorData.skills[i].skillCharge}",
                          style: ThemeTextStyles.bodySmallYellow
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Skill Activation : ${operatorData.skills[i].skillActivation}",
                          style : ThemeTextStyles.bodySmallYellow
                        ),
                        const SizedBox(height: 25)
                      ],
                    )
                  ),
                  const Divider(
                    color: ThemeColors.colorLightBlue,
                    thickness: 1.5,
                  ),
                ],
              ),
              const SizedBox(height: 15)
            ],
          ),
        )
      ],
    );
  }
}