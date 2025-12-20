class JourneyDayContentResponse {
  final int userId;
  final int journeyId;
  final int dayId;
  final String dayTitle;
  final List<JourneyStep> steps;

  JourneyDayContentResponse({
    required this.userId,
    required this.journeyId,
    required this.dayId,
    required this.dayTitle,
    required this.steps,
  });

  factory JourneyDayContentResponse.fromJson(Map<String, dynamic> json) {
    return JourneyDayContentResponse(
      userId: json['user_id'],
      journeyId: json['journey_id'],
      dayId: json['day_id'],
      dayTitle: json['day_title'] ?? "",
      steps: (json['steps'] as List)
          .map((e) => JourneyStep.fromJson(e))
          .toList(),
    );
  }
}

class JourneyStep {
  final int id;
  final int journeyId;
  final int dayId;
  final String stepName;
  final bool isCompleted;

  JourneyStep({
    required this.id,
    required this.journeyId,
    required this.dayId,
    required this.stepName,
    required this.isCompleted,
  });

  factory JourneyStep.fromJson(Map<String, dynamic> json) {
    return JourneyStep(
      id: json['id'],
      journeyId: json['journey_id'],
      dayId: json['days_id'],
      stepName: json['step_name'],
      isCompleted: json['is_completed'],
    );
  }
}
