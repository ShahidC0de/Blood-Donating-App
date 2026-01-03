import 'package:flutter/material.dart';

Future<void> pickBirthDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
  );
  if (picked != null) {
    // Handle the selected date
  }
}
