import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/screen/home/widgets/event_type_card_widget.dart';

class SecondRowEventTypeWidget extends StatelessWidget {
  const SecondRowEventTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        spacing: 8,
        children: [
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              child: EventTypeCardWidget(
                title: "Sport",
                icon: CupertinoIcons.sportscourt,
                color: Colors.blue.shade100,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              child: EventTypeCardWidget(
                title: "Religious",
                icon: CupertinoIcons.moon,
                color: Colors.green.shade100,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,

              child: EventTypeCardWidget(
                title: "Corporate",
                icon: Icons.business,
                color: Colors.orange.shade100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
