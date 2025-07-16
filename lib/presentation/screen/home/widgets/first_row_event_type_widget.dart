import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/screen/home/widgets/event_type_card_widget.dart';

class FirstRowEventTypeWidget extends StatelessWidget {
  const FirstRowEventTypeWidget({super.key});

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
                title: "Wedding",
                icon: CupertinoIcons.heart,
                color: Colors.pink.shade100,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,

              child: EventTypeCardWidget(
                title: "Birthday",
                icon: CupertinoIcons.gift,
                color: Colors.purple.shade100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
