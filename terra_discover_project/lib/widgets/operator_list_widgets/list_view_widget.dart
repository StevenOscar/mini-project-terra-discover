import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:terra_discover_project/themes/theme_colors.dart';
import '../../models/operator_model.dart';
import '../../routes_navigation.dart';
import '../../themes/theme_text_styles.dart';

class ListViewWidget extends StatelessWidget {
  final List<OperatorModel> operatorList;
  const ListViewWidget({
    super.key,
    required this.operatorList
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: operatorList.length,
      itemBuilder: (context, index) {
      OperatorModel operatorItem = operatorList[index];
        return Column(
          children: [
            GestureDetector(
              onTap: () async {
                Navigator.pushNamed(
                  context,
                  RoutesNavigation().operatorDetailInitScreen,
                  arguments: operatorItem
                );
              },
              child: Container(
                padding : const EdgeInsets.symmetric(vertical :6),
                decoration: BoxDecoration(
                  color:
                    operatorItem.rarity == 6 ? ThemeColors.colorRarity6Container :
                    operatorItem.rarity == 5 ? ThemeColors.colorRarity5Container :
                    operatorItem.rarity == 4 ? ThemeColors.colorRarity4Container :
                    operatorItem.rarity == 3 ? ThemeColors.colorRarity3Container :
                    operatorItem.rarity == 2 ? ThemeColors.colorRarity2Container :
                    operatorItem.rarity == 1 ? ThemeColors.colorRarity1Container : ThemeColors.colorBlack,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black,
                    width: 2
                  ),
                  boxShadow:[
                    BoxShadow(
                        color: ThemeColors.colorWhite.withOpacity(0.4),
                        spreadRadius: 4,
                        blurRadius: 7,
                    ),
                  ],
                ),
                child: ListTile(
                  leading: SizedBox(
                    width: 60,
                    height: 60,
                    child: ClipRect(
                      child: Image.asset(
                        "assets/images/avatar/${operatorItem.name}.png",
                        fit: BoxFit.fitWidth,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.image);
                        },
                      )
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: StrokeText(
                      text : operatorItem.name,
                      textStyle: ThemeTextStyles.bodyMedium,
                      strokeColor: ThemeColors.colorBlack,
                      strokeWidth: 2.25,
                    ),
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for(var i = 0; i < operatorItem.rarity;i++)
                      const Icon(
                        Icons.star_rate_sharp,
                        color: ThemeColors.colorYellow,
                        size: 20,
                      )
                    ],
                  ),
                  trailing: operatorItem.operatorClass!.isNotEmpty ?
                    Container(
                      color: ThemeColors.colorBlack,
                      width: 40,
                      height: 40,
                      child: Image.asset(
                        "assets/images/class/main_class/${operatorItem.operatorClass![0]}.png"
                      ),
                    ) :
                    const Text(
                      "No Class",
                      style: ThemeTextStyles.bodySmall,
                    )
                ),
              ),
            ),
            const SizedBox(height: 26)
          ],
        );
      }
    );
  }
}