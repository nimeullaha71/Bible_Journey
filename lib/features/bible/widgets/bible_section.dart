import 'package:flutter/material.dart';
import '../model/bible_model.dart';

class BibleSectionWidget extends StatefulWidget {
  final String title;
  final List<BibleBook> books;

  const BibleSectionWidget({
    super.key,
    required this.title,
    required this.books,
  });

  @override
  State<BibleSectionWidget> createState() => _BibleSectionWidgetState();
}

class _BibleSectionWidgetState extends State<BibleSectionWidget> {
  Map<int, bool> expanded = {};

  void toggleExpand(int index) {
    setState(() {
      expanded.updateAll((key, value) => false);
      expanded[index] = !(expanded[index] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),

        ...List.generate(widget.books.length, (index) {
          final book = widget.books[index];
          final isOpen = expanded[index] ?? false;

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              border: Border.all(color: Colors.black12),
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(book.title),
                  subtitle: Text("${book.chapters} Chapters"),
                  trailing: Icon(
                    isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  ),
                  onTap: () => toggleExpand(index),
                ),

                /// Chapter Grid (7 per row)
                if (isOpen)
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: book.chapters,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 1.2,
                      ),
                      itemBuilder: (context, i) {
                        return Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text("${i + 1}"),
                        );
                      },
                    ),
                  )
              ],
            ),
          );
        }),
      ],
    );
  }
}
