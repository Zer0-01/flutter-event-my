import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/common_widgets/app_text_form_field_widget.dart';
import 'package:flutter_my_event/presentation/screen/create_event/widgets/duration_modal_bottom_sheet_widget.dart';

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
          Text("Event Time"),
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
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
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
                        final Duration? duration = await showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return DurationModalBottomSheetWidget();
                          },
                        );

                        if (duration != null) {
                          durationController.text = "${duration.inHours} hrs";
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
