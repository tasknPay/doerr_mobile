import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconly/iconly.dart';

import '../../../../../shared/presentation/widgets/constants/app_spacer.dart';
import '../../../../../shared/presentation/widgets/constants/app_text.dart';

class TaskDetailsWidget extends StatefulWidget {
  const TaskDetailsWidget({super.key});

  @override
  State<TaskDetailsWidget> createState() => _TaskDetailsWidgetState();
}

class _TaskDetailsWidgetState extends State<TaskDetailsWidget> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  String _selectedCurrency = "GHS"; // Default currency

  /// Shows a Cupertino Date Picker inside an Alert Dialog
  /// Shows a Cupertino Date Picker inside a modal bottom sheet
  void _selectDate() {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return SizedBox(
          height: 250,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            minimumDate: DateTime.now(),
            maximumDate: DateTime(2100),
            initialDateTime: DateTime.now(),
            onDateTimeChanged: (DateTime date) {
              setState(() {
                _dateController.text =
                    "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
              });
            },
          ),
        );
      },
    );
  }

  /// Shows the Currency Picker using the package function
  void _showCurrencyPickerDialog() {
    showCurrencyPicker(
      context: context,
      showFlag: true,
      showCurrencyName: true,
      showCurrencyCode: true,
      showSearchField: true,
      theme: CurrencyPickerThemeData(
        backgroundColor: Colors.white, // ✅ Ensures non-transparent background
        flagSize: 20,
        titleTextStyle: const TextStyle(fontSize: 14),
        subtitleTextStyle: const TextStyle(fontSize: 12, color: Colors.grey),
        bottomSheetHeight: 500, // Adjust height if needed
        // dividerColor: Colors.grey.shade300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Adds rounded corners
        ),
      ),
      onSelect: (Currency currency) {
        setState(() {
          _selectedCurrency = currency.code;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0).copyWith(top: 0),
      children: [
        // Task Date Selection
        const AppText.smaller('Task Deadline'),
        const AppSpacer.vShorter(),
        TextFormField(
          controller: _dateController,
          readOnly: true,
          decoration: InputDecoration(
            hintText: 'Tap to pick a date',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
            suffixIcon: const Icon(IconlyLight.calendar, color: Colors.grey),
          ),
          onTap: _selectDate,
        ),

        const AppSpacer.vLarger(),

        // Task Price with Currency Picker
        const AppText.smaller('Set Price'),
        const AppSpacer.vShorter(),
        Row(
          children: [
            // Currency Selector Button
            GestureDetector(
              onTap: _showCurrencyPickerDialog,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  _selectedCurrency,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(width: 10),
            // Price Input Field
            Expanded(
              child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                  TextInputFormatter.withFunction((oldValue, newValue) {
                    try {
                      final text = newValue.text;
                      if (text.isNotEmpty) double.parse(text);
                      return newValue;
                    } catch (e) {
                      return oldValue;
                    }
                  }),
                ],
                controller: _priceController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: 'Enter price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ],
        ),
        const AppSpacer.vLarger(),

        // Task Price with Currency Picker
        const AppText.smaller('Confirm mail'),
        const AppSpacer.vShorter(),
        TextFormField(
            initialValue: 'User mail',
            style: const TextStyle(fontSize: 13),
            maxLines: 1,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(width: 1),
                ),
                hintText: 'Email')),
      ],
    );
  }
}
