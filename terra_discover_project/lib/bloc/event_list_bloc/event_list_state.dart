part of 'event_list_bloc.dart';

sealed class EventListState extends Equatable {
  const EventListState();

  @override
  List<Object> get props => [];
}

final class EventsListInitial extends EventListState {}

class EventListLoaded extends EventListState {
  final List<EventModel>  eventList;

  const EventListLoaded({
    required this.eventList
  });

  @override
  List<Object> get props => [];
}