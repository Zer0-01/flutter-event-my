import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/common_widgets/app_text_form_field_widget.dart';
import 'package:flutter_my_event/presentation/screen/create_event/event_basics/widgets/duration_modal_bottom_sheet_widget.dart';

class EventTimeWidget extends StatelessWidget {
  final TextEditingController eventTimeController;
  final TextEditingController durationController;

  const EventTimeWidget({
    super.key,
    required this.eventTimeController,
    required this.durationController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Event Time"),
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Start Time",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    AppTextFormFieldWidget(
                      controller: eventTimeController,
                      readOnly: true,
                      suffixIcon: const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.av_timer),
                      ),
                      onTap: () async {
                        final TimeOfDay? selectedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );

                        if (selectedTime != null) {
                          eventTimeController.text =
                              "${selectedTime.hour}:${selectedTime.minute}";
                        }
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Duration",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    AppTextFormFieldWidget(
                      controller: durationController,
                      readOnly: true,
                      onTap: () async {
                        final int? selectedDuration =
                            await showModalBottomSheet(
                              useRootNavigator: true,
                              context: context,
                              builder:
                                  (context) =>
                                      const DurationModalBottomSheetWidget(),
                            );

                        if (selectedDuration != null) {
                          durationController.text = selectedDuration.toString();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
