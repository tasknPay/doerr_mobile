import 'package:doerr/shared/presentation/theme/extra_colors.dart';
import 'package:doerr/shared/presentation/widgets/constants/app_spacer.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  int activeStep = 0;

  void _onNextPressed() {
    if (activeStep < 4) {
      setState(() {
        activeStep++;
      });
    }
  }

  void _onPreviousPressed() {
    if (activeStep > 0) {
      setState(() {
        activeStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (activeStep > 0)
            SizedBox(
              width: 45,
              height: 45,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey),
                ),
                child: FloatingActionButton(
                  heroTag: 'back',
                  onPressed: _onPreviousPressed,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  mini: true,
                  child: const Icon(Icons.arrow_back_ios,
                      color: Colors.grey, size: 18),
                ),
              ),
            ),
          const SizedBox(width: 8),
          SizedBox(
            width: 45,
            height: 45,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
              ),
              child: FloatingActionButton(
                heroTag: 'forward',
                onPressed: _onNextPressed,
                backgroundColor: Colors.transparent,
                elevation: 0,
                mini: true,
                child: Icon(
                  activeStep < 4 ? Icons.arrow_forward_ios : Icons.check,
                  color: Colors.grey,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        children: [
          const AppSpacer.vLarger(),
          const AppSpacer.vShort(),
          EasyStepper(
            activeStep: activeStep,
            stepShape: StepShape.circle,
            borderThickness: 2,
            stepRadius: 22,
            finishedStepBorderColor: ExtraColors.customGreen,
            finishedStepIconColor: ExtraColors.white,
            finishedStepTextColor: ExtraColors.customGreen,
            finishedStepBackgroundColor: Colors.transparent,
            unreachedStepIconColor: ExtraColors.darkGrey,
            unreachedStepTextColor: ExtraColors.darkGrey,
            activeStepIconColor: Colors.black87,
            activeStepBorderColor: Colors.black87,
            activeStepTextColor: Colors.black87,
            enableStepTapping: false,
            showLoadingAnimation: true,
            steps: [
              EasyStep(
                customStep: Icon(
                  IconlyBold.paper_plus,
                  color:
                      activeStep >= 0 ? ExtraColors.customGreen : Colors.grey,
                ),
                customTitle: Text(
                  'Task',
                  style: TextStyle(
                    color: activeStep >= 0
                        ? (activeStep == 0
                            ? Colors.black87
                            : ExtraColors.customGreen)
                        : ExtraColors.darkGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              EasyStep(
                customStep: Icon(
                  IconlyBold.document,
                  color:
                      activeStep >= 1 ? ExtraColors.customGreen : Colors.grey,
                ),
                customTitle: Text(
                  'Details',
                  style: TextStyle(
                    color: activeStep >= 1
                        ? (activeStep == 1
                            ? Colors.black87
                            : ExtraColors.customGreen)
                        : ExtraColors.darkGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              EasyStep(
                customStep: Icon(
                  IconlyBold.show,
                  color:
                      activeStep >= 2 ? ExtraColors.customGreen : Colors.grey,
                ),
                customTitle: Text(
                  'Review',
                  style: TextStyle(
                    color: activeStep >= 2
                        ? (activeStep == 2
                            ? Colors.black87
                            : ExtraColors.customGreen)
                        : ExtraColors.darkGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              EasyStep(
                customStep: Icon(
                  IconlyBold.buy,
                  color:
                      activeStep >= 3 ? ExtraColors.customGreen : Colors.grey,
                ),
                customTitle: Text(
                  'Checkout',
                  style: TextStyle(
                    color: activeStep >= 3
                        ? (activeStep == 3
                            ? Colors.black87
                            : ExtraColors.customGreen)
                        : ExtraColors.darkGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              EasyStep(
                customStep: Icon(
                  IconlyBold.tick_square,
                  color:
                      activeStep >= 4 ? ExtraColors.customGreen : Colors.grey,
                ),
                customTitle: Text(
                  'Payment',
                  style: TextStyle(
                    color: activeStep >= 4
                        ? (activeStep == 4
                            ? Colors.black87
                            : ExtraColors.customGreen)
                        : ExtraColors.darkGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
            onStepReached: (index) => setState(() => activeStep = index),
          ),
          Expanded(
            child: Center(
              child: _buildStepContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepContent() {
    switch (activeStep) {
      case 0:
        return const Text(
          'Post Task',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        );
      case 1:
        return const Text(
          'Task Details',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        );
      case 2:
        return const Text(
          'Review Task',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        );
      case 3:
        return const Text(
          'Checkout',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        );
      case 4:
        return const Text(
          'Payment Complete',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        );
      default:
        return Container();
    }
  }
}
