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
  final int dayId;
  final int journeyId;
  const TodayActionScreen({super.key,required this.dayId, required this.journeyId,});

  @override
  State<TodayActionScreen> createState() => _TodayActionScreenState();
}

class _TodayActionScreenState extends State<TodayActionScreen> {
  bool isLoading = true;
  bool isCompleting = false;
  String actionText = "";
  int actionId = 0;

  @override
  void initState() {
    super.initState();
    fetchTodayAction();
  }

  Future<void> fetchTodayAction() async {
    final token = await LocalStorage.getToken();
    if (token == null || token.isEmpty) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("User not logged in or token missing")),
      );
      return;
    }

    try {
      final response = await http.get(
        Uri.parse('${Urls.baseUrl}/progress/today/action'),
        headers: {'Authorization': 'Bearer $token'},
      );

      print("Fetch Action Response: ${response.statusCode}, ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          actionText = data['data']['action'];
          actionId = data['data']['id'];
          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to fetch action: ${response.statusCode}")),
        );
      }
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Network error:$e")),
      );
    }
  }

  Future<void> markAsDone() async {

    try {
      final token = await LocalStorage.getToken();
      final response = await http.post(
        Uri.parse("${Urls.baseUrl}/progress/stepcopmplete/"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({
          "day_id": widget.dayId,
          "item_type": "action",
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Step completed: ${data['completed']}");

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data["message"])),
        );

        Navigator.push(context, MaterialPageRoute(builder: (context)=>DailyReflectionScreen(journeyId: widget.journeyId, dayId: widget.journeyId,)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data["message"] ?? "Failed to complete step")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Network error")),
      );
    }
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
              text: isCompleting ? "Processing..." : "mark_as_done".tr(),
              onTap: markAsDone,
            ),
          ],
        ),
      ),
    );
  }
}


