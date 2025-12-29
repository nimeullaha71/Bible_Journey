import 'dart:convert';

import 'package:bible_journey/app/Urls.dart';
import 'package:bible_journey/app/routes.dart';
import 'package:bible_journey/features/questionnaire/widget/custom_quiz_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:bible_journey/app/constants.dart';
import 'package:http/http.dart' as http;

import '../../../core/services/local_storage_service.dart';

class QuizQuestionScreen extends StatefulWidget {
  const QuizQuestionScreen({super.key});

  @override
  State<QuizQuestionScreen> createState() => _QuizQuestionScreenState();
}

class _QuizQuestionScreenState extends State<QuizQuestionScreen> {
  int currentQuestionIndex = 0;

  /// 🔥 10 Question List
  List<Map<String, dynamic>> quizData = [
    {
      "question": "How would you describe your Bible study experience so far?",
      "options": [
        "I'm a beginner",
        "I know some parts",
        "I've studied it deeply",
        "Not sure"
      ]
    },
    {
      "question": "How would you describe your Bible study experience so far?",
      "options": [
        "I'm a beginner",
        "I know some parts",
        "I've studied it deeply",
        "Not sure"
      ]
    },
    {
      "question": "Describe your current relationship with God?",
      "options": [
        "Strong and growing",
        "In need of renewal",
        "Unsure",
        "Other"
      ]
    },
    {
      "question": "What personal need led you to Scripture?",
      "options": [
        "Needing spiritual renewal",
        "Searching for inner peace",
        "Longing for hope",
        "Other"
      ]
    },
    {
      "question": "Which struggles feel most present in your life right now? ",
      "options": [
        "Stress or anxiety",
        "Searching for inner peace",
        "Feeling alone",
        "Screen and time-wasting habits",
        "Lack of purpose",
        "Not sure",
        "Overthinking and guilt",
        "Lack of purpose",
      ]
    },
    {
      "question": "In hard seasons, do you tend to turn toward God or away?",
      "options": [
        "I pull closer",
        "I drift away",
        "It depends",
        "I'm not sure"
      ]
    },
    {
      "question": "When life gets heavy, where do you usually turn first?",
      "options": [
        "Prayer",
        "Family or friends",
        "Bible",
        "My phone",
        "I keep it in",
        "I'm not sure",
      ]
    },
    {
      "question": "Have you noticed anything that creates distance between you and God? ",
      "options": [
        "Not hearing from Him",
        "Distraction and busyness",
        "Distraction and busyness",
        "Emotional exhaustion",
        "Feeling unworthy",
        "I’m not sure",
        "Other",
      ]
    },
    {
      "question": "What can help you stay motivated to study the Bible? ",
      "options": [
        "A clear plan",
        "Encouraging truth",
        "Haven’t found it yet",
        "Other"
      ]
    },
    {
      "question": "Which type of Bible content feels most helpful for you? ",
      "options": [
        "Short and simple",
        "In-depth",
        "Not sure",
      ]
    },

  ];


  void goPrevious() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    } else {
      Navigator.pop(context);
    }
  }


  List<List<int>> selectedAnswers = List.generate(10, (index) => []);

  List<Map<String, String>> buildQAPairs() {
    List<Map<String, String>> qaPairs = [];

    for (int i = 0; i < quizData.length; i++) {
      List<int> selectedIndexes = selectedAnswers[i];
      for (var idx in selectedIndexes) {
        qaPairs.add({
          "question": quizData[i]["question"],
          "answer": quizData[i]["options"][idx]
        });
      }
    }

    return qaPairs;
  }

  Future<void> submitQuiz() async {

    String? token = await LocalStorage.getToken();
    final url = Uri.parse(Urls.categoryQuestionUrl);

    final body = jsonEncode({
      "qa_pairs": buildQAPairs(),
    });


    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: body,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("Response: $data");
        final decoded = jsonDecode(response.body);

        print("📢 Message: ${decoded['message']}");
        print("📌 Category: ${decoded['category']}");

      } else {
        print("Failed: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    String question = quizData[currentQuestionIndex]["question"];
    List options = quizData[currentQuestionIndex]["options"];

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomQuizAppBar(
        title: "bible_journey".tr(),
        onBack: () => goPrevious(),
      ),


      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question ${currentQuestionIndex + 1} of ${quizData.length}",
              style: const TextStyle(color: Colors.black54, fontSize: 14),
            ),

            const SizedBox(height: 6),

            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / quizData.length,
              backgroundColor: Colors.grey.shade300,
              color: AppColors.primary,
              minHeight: 6,
              borderRadius: BorderRadius.circular(12),
            ),

            const SizedBox(height: 30),

            Text(
              question,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return optionTile(
                    index,
                    options[index],
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  goToNext();
                },
                child: Text(
                  currentQuestionIndex == quizData.length - 1
                      ? "Finish"//"buttons.finish".tr()
                      : "Next",//"buttons.next".tr(),
                  style: const TextStyle(
                      color: Colors.white, fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget optionTile(int index, String optionText) {
    bool isActive =
    selectedAnswers[currentQuestionIndex].contains(index);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isActive) {
            selectedAnswers[currentQuestionIndex].remove(index);
          } else {
            selectedAnswers[currentQuestionIndex].add(index);
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isActive ? AppColors.primary : Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isActive ? Icons.check_circle : Icons.circle_outlined,
              color: isActive ? AppColors.primary : Colors.grey,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                optionText,
                style: const TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }

  void goToNext() {
    if (selectedAnswers[currentQuestionIndex].isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select at least one option.")),
      );
      return;
    }

    if (currentQuestionIndex < quizData.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      submitQuiz();
      Navigator.pushNamed(context, AppRoutes.mainBottomNavScreen);
      print(buildQAPairs);
    }
  }

}
