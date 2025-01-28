import 'package:doerr/shared/presentation/theme/extra_colors.dart';
import 'package:doerr/shared/presentation/widgets/constants/app_spacer.dart';
import 'package:doerr/src/tasks/presentation/interface/widgets/post_task_widget.dart';
import 'package:doerr/src/tasks/presentation/interface/widgets/task_details_widget.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../widgets/checkout_widget.dart';
import '../widgets/order_confirmed_widget.dart';
import '../widgets/review_widget.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  int activeStep = 0;

  void _onNextPressed() {
    if (activeStep < 3) {
      setState(() {
        activeStep++;
      });
    }
  }

  void _showOrderConfirmedDialog() {
    setState(() {});
    showDialog(
      context: context,
      builder: (context) => const OrderConfirmedDialog(),
    );
    activeStep = 0;
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
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        floatingActionButton: Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0,
          child: Row(
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
              const SizedBox(width: 3),
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
                    onPressed: activeStep < 3
                        ? _onNextPressed
                        : _showOrderConfirmedDialog,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    mini: true,
                    child: Icon(
                      activeStep < 3 ? Icons.arrow_forward_ios : Icons.check,
                      color: Colors.grey,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Column(
          children: [
            const AppSpacer.vLarger(),
            const AppSpacer.vShort(),
            SizedBox(
              height: 105,
              child: EasyStepper(
                padding: const EdgeInsets.all(0),
                activeStep: activeStep,
                stepShape: StepShape.circle,
                borderThickness: 2,
                stepRadius: 22,
                finishedStepBorderColor: ExtraColors.customGreen,
                finishedStepIconColor: ExtraColors.white,
                finishedStepTextColor: ExtraColors.customGreen,
                finishedStepBackgroundColor: ExtraColors.customGreen,
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
                      color: activeStep >= 0 ? ExtraColors.white : Colors.grey,
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
                      color: activeStep >= 1 ? ExtraColors.white : Colors.grey,
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
                      color: activeStep >= 2 ? ExtraColors.white : Colors.grey,
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
                      color: activeStep >= 3 ? ExtraColors.white : Colors.grey,
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
                ],
                onStepReached: (index) => setState(() => activeStep = index),
              ),
            ),
            Expanded(
              child: _buildStepContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepContent() {
    switch (activeStep) {
      case 0:
        return const PostTaskWidget();
      case 1:
        return const TaskDetailsWidget();
      case 2:
        return const ReviewWidget();
      case 3:
        return const CheckoutWidget();
      default:
        return Container();
    }
  }
}
