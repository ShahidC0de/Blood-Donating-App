import 'dart:async';

import 'package:blood_dontating_app/core/theme/app_pallete.dart';
import 'package:blood_dontating_app/features/login/presentation/widgets/login_button.dart';
import 'package:blood_dontating_app/features/login/presentation/widgets/otp_box.dart';
import 'package:blood_dontating_app/features/profile/presentation/screens/profile_setup.dart';
import 'package:flutter/material.dart';

class VerificationPage extends StatefulWidget {
  final String mobileNumber;
  static Route route(String mobileNumber) => MaterialPageRoute(
    builder: (context) => VerificationPage(mobileNumber: mobileNumber),
  );
  const VerificationPage({super.key, required this.mobileNumber});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  final List<TextEditingController> otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());
  int seconds = 30;
  Timer? timer;
  void startTimer() {
    timer?.cancel();
    seconds = 30;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds == 0) {
        t.cancel();
      } else {
        setState(() {
          seconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Verification Code', style: AppPallete.headingText),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter the 6-digit code sent to your mobile number',
              style: AppPallete.subHeadingText,
            ),
            SizedBox(height: 15),
            Text(
              'Number ${widget.mobileNumber}',
              style: AppPallete.subHeadingText,
            ),

            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) {
                return OtpBox(
                  index: index,
                  controller: otpControllers[index],
                  focusNode: focusNodes[index],
                  nextFocusNode: index < 5 ? focusNodes[index + 1] : null,
                  prevFocusNode: index > 0 ? focusNodes[index - 1] : null,
                );
              }),
            ),
            const SizedBox(height: 60),
            Center(
              child: seconds > 0
                  ? RichText(
                      text: TextSpan(
                        text: "Resend code in  ",
                        style: AppPallete.subHeadingText,
                        children: [
                          TextSpan(
                            text: '00:$seconds',
                            style: AppPallete.subHeadingText.copyWith(
                              color: AppPallete.buttonColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  : TextButton(
                      onPressed: () {
                        startTimer();
                      },
                      child: Text(
                        'Resend Code',
                        style: AppPallete.subHeadingText.copyWith(
                          color: AppPallete.buttonColor,
                        ),
                      ),
                    ),
            ),
            Spacer(),
            AuthButton(
              onpressed: () {
                Navigator.pushReplacement(context, ProfileSetup.route());
              },
              title: 'Verify',
            ),
          ],
        ),
      ),
    );
  }
}
