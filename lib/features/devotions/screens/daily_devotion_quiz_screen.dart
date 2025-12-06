import 'package:bible_journey/app/routes.dart';
import 'package:bible_journey/features/devotions/screens/devotion_detail_screen.dart';
import 'package:bible_journey/features/devotions/screens/quiz_mark_screen.dart';
import 'package:bible_journey/features/questionnaire/widget/custom_quiz_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:bible_journey/app/constants.dart';

class DailyDevotionQuizScreen extends StatefulWidget {
  const DailyDevotionQuizScreen({super.key});

  @override
  State<DailyDevotionQuizScreen> createState() => _DailyDevotionQuizScreenState();
}

class _DailyDevotionQuizScreenState extends State<DailyDevotionQuizScreen> {
  int currentQuestionIndex = 0;

  /// 3 Question List
  List<Map<String, dynamic>> quizData = [
    {
      "question": "How would you describe your Bible study experience so far?",
      "options": [
        "I'm a beginner",
        "I know some parts",
        "I've studied it deeply",
        "Not sure"
      ],
      "correctIndex": 2,   // <-- correct answer
    },
    {
      "question": "How would you describe your Bible study experience so far?",
      "options": [
        "I'm a beginner",
        "I know some parts",
        "I've studied it deeply",
        "Not sure"
      ],
      "correctIndex": 1,
    },
    {
      "question": "Describe your current relationship with God?",
      "options": [
        "Strong and growing",
        "In need of renewal",
        "Unsure",
        "Other"
      ],
      "correctIndex": 0,
    },
  ];


  void goPrevious() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>DevotionDetailScreen()));
    }
  }

  List<int> selectedAnswers = List.filled(3, -1);

  @override
  Widget build(BuildContext context) {
    String question = quizData[currentQuestionIndex]["question"];
    List options = quizData[currentQuestionIndex]["options"];

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomQuizAppBar(
        title: "Bible Journey",
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

            /// -------------------
            /// Next Button
            /// -------------------
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
                      ? "Finish"
                      : "Next",
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
    bool isActive = selectedAnswers[currentQuestionIndex] == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAnswers[currentQuestionIndex] = index;
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
    if (currentQuestionIndex < quizData.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {

      int score = 0;

      for (int i = 0; i < quizData.length; i++) {
        int correctIndex = quizData[i]["correctIndex"];
        if (selectedAnswers[i] == correctIndex) {
          score++;
        }
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizMarkScreen(correctAnswers: score),
        ),
      );
    }
  }

}
