import 'package:flutter/material.dart';
import 'package:terra_discover_project/models/operator_model.dart';
import 'package:terra_discover_project/themes/theme_colors.dart';
import 'package:terra_discover_project/themes/theme_text_styles.dart';

class OperatorProfileSection extends StatelessWidget {
  final OperatorModel operatorData;

  const OperatorProfileSection({
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
        "Profile & Lore",
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
                "Biography",
                style: ThemeTextStyles.headlineSmallLightBlue,
              ),
              const SizedBox(height: 20),
              Text(
                operatorData.biography.toString(),
                style: ThemeTextStyles.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              const Text(
                "Description",
                style: ThemeTextStyles.headlineSmallLightBlue,
              ),
              const SizedBox(height: 20),
              Text(
                operatorData.description.toString(),
                style: ThemeTextStyles.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              const Text(
                "Affiliation",
                style: ThemeTextStyles.headlineSmallLightBlue,
              ),
              const SizedBox(height: 20),
              operatorData.affiliation!.isEmpty ?
                const Text(
                  "This Operator doesn't have any afiiliation in database",
                  style: ThemeTextStyles.bodyMedium,
                  textAlign: TextAlign.center,
                ) :
                Column(
                  children: [
                    for(int i = 0; i<operatorData.affiliation!.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        "${i+1}. ${operatorData.affiliation![i].toString()}",
                        style: ThemeTextStyles.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 35),
              const Text(
                "Voice Actor/Actress",
                style: ThemeTextStyles.headlineSmallLightBlue,
              ),
              const SizedBox(height: 20),
              Text(
                operatorData.va,
                style: ThemeTextStyles.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              const Text(
                "Lore",
                style: ThemeTextStyles.headlineSmallLightBlue,
              ),
              const SizedBox(height: 5),
              Column(
                children: [
                  for(int i = 0; i < operatorData.lore.entries.length;i++)
                  Padding(
                    padding: const EdgeInsets.only(top: 18, left: 20, right:20),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text : "${operatorData.lore.keys.elementAt(i)[0].toUpperCase()}${operatorData.lore.keys.elementAt(i).substring(1).replaceAll('_', ' ')}\n",
                            style: ThemeTextStyles.headlineExtraSmall
                          ),
                          TextSpan(
                            text : operatorData.lore.values.elementAt(i),
                            style: ThemeTextStyles.bodyMedium
                          ),
                        ]
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}