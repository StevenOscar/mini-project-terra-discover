import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terra_discover_project/bloc/event_list_bloc/event_list_bloc.dart';
import 'package:terra_discover_project/themes/theme_colors.dart';
import 'package:terra_discover_project/themes/theme_text_styles.dart';
import 'package:terra_discover_project/widgets/drawer_widget.dart';

class EventListInitScreen extends StatelessWidget {
  const EventListInitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventListBloc>(
      create: (context) {
        return EventListBloc()..add(FetchEventListData());
      },
      child: const EventListScreen());
  }
}

class EventListScreen extends StatelessWidget {
  const EventListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.colorBlackBackground,
      appBar: AppBar(
        title: const Text("Event List", style: ThemeTextStyles.headlineSmall),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                child: Text(
                  "Event List",
                  style: ThemeTextStyles.headlineLarge,
                ),
              ),
              BlocBuilder<EventListBloc, EventListState>(
                builder: (context, state) {
                  if(state is EventListLoaded){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      child: Table(
                        border: TableBorder.all(
                          color: ThemeColors.colorDarkBlue, width: 2
                        ),
                        children: [
                          const TableRow(
                            decoration: BoxDecoration(
                            color: ThemeColors.colorBlueTable),
                            children: [
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 7),
                                  child: Text(
                                    'Event Name',
                                    style: ThemeTextStyles.bodySmall
                                  ),
                                )
                              ),
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 7),
                                  child: Text(
                                    'Start Date',
                                    style: ThemeTextStyles.bodySmall
                                  ),
                                )
                              ),
                              Center(
                                child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 7),
                                child: Text(
                                  'Duration',
                                    style: ThemeTextStyles.bodySmall
                                  ),
                                )
                              ),
                              Center(
                                child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 7),
                                child: Text(
                                  'Rerun',
                                    style: ThemeTextStyles.bodySmall
                                  ),
                                )
                              ),
                            ]),
                          for (int i = 0;i < state.eventList.length;i++)
                          TableRow(
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                                  child: Text(
                                    state.eventList[i].eventName,
                                    style: ThemeTextStyles.bodySmall
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 7),
                                  child: Text(
                                    "${state.eventList[i].startDate}/${state.eventList[i].startMonth}/${state.eventList[i].startYear}",
                                    style: ThemeTextStyles.bodySmall
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 7),
                                  child: Text(
                                    "${state.eventList[i].duration} Days",
                                    style: ThemeTextStyles.bodySmall
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 7),
                                  child:
                                  state.eventList[i].rerun == true ?
                                  const Text(
                                    "Yes",
                                    style: ThemeTextStyles.bodySmall
                                  ) :
                                  const Text(
                                    "No",
                                    style: ThemeTextStyles.bodySmall
                                  )
                                ),
                              ),
                            ]
                          )
                        ],
                      ),
                    );
                  }
                  else {
                    return const SizedBox();
                  }
                },
              ),
              const SizedBox(height: 60)
            ],
          ),
        ),
      )
    );
  }
}
