class DailyJourneyResponse {
  final JourneyInfo journey;
  final List<Day> days;

  DailyJourneyResponse({
    required this.journey,
    required this.days,
  });

  factory DailyJourneyResponse.fromJson(Map<String, dynamic> json) {
    return DailyJourneyResponse(
      journey: JourneyInfo.fromJson(json['journey']),
      days: (json['days'] as List)
          .map((e) => Day.fromJson(e))
          .toList(),
    );
  }
}

class JourneyInfo {
  final int id;
  final String name;

  JourneyInfo({required this.id, required this.name});

  factory JourneyInfo.fromJson(Map<String, dynamic> json) {
    return JourneyInfo(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Day {
  final int dayId;
  final String dayName;
  final int dayOrder;
  final String status;

  Day({
    required this.dayId,
    required this.dayName,
    required this.dayOrder,
    required this.status,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      dayId: json['day_id'],
      dayName: json['day_name'],
      dayOrder: json['day_order'],
      status: json['status'],
    );
  }
}
