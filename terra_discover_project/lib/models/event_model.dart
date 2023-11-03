class EventModel {
    int startDate;
    int startMonth;
    int startYear;
    int duration;
    String eventName;
    bool? rerun;

    EventModel({
        required this.startDate,
        required this.startMonth,
        required this.startYear,
        required this.duration,
        required this.eventName,
        this.rerun,
    });
}
