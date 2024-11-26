import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terra_discover_project/bloc/operator_detail_bloc/operator_detail_bloc.dart';
import 'package:terra_discover_project/screens/operator_detail/operator_costs_section.dart';
import 'package:terra_discover_project/screens/operator_detail/operator_profile_section.dart';
import 'package:terra_discover_project/screens/operator_detail/operator_skill_section.dart';
import 'package:terra_discover_project/screens/operator_detail/operator_stats_section.dart';
import 'package:terra_discover_project/themes/theme_colors.dart';
import 'package:terra_discover_project/themes/theme_text_styles.dart';
import '../../models/operator_model.dart';

class OperatorDetailInitScreen extends StatelessWidget {
  const OperatorDetailInitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final operator = ModalRoute.of(context)!.settings.arguments as OperatorModel;
    return BlocProvider<OperatorDataBloc>(
      create: (context) => OperatorDataBloc()..add(
          OperatorDataFetchEvent(operator: operator),
        ),
      child: const OperatorDetailScreen()
    );
  }
}

class OperatorDetailScreen extends StatelessWidget {
  const OperatorDetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CarouselSliderController carouselController = CarouselSliderController();
    return BlocBuilder<OperatorDataBloc, OperatorDataState>(
      builder: (context, state) {
        if(state is OperatorDataFiltered){
          OperatorModel operatorData = state.operatorData;
          return Scaffold(
            backgroundColor: ThemeColors.colorBlackBackground,
            appBar: AppBar(
              title: Text("${operatorData.name} Detail", style: ThemeTextStyles.headlineSmall),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: ThemeColors.colorGrey,
                    width: double.infinity,
                    child: CarouselSlider(
                      carouselController: carouselController,
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        aspectRatio: 1.0,
                        initialPage: 0,
                      ),
                      items : [
                        for(int i = 0; i < operatorData.art.length; i++)
                        operatorData.art[i].link.contains("http") ?
                          CachedNetworkImage(
                            imageUrl: operatorData.art[i].link,
                            fit: BoxFit.fitWidth,
                            placeholder: (context, url) => const Icon(Icons.image, size: 100),
                            errorWidget: (context, url, error) => const Icon(Icons.image_not_supported),
                          )
                          :
                          Image.asset(operatorData.art[i].link)
                      ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: ThemeColors.colorBlack,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style : ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                            onPressed: () {
                              carouselController.previousPage(
                                duration: const Duration(milliseconds: 300)
                              );
                            },
                            child: const Icon(Icons.arrow_back)
                          ),
                          const Text(
                            "Character Art",
                            style : ThemeTextStyles.headlineExtraSmall
                          ),
                          ElevatedButton(
                            style : ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                            onPressed: () {
                              carouselController.nextPage(
                                duration: const Duration(milliseconds: 300)
                              );
                            },
                            child: const Icon(Icons.arrow_forward)
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      decoration: BoxDecoration(
                        color: ThemeColors.colorBlack,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Text(
                            operatorData.name,
                            style: ThemeTextStyles.headlineLarge,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for(var i = 0; i < operatorData.rarity;i++)
                              const Icon(
                                Icons.star_rate_sharp,
                                color: ThemeColors.colorYellow,
                                size: 20,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: OperatorProfileSection(operatorData: operatorData)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: OperatorStatsSection(operatorData: operatorData)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top : 30),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: OperatorSkillSection(operatorData: operatorData)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top : 30, bottom: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: OperatorCostsSection(operatorData: operatorData)
                    ),
                  ),
                ],
              ),
            ),
          );
        } else{
          return const SizedBox();
        }
      },
    );
  }
}