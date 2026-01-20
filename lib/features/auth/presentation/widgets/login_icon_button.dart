import 'package:blood_dontating_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginWithIconButton extends StatelessWidget {
  final String? svgPath;
  final IconData? iconData;
  final String title;
  final VoidCallback onpressed;
  const LoginWithIconButton({
    this.svgPath,
    this.iconData,
    required this.onpressed,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueGrey,
      ),
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          fixedSize: Size(screenWidth / 2.5, 55),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            svgPath != null
                ? SvgPicture.asset(svgPath!, width: 30, height: 30)
                : Icon(iconData, size: 30),
            Text(
              title,
              style: TextStyle(
                color: AppPallete.backgroundColor,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
