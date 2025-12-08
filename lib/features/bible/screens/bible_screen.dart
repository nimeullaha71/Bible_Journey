import '../widgets/book_section.dart';
import '../widgets/old_new_testiment_section.dart';
import 'package:flutter/material.dart';

class BibleScreen extends StatefulWidget {
  const BibleScreen({super.key});

  @override
  State<BibleScreen> createState() => _BibleScreenState();
}

class _BibleScreenState extends State<BibleScreen> {
  bool isOld = true;

  // EACH SECTION GETS ITS OWN COLLAPSE CONTROLLER
  final Map<String, CollapseController> controllers = {};

  @override
  Widget build(BuildContext context) {
    final data = isOld ? oldTestamentSections : newTestamentSections;

    return Scaffold(
      backgroundColor: const Color(0xffF8F5F2),
      appBar: AppBar(
        backgroundColor: const Color(0xffF8F5F2),
        title: Text(isOld ? "Old Testament" : "New Testament Browser"),
        centerTitle: true,
        leading: const BackButton(color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // TOGGLE BUTTON (SAME AS BEFORE)
            buildTestamentToggle(),

            // BUILD SECTIONS
            for (var section in data.keys)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(section,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),

                    /// GIVE A SEPARATE CONTROLLER FOR EACH SECTION
                    ...data[section]!.map((book) {
                      controllers.putIfAbsent(section, () => CollapseController());
                      return BookSection(
                        book: book,
                        controller: controllers[section]!,
                      );
                    }).toList()
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget buildTestamentToggle() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(5),
      height: 45,
      decoration: BoxDecoration(
        color: const Color(0xffE5EDE8),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() {
                isOld = true;
                controllers.clear(); // reset controllers when change tab
              }),
              child: Container(
                decoration: BoxDecoration(
                  color: isOld ? const Color(0xff83BF8B) : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                alignment: Alignment.center,
                child: Text("Old Testament",
                    style: TextStyle(
                        color: isOld ? Colors.white : Colors.black)),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() {
                isOld = false;
                controllers.clear(); // reset controllers when change tab
              }),
              child: Container(
                decoration: BoxDecoration(
                  color: !isOld ? const Color(0xff83BF8B) : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                alignment: Alignment.center,
                child: Text("New Testament",
                    style: TextStyle(
                        color: !isOld ? Colors.white : Colors.black)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
