class JourneyResponse {
  final String user;
  final String category;
  final List<Journey> journeys;

  JourneyResponse({
    required this.user,
    required this.category,
    required this.journeys,
  });

  factory JourneyResponse.fromJson(Map<String, dynamic> json) {
    return JourneyResponse(
      user: json['user'],
      category: json['category'],
      journeys: (json['journeys'] as List)
          .map((e) => Journey.fromJson(e))
          .toList(),
    );
  }
}

class Journey {
  final int id;
  final String name;
  final List<JourneyIcon> icons;
  final List<JourneyDetail> details;

  Journey({
    required this.id,
    required this.name,
    required this.icons,
    required this.details,
  });

  factory Journey.fromJson(Map<String, dynamic> json) {
    return Journey(
      id: json['id'],
      name: json['name'],
      icons: (json['icons'] as List)
          .map((e) => JourneyIcon.fromJson(e))
          .toList(),
      details: (json['details'] as List)
          .map((e) => JourneyDetail.fromJson(e))
          .toList(),
    );
  }
}

class JourneyIcon {
  final String icon;

  JourneyIcon({required this.icon});

  factory JourneyIcon.fromJson(Map<String, dynamic> json) {
    return JourneyIcon(icon: json['icon']);
  }
}

class JourneyDetail {
  final String details;
  final String image;

  JourneyDetail({
    required this.details,
    required this.image,
  });

  factory JourneyDetail.fromJson(Map<String, dynamic> json) {
    return JourneyDetail(
      details: json['details'],
      image: json['image'],
    );
  }
}
