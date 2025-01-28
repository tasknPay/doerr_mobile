import 'package:doerr/shared/presentation/theme/extra_colors.dart';
import 'package:doerr/shared/presentation/widgets/constants/app_spacer.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/presentation/widgets/constants/app_text.dart';

class PostTaskWidget extends StatefulWidget {
  const PostTaskWidget({super.key});

  @override
  State<PostTaskWidget> createState() => _PostTaskWidgetState();
}

class _PostTaskWidgetState extends State<PostTaskWidget> {
  String? selectedTask;
  String? selectedLocation;

  final List<String> taskOptions = [
    'Cleaning',
    'Plumbing',
    'Electrical Work',
    'Gardening',
    'Painting',
  ];

  final List<String> locationSuggestions = [
    'Accra',
    'Kumasi',
    'Tamale',
    'Takoradi',
    'Cape Coast',
    'Sunyani',
  ];

  @override
  Widget build(BuildContext context) {
    void showTaskDescriptionDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            insetPadding: const EdgeInsets.symmetric(horizontal: 24),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Icon with subtle shadow
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: ExtraColors.customGreen.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.info_outline,
                        size: 32, color: ExtraColors.customGreen),
                  ),
                  const SizedBox(height: 12),

                  // Title
                  const Text(
                    'Task Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),

                  // Description
                  const Text(
                    'Provide a clear and concise description of your task. '
                    'Mention any specific details, materials needed, or deadlines '
                    'to help workers understand the job better.',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  // "Got it" Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: ExtraColors.customGreen,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                      child:
                          const Text('Got it', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return ListView(
      padding: const EdgeInsets.all(16.0).copyWith(top: 0),
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const AppText.smaller('What do you need help with?'),
        const AppSpacer.vShorter(),
        DropdownButtonFormField<String>(
          isDense: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            hintText: 'Select an option',
            hintStyle: const TextStyle(fontSize: 10),
          ),
          value: selectedTask,
          items: taskOptions.map((task) {
            return DropdownMenuItem(
              value: task,
              child: AppText.smaller(task, size: 13),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedTask = value;
            });
          },
        ),
        const AppSpacer.vLarger(),
        const AppText.smaller('Task Location'),
        const AppSpacer.vShorter(),
        Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            }
            return locationSuggestions.where((option) => option
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase()));
          },
          onSelected: (String selection) {
            setState(() {
              selectedLocation = selection;
            });
          },
          fieldViewBuilder:
              (context, textEditingController, focusNode, onFieldSubmitted) {
            return TextField(
              style: const TextStyle(fontSize: 13),
              controller: textEditingController,
              focusNode: focusNode,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                hintText: 'Enter or select a location',
                hintStyle: const TextStyle(fontSize: 13),
              ),
            );
          },
          optionsViewBuilder: (context, onSelected, options) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                elevation: 4.0,
                child: Container(
                  width: MediaQuery.of(context).size.width -
                      32, // Adjust as needed
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: options.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      final option = options.elementAt(index);
                      return InkWell(
                        onTap: () => onSelected(option),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(option.toString(),
                              style: const TextStyle(fontSize: 13)),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
        const AppSpacer.vLarger(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AppText.smaller('Task Description'),
            GestureDetector(
              onTap: () => showTaskDescriptionDialog(context),
              child: const Icon(
                Icons.help_outline,
                color: ExtraColors.customGreen,
                size: 20,
              ),
            ),
          ],
        ),
        const AppSpacer.vShorter(),
        TextFormField(
            style: const TextStyle(fontSize: 13),
            maxLines: 5,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(width: 1),
                ),
                hintText: '')),
      ],
    );
  }
}
