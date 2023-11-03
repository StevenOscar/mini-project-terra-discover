import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terra_discover_project/utils/shared_pref.dart';

part 'pull_tracker_event.dart';
part 'pull_tracker_state.dart';

class PullTrackerBloc extends Bloc<PullTrackerEvent, PullTrackerState> {
  PullTrackerBloc() : super(PullTrackerInitial()) {
    on<GetCurrenciesDataEvent>((event, emit) async {
      try {
        emit(PullTrackerLoading());
        final Map<String,int> currenciesData = await SharedPref().getCurrencies();

        int totalPull = (currenciesData["orundum"]!/600).floor() + ((currenciesData["originium"]!*180/600)).floor() + (currenciesData["1x headhunting"]!) + (currenciesData["10x headhunting"]! * 10);
        emit(
          PullTrackerLoaded(
            orundumValue: currenciesData["orundum"] ?? 0,
            originiumValue: currenciesData["originium"] ?? 0,
            oneHeadhuntingValue: currenciesData["1x headhunting"] ?? 0,
            tenHeadhuntingValue: currenciesData["10x headhunting"] ?? 0,
            totalPull: totalPull,
          )
        );
      } catch (e) {
        emit(
          const PullTrackerFailed(
            errorMessage: "Failed to retrieve data from local storage"
          )
        );
      }
    });

    on<FormFieldChangedEvent>((event, emit) async {
      int totalPull = (event.orundumValue/600).floor() + ((event.originiumValue)*180/600).floor() + (event.oneHeadhuntingValue) + (event.tenHeadhuntingValue * 10);

      emit(
        PullTrackerLoaded(
          orundumValue: event.orundumValue,
          originiumValue: event.originiumValue,
          oneHeadhuntingValue: event.oneHeadhuntingValue,
          tenHeadhuntingValue: event.tenHeadhuntingValue,
          totalPull: totalPull
        )
      );
    });

    on<SaveButtonPressedEvent>((event, emit) async {
      await SharedPref().saveCurrencies(
        orundumValue: event.orundumValue,
        originiumValue: event.originiumValue,
        oneHeadhuntingValue: event.oneHeadhuntingValue,
        tenHeadhuntingValue: event.tenHeadhuntingValue
      );

      int totalPull = (event.orundumValue/600).floor() + ((event.originiumValue)*180/600).floor() + (event.oneHeadhuntingValue) + (event.tenHeadhuntingValue * 10);

      emit(
        PullTrackerLoaded(
          orundumValue: event.orundumValue,
          originiumValue: event.originiumValue,
          oneHeadhuntingValue: event.oneHeadhuntingValue,
          tenHeadhuntingValue: event.tenHeadhuntingValue,
          totalPull: totalPull
        )
      );
    });
  }
}
