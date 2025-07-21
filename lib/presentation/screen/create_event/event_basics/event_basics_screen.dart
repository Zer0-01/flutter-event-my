import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/screen/create_event/event_basics/widgets/event_date_widget.dart';
import 'package:flutter_my_event/presentation/screen/create_event/event_basics/widgets/event_headline_widget.dart';
import 'package:flutter_my_event/presentation/screen/create_event/event_basics/widgets/event_name_widget.dart';
import 'package:flutter_my_event/presentation/screen/create_event/event_basics/widgets/event_summary_widget.dart';
import 'package:flutter_my_event/presentation/screen/create_event/event_basics/widgets/event_time_widget.dart';

class EventBasicsScreen extends StatefulWidget {
  const EventBasicsScreen({super.key});

  @override
  State<EventBasicsScreen> createState() => _EventBasicsScreenState();
}

class _EventBasicsScreenState extends State<EventBasicsScreen> {
  late final TextEditingController _eventNameController;
  late final TextEditingController _eventDateController;
  late final TextEditingController _startTimeController;
  late final TextEditingController _durationController;

  @override
  void initState() {
    super.initState();
    _eventNameController = TextEditingController();
    _eventDateController = TextEditingController();
    _startTimeController = TextEditingController();
    _durationController = TextEditingController();
    _eventNameController.addListener(_controllerListener);
    _eventDateController.addListener(_controllerListener);
    _startTimeController.addListener(_controllerListener);
    _durationController.addListener(_controllerListener);
  }

  @override
  void dispose() {
    _eventNameController.dispose();
    _eventDateController.dispose();
    _startTimeController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  void _controllerListener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const EventHeadlineWidget(
                title: "Event Basics",
                description: "Tell us about your event - name, date and time.",
              ),
              EventNameWidget(eventNameController: _eventNameController),
              EventDateWidget(eventDateController: _eventDateController),
              EventTimeWidget(
                eventTimeController: _startTimeController,
                durationController: _durationController,
              ),
              if (_eventNameController.text.isNotEmpty &&
                  _eventDateController.text.isNotEmpty &&
                  _startTimeController.text.isNotEmpty &&
                  _durationController.text.isNotEmpty)
                EventSummaryWidget(
                  eventName: _eventNameController.text,
                  eventDate: _eventDateController.text,
                  eventTime: _startTimeController.text,
                  eventDuration: _durationController.text,
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed:
                        (_eventNameController.text.isEmpty ||
                                _eventDateController.text.isEmpty ||
                                _startTimeController.text.isEmpty ||
                                _durationController.text.isEmpty)
                            ? null
                            : () {},
                    child: const Text("Next"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
