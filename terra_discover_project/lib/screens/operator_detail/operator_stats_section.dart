import 'package:flutter/material.dart';
import 'package:terra_discover_project/models/operator_model.dart';
import 'package:terra_discover_project/themes/theme_colors.dart';
import 'package:terra_discover_project/themes/theme_text_styles.dart';

class OperatorStatsSection extends StatelessWidget {
  final OperatorModel operatorData;

  const OperatorStatsSection({
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
        "Stats",
        style: ThemeTextStyles.headlineMedium,
      ),
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 22,
            right: 22,
            top: 5,
            bottom: 40
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                "Operator Class",
                style: ThemeTextStyles.headlineSmallLightBlue,
              ),
              const SizedBox(height: 20),
              operatorData.operatorClass!.isEmpty ?
              const Text(
                "No Operator Class in Database",
                style: ThemeTextStyles.bodyMedium,
              )
              :
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        height: 70,
                        width: 70,
                        "assets/images/class/main_class/${operatorData.operatorClass![0]}.png"
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Main : ${operatorData.operatorClass![0]}",
                        style: ThemeTextStyles.bodySmall,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        height: 70,
                        width: 70,
                        "assets/images/class/sub_class/${operatorData.operatorClass![0]}/${operatorData.operatorClass![1]}.png"
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Sub : ${operatorData.operatorClass![1]}",
                        style: ThemeTextStyles.bodySmall,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 40),
              const Text(
                "Trait",
                style: ThemeTextStyles.headlineSmallLightBlue,
              ),
              const SizedBox(height: 20),
              Text(
                operatorData.trait.toString(),
                style: ThemeTextStyles.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              const Text(
                "Stats",
                style: ThemeTextStyles.headlineSmallLightBlue,
              ),
              const SizedBox(height: 20),
              Table(
                border: TableBorder.all(color: ThemeColors.colorDarkBlue, width: 2),
                children: [
                  const TableRow(
                    decoration: BoxDecoration(
                      color: ThemeColors.colorBlue
                    ),
                    children: [
                      Center(
                        child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text('Level', style: ThemeTextStyles.bodyMedium),
                      )),
                      Center(child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text('HP', style: ThemeTextStyles.bodyMedium),
                      )),
                      Center(child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text('ATK', style: ThemeTextStyles.bodyMedium),
                      )),
                      Center(child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text('DEF', style: ThemeTextStyles.bodyMedium),
                      )),
                      Center(child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text('RES', style: ThemeTextStyles.bodyMedium),
                      )),
                    ]
                  ),
                  for(int i = 0; i < operatorData.statistics.entries.length;i++)
                  TableRow(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          child: Text(
                            operatorData.statistics.keys.elementAt(i),
                            style: ThemeTextStyles.bodyMedium
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          child: Text(
                            operatorData.statistics.values.elementAt(i)["hp"].toString(),
                            style: ThemeTextStyles.bodyMedium
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          child: Text(
                            operatorData.statistics.values.elementAt(i)["atk"].toString(),
                            style: ThemeTextStyles.bodyMedium
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          child: Text(
                            operatorData.statistics.values.elementAt(i)["def"].toString(),
                            style: ThemeTextStyles.bodyMedium
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          child: Text(
                            operatorData.statistics.values.elementAt(0)["resist"].toString(),
                            style: ThemeTextStyles.bodyMedium
                          ),
                        ),
                      ),
                    ]
                  )
                ],
              ),
              const SizedBox(height: 35),
              const Text(
                "Potential",
                style: ThemeTextStyles.headlineSmallLightBlue,
              ),
              const SizedBox(height: 20),
              operatorData.potential.isEmpty ?
              const Text(
                "This Operator doesn't have Potential upgrade",
                style: ThemeTextStyles.bodyMedium,
                textAlign: TextAlign.center,
              )
              :
              Column(
                children: [
                  for(int i=0; i<operatorData.potential.length;i++)
                  Text(
                    "${operatorData.potential[i].name} : ${operatorData.potential[i].value}",
                    style: ThemeTextStyles.bodyMedium,
                  )
                ]
              ),
              const SizedBox(height: 40),
              const Text(
                "Talent",
                style: ThemeTextStyles.headlineSmallLightBlue,
              ),
              const SizedBox(height: 20),
              operatorData.talents.isEmpty ?
              const Text(
                "This Operator doesn't have Talent",
                style: ThemeTextStyles.bodyMedium,
              )
              :
              Column(
                children: [
                  Text(
                    operatorData.talents[0].name,
                    style: ThemeTextStyles.headlineSmall,
                  ),
                  const SizedBox(height: 20),
                  for(int i = 0; i < operatorData.talents[0].variation.length; i++)
                  Column(
                    children: [
                      Text(
                        operatorData.talents[0].variation[i].description,
                        style: ThemeTextStyles.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Requirement : ${operatorData.talents[0].variation[i].elite}",
                        style: ThemeTextStyles.bodySmallYellow
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Potential : ${operatorData.talents[0].variation[i].potential}",
                        style: ThemeTextStyles.bodySmallYellow
                      ),
                      const SizedBox(height: 30)
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        )
      ],
    );
  }
}