import 'package:blood_dontating_app/core/theme/app_pallete.dart';
import 'package:blood_dontating_app/features/login/presentation/widgets/customfield.dart';
import 'package:flutter/material.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inbox')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Customfield(hintText: 'Search Name'),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 45,
                    child: Image.asset('assets/images/savelives.png'),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Doe',
                        style: AppPallete.headingText.copyWith(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Available for Blood Donation',
                        style: AppPallete.subHeadingText.copyWith(fontSize: 11),
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    'Yesterday',
                    style: AppPallete.subHeadingText.copyWith(fontSize: 11),
                  ),
                ],
              ),
            ),
            Divider(color: AppPallete.borderColor.withValues(alpha: 0.2)),
          ],
        ),
      ),
    );
  }
}
