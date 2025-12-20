import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/app/Urls.dart';
import '../../../core/services/local_storage_service.dart';
import '../../../widgets/buttons/custom_button.dart';
import '../../reflection/screens/daily_reflection_screen.dart';

class TodayActionScreen extends StatefulWidget {
  const TodayActionScreen({super.key});

  @override
  State<TodayActionScreen> createState() => _TodayActionScreenState();
}

class _TodayActionScreenState extends State<TodayActionScreen> {
  bool isLoading = true;
  String actionText = "";
  int actionId = 0;

  @override
  void initState() {
    super.initState();
    fetchTodayAction();
  }

  Future<void> fetchTodayAction() async {
    final token = await LocalStorage.getToken();
    final response = await http.get(
      Uri.parse('${Urls.baseUrl}/progress/today/action'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        actionText = data['data']['action'];
        actionId = data['data']['id'];
        isLoading = false;
      });
    } else {
      setState(() => isLoading = false);
    }
  }

  Future<void> markAsDone() async {
    final token = await LocalStorage.getToken();

    await http.post(
      Uri.parse('${Urls.baseUrl}/progress/today/action'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
      body: jsonEncode({"action_id": actionId}),
    );

    // Navigator.push(
    //   //context,
    //   //MaterialPageRoute(builder: (_) => const DailyReflectionScreen()),
    // );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(title: const Text("Today's Action")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xffE3E9E3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                actionText,
                style: const TextStyle(fontSize: 16, color: Color(0xff616161)),
              ),
            ),
            const Spacer(),
            CustomButton(
                text: "mark_as_done".tr(),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DailyReflectionScreen()),
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}
