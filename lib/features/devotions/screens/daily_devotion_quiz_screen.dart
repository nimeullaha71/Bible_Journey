import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bible_journey/features/devotions/screens/quiz_mark_screen.dart';
import 'package:bible_journey/features/questionnaire/widget/custom_quiz_app_bar.dart';
import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/app/Urls.dart';
import '../../../core/services/local_storage_service.dart';

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

class Quiz {
  final int id;
  final int journeyId;
  final int daysId;
  final String question;
  final List<QuizOption> options;

  Quiz({
    required this.id,
    required this.journeyId,
    required this.daysId,
    required this.question,
    required this.options,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    var optionsJson = json['options'] as List;
    List<QuizOption> optionsList =
    optionsJson.map((e) => QuizOption.fromJson(e)).toList();

    return Quiz(
      id: json['id'],
      journeyId: json['journey_id'],
      daysId: json['days_id'],
      question: json['question'],
      options: optionsList,
    );
  }
}

class DailyDevotionQuizScreen extends StatefulWidget {
  const DailyDevotionQuizScreen({super.key});

  @override
  State<DailyDevotionQuizScreen> createState() =>
      _DailyDevotionQuizScreenState();
}

class _DailyDevotionQuizScreenState extends State<DailyDevotionQuizScreen> {
  List<Quiz> quizzes = [];
  int currentQuestionIndex = 0;
  late List<int> selectedAnswers;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchQuizData();
  }

  Future<void> fetchQuizData() async {
    final url = Uri.parse('${Urls.baseUrl}/progress/today/quiz');
    final token = await LocalStorage.getToken();
    final response = await http.get(url, headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<dynamic> quizJson = data['data'];
      setState(() {
        quizzes = quizJson.map((e) => Quiz.fromJson(e)).toList();
        selectedAnswers = List.filled(quizzes.length, -1);
        isLoading = false;
      });
    } else {
      setState(() { isLoading = false; });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to load quiz")),
      );
    }
  }

  void goPrevious() {
    if (currentQuestionIndex > 0) {
      setState(() { currentQuestionIndex--; });
    } else {
      Navigator.pop(context);
    }
  }

  void goToNext() async {
    if (currentQuestionIndex < quizzes.length - 1) {
      setState(() { currentQuestionIndex++; });
    } else {
      await submitQuiz(); // Submit to backend on Finish
    }
  }

  Future<void> submitQuiz() async {
    final token = await LocalStorage.getToken();
    final url = Uri.parse('${Urls.baseUrl}/quiz/quiz_submit/');

    List<Map<String, dynamic>> answers = [];
    for (int i = 0; i < quizzes.length; i++) {
      if (selectedAnswers[i] != -1) {
        answers.add({
          "daily_quiz_id": quizzes[i].id,
          "quiz_answer_option_id": quizzes[i].options[selectedAnswers[i]].id
        });
      }
    }

    final response = await http.post(
      url,
      headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"answers": answers}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // 👈 এখানে backend response অনুযায়ী score নাও
      int score = data['total_points_for_day'] ?? 0;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QuizMarkScreen(
            correctAnswers: score,
            totalQuestions: quizzes.length,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to submit quiz")),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    if (isLoading) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    if (quizzes.isEmpty) return const Scaffold(body: Center(child: Text("No quiz available")));

    final quiz = quizzes[currentQuestionIndex];

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomQuizAppBar(title: "Bible Journey", onBack: goPrevious),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Question ${currentQuestionIndex + 1} of ${quizzes.length}",
                style: const TextStyle(color: Colors.black54, fontSize: 14)),
            const SizedBox(height: 6),
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / quizzes.length,
              backgroundColor: Colors.grey.shade300,
              color: AppColors.primary,
              minHeight: 6,
              borderRadius: BorderRadius.circular(12),
            ),
            const SizedBox(height: 30),
            Text(quiz.question, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: quiz.options.length,
                itemBuilder: (context, index) {
                  bool isActive = selectedAnswers[currentQuestionIndex] == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() { selectedAnswers[currentQuestionIndex] = index; });
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
                          Icon(isActive ? Icons.check_circle : Icons.circle_outlined,
                              color: isActive ? AppColors.primary : Colors.grey),
                          const SizedBox(width: 12),
                          Expanded(child: Text(quiz.options[index].option, style: const TextStyle(fontSize: 16))),
                        ],
                      ),
                    ),
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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: goToNext,
                child: Text(currentQuestionIndex == quizzes.length - 1 ? "Finish" : "Next",
                    style: const TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
