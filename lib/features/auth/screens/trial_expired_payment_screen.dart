import 'package:flutter/material.dart';

class TrialExpiredPaymentScreen extends StatelessWidget {
  final String planType; // "Monthly" or "Yearly"
  const TrialExpiredPaymentScreen({super.key, required this.planType});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.05),

              /// Logo
              Image.asset(
                'assets/images/app_logo.png',
                height: height * 0.12,
              ),

              SizedBox(height: height * 0.03),

              /// Title
              Text(
                "$planType Plan",
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF005493),
                ),
              ),

              SizedBox(height: 10),

              /// Subtitle
              Text(
                "Complete your subscription to unlock all features",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),

              SizedBox(height: height * 0.05),

              /// Plan Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 5,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      planType,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      planType == "Monthly" ? "\$9.99 / month" : "\$99.99 / year",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "• Access all premium content\n• Unlimited quizzes\n• Daily devotionals",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ],
                ),
              ),

              Spacer(),

              /// Pay Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () async {
                    // Stripe Payment Logic
                    // Example: call your backend to create payment intent and open Stripe checkout
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Stripe payment triggered")),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    "Pay ${planType == "Monthly" ? "\$9.99" : "\$99.99"}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
