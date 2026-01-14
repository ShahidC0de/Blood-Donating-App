import 'package:blood_dontating_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: ColorFiltered(
        colorFilter: ColorFilter.mode(
          Colors.transparent,
          BlendMode.dstOut, // This attempts to "punch out" the white
        ),
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/notification_icon.png', scale: 2),
              const SizedBox(height: 20),
              Text(
                'No Notifications yet',
                style: AppPallete.subHeadingText.copyWith(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
