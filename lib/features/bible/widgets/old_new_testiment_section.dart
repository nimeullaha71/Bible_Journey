import '../model/bible_model.dart';

import 'dart:ui';

class CollapseController {
  CollapseItem? currentOpened;

  void closeAll() {
    if (currentOpened != null) {
      currentOpened!.notifier();
      currentOpened = null;
    }
  }
}

class CollapseItem {
  final VoidCallback notifier;

  CollapseItem({required this.notifier});
}


final oldTestamentSections = {
  "The Law (Pentateuch)": [
    BibleBook(title: "Genesis", chapters: 50),
    BibleBook(title: "Exodus", chapters: 40),
    BibleBook(title: "Leviticus", chapters: 27),
  ],
  "Historical Books": [
    BibleBook(title: "Joshua", chapters: 24),
    BibleBook(title: "Judges", chapters: 21),
  ],
  "Poetic Books": [
    BibleBook(title: "Job", chapters: 42),
    BibleBook(title: "Psalms", chapters: 150),
    BibleBook(title: "Proverbs", chapters: 31),
  ]
};

final newTestamentSections = {
  "The Gospels": [
    BibleBook(title: "Matthew", chapters: 28),
    BibleBook(title: "Mark", chapters: 24),
    BibleBook(title: "Luke", chapters: 24),
  ],
  "History": [
    BibleBook(title: "Acts", chapters: 24),
  ],
  "Paul's Letters": [
    BibleBook(title: "Romans", chapters: 16),
    BibleBook(title: "1 Corinthians", chapters: 16),
    BibleBook(title: "2 Corinthians", chapters: 13),
  ],
};
