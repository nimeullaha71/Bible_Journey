import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/features/devotions/models/daily_journey_model.dart';
import 'package:bible_journey/features/devotions/screens/quiz_mark_screen.dart';
import 'package:bible_journey/features/questionnaire/widget/custom_quiz_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DailyDevotionQuizScreen extends StatefulWidget {
  final List<Quiz> quizzes;

  const DailyDevotionQuizScreen({
    super.key,
    required this.quizzes,
  });

  @override
  State<DailyDevotionQuizScreen> createState() =>
      _DailyDevotionQuizScreenState();
}

class _DailyDevotionQuizScreenState extends State<DailyDevotionQuizScreen> {
  int currentQuestionIndex = 0;
  late List<int> selectedAnswers;

  @override
  void initState() {
    super.initState();

    // quiz count অনুযায়ী answer list বানানো
    selectedAnswers = List.filled(widget.quizzes.length, -1);
  }

  void goPrevious() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    // safety check
    if (widget.quizzes.isEmpty) {
      return const Scaffold(
        body: Center(child: Text("No quiz available")),
      );
    }

    final quiz = widget.quizzes[currentQuestionIndex];

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomQuizAppBar(
        title: "Bible Journey",
        onBack: goPrevious,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question ${currentQuestionIndex + 1} of ${widget.quizzes.length}",
              style: const TextStyle(color: Colors.black54, fontSize: 14),
            ),

            const SizedBox(height: 6),

            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / widget.quizzes.length,
              backgroundColor: Colors.grey.shade300,
              color: AppColors.primary,
              minHeight: 6,
              borderRadius: BorderRadius.circular(12),
            ),

            const SizedBox(height: 30),

            Text(
              quiz.question,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: quiz.options.length,
                itemBuilder: (context, index) {
                  return optionTile(index, quiz.options[index]);
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
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: goToNext,
                child: Text(
                  currentQuestionIndex == widget.quizzes.length - 1
                      ? "buttons.finish".tr()
                      : "buttons.next".tr(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget optionTile(int index, QuizOption option) {
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
                option.option,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goToNext() {
    if (currentQuestionIndex < widget.quizzes.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      int score = 0;

      for (int i = 0; i < widget.quizzes.length; i++) {
        if (selectedAnswers[i] == -1) continue;

        final quiz = widget.quizzes[i];
        final selectedOption =
        quiz.options[selectedAnswers[i]];

        // if (selectedOption.id == quiz.correctOptionId) {
        //   score++;
        // }
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizMarkScreen(
            correctAnswers: score,
          ),
        ),
      );
    }
  }
}
