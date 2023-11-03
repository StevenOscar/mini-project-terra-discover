import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terra_discover_project/models/event_model.dart';

part 'event_list_event.dart';
part 'event_list_state.dart';

class EventListBloc extends Bloc<EventListEvent, EventListState> {
  EventListBloc() : super(EventsListInitial()) {
    on<FetchEventListData>((event, emit) async {
      List<EventModel> eventList = [];

      final eventDataJson = await rootBundle.loadString('assets/json/events.json');
      Map<String, dynamic> eventData = jsonDecode(eventDataJson);

      final eventFullNameJson = await rootBundle.loadString('assets/json/names.json');
      Map<String, dynamic> eventFullName = jsonDecode(eventFullNameJson);

      for (var year = 2024; year >= 2023; year--) {
        final yearKey = year.toString();
        final yearData = eventData['future'][yearKey];

        if (yearData != null) {
          for (var i = yearData.length - 1; i >= 0; i--) {
            final eventData = yearData[i];
            final startDate = eventData["start"][1];
            final startMonth = eventData["start"][0];
            final startYear = year;
            final duration = eventData["duration"];
            final eventName = eventFullName[eventData["event"]];
            final rerun = eventData["rerun"] ?? false;

            final eventModel = EventModel(
              startDate: startDate,
              startMonth: startMonth,
              startYear: startYear,
              duration: duration,
              eventName: eventName,
              rerun: rerun,
            );
            eventList.add(eventModel);
          }
        }
      }

      for (var year = 2023; year >= 2020; year--) {
        final yearKey = year.toString();
        final yearData = eventData['en'][yearKey];

        if (yearData != null) {
          for (var i = yearData.length - 1; i >= 0; i--) { // Reverse order
            final eventData = yearData[i];
            final startDate = eventData["start"][1];
            final startMonth = eventData["start"][0];
            final startYear = year;
            final duration = eventData["duration"];
            final eventName = eventFullName[eventData["event"]];
            final rerun = eventData["rerun"] ?? false;

            final eventModel = EventModel(
              startDate: startDate,
              startMonth: startMonth,
              startYear: startYear,
              duration: duration,
              eventName: eventName,
              rerun: rerun,
            );
            eventList.add(eventModel);
          }
        }
      }
      return emit(EventListLoaded(eventList: eventList));
    });
  }
}
