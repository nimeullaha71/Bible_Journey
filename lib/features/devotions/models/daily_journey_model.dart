class JourneyContentResponse {
  final Journey journey;
  final Day day;
  final Prayer prayer;
  final Devotion devotion;
  final ActionItem action;
  final List<Quiz> quiz;

  JourneyContentResponse({
    required this.journey,
    required this.day,
    required this.prayer,
    required this.devotion,
    required this.action,
    required this.quiz,
  });

  factory JourneyContentResponse.fromJson(Map<String, dynamic> json) {
    return JourneyContentResponse(
      journey: Journey.fromJson(json['journey']),
      day: Day.fromJson(json['day']),
      prayer: Prayer.fromJson(json['prayer']),
      devotion: Devotion.fromJson(json['devotion']),
      action: ActionItem.fromJson(json['action']),
      quiz: (json['quiz'] as List).map((e) => Quiz.fromJson(e)).toList(),
    );
  }
}

class Journey {
  final int id;
  final String name;
  final List<JourneyDetail> details;

  Journey({required this.id, required this.name, required this.details});

  factory Journey.fromJson(Map<String, dynamic> json) {
    return Journey(
      id: json['id'],
      name: json['name'],
      details: (json['details'] as List)
          .map((e) => JourneyDetail.fromJson(e))
          .toList(),
    );
  }
}

class JourneyDetail {
  final String details;
  final String image;

  JourneyDetail({required this.details, required this.image});

  factory JourneyDetail.fromJson(Map<String, dynamic> json) {
    return JourneyDetail(
      details: json['details'],
      image: json['image'],
    );
  }
}

class Day {
  final int id;
  final String title;
  final int order;
  final String image;

  Day({required this.id, required this.title, required this.order, required this.image});

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      id: json['id'],
      title: json['title'],
      order: json['order'],
      image: json['image'],
    );
  }
}

class Prayer {
  final int id;
  final String prayer;
  final String audioUrl;

  Prayer({required this.id, required this.prayer, required this.audioUrl});

  factory Prayer.fromJson(Map<String, dynamic> json) {
    return Prayer(
      id: json['id'],
      prayer: json['prayer'],
      audioUrl: json['audio_url'],
    );
  }
}

class Devotion {
  final int id;
  final String scriptureName;
  final String devotion;
  final String reflection;

  Devotion({
    required this.id,
    required this.scriptureName,
    required this.devotion,
    required this.reflection,
  });

  factory Devotion.fromJson(Map<String, dynamic> json) {
    return Devotion(
      id: json['id'],
      scriptureName: json['scripture_name'],
      devotion: json['devotion'],
      reflection: json['reflection'],
    );
  }
}

class ActionItem {
  final int id;
  final String action;

  ActionItem({required this.id, required this.action});

  factory ActionItem.fromJson(Map<String, dynamic> json) {
    return ActionItem(
      id: json['id'],
      action: json['action'],
    );
  }
}

class Quiz {
  final int id;
  final String question;
  final List<QuizOption> options;

  Quiz({required this.id, required this.question, required this.options});

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'],
      question: json['question'],
      options: (json['options'] as List)
          .map((e) => QuizOption.fromJson(e))
          .toList(),
    );
  }
}

class QuizOption {
  final int id;
  final String option;

  QuizOption({required this.id, required this.option});

  factory QuizOption.fromJson(Map<String, dynamic> json) {
    return QuizOption(
      id: json['id'],
      option: json['option'],
    );
  }
}
