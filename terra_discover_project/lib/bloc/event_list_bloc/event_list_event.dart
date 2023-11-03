part of 'event_list_bloc.dart';

sealed class EventListEvent extends Equatable {
  const EventListEvent();

  @override
  List<Object> get props => [];
}

class FetchEventListData extends EventListEvent{}