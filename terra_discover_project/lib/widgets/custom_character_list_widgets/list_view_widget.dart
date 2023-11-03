import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:terra_discover_project/components/custom_character_list_dialog.dart';
import 'package:terra_discover_project/constant/image_api_constant.dart';
import 'package:terra_discover_project/models/custom_character_model.dart';
import 'package:terra_discover_project/themes/theme_colors.dart';
import '../../themes/theme_text_styles.dart';

class ListViewWidget extends StatelessWidget {
  final List<CustomCharacterModel> characterList;
  const ListViewWidget({
    super.key,
    required this.characterList
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: characterList.length,
      itemBuilder: (context, index) {
      CustomCharacterModel operatorItem = characterList[index];
        return Column(
          children: [
            GestureDetector(
              onTap: (){
                customCharacterDetailDialog(index: index, context: context);
              },
              child: Container(
                padding : const EdgeInsets.symmetric(vertical :6),
                decoration: BoxDecoration(
                  color: ThemeColors.colorTeal,
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
                      child: CachedNetworkImage(
                        imageUrl: "https://arimagesynthesizer.p.rapidapi.com/get?hash=${operatorItem.imageHash}",
                        httpHeaders: {
                          'X-RapidAPI-Key' : apiKey,
                          'X-RapidAPI-Host' : "arimagesynthesizer.p.rapidapi.com"
                        },
                        placeholder: (context, url) => const Icon(Icons.image),
                        errorWidget: (context, url, error) => const Icon(Icons.image_not_supported),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: StrokeText(
                      text : operatorItem.name,
                      textStyle: ThemeTextStyles.bodyMedium,
                      strokeColor: Colors.black,
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
                  trailing: IconButton(
                    onPressed: () {
                      deleteCustomCharacterDialog(index: index, context: context);
                    },
                    icon: const Icon(Icons.delete)
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