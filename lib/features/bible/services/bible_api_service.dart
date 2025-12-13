import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/bible_model.dart';

class BibleApiService {
  static Future<List<Verse>> fetchChapter({
    required String bookName,
    required int chapter,
  }) async {

    final url =
        "https://bible-api.com/${bookName.toLowerCase()}:$chapter";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final List versesJson = data['verses'];

      return versesJson.map((e) => Verse.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load chapter");
    }
  }
}
