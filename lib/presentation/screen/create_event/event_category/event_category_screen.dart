import 'package:flutter/material.dart';
import 'package:flutter_my_event/utils/app_constants.dart';

class EventCategoryScreen extends StatelessWidget {
  const EventCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<EventCategoryEnum> eventCategoryList = [
      EventCategoryEnum.wedding,
      EventCategoryEnum.birthday,
      EventCategoryEnum.sport,
      EventCategoryEnum.religious,
      EventCategoryEnum.corporate,
    ];
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),

            itemCount: eventCategoryList.length,
            itemBuilder: (context, index) {
              final EventCategoryEnum eventCategory = eventCategoryList[index];
              final String eventCategoryName = eventCategory.name;

              return Container(
                color: Colors.red,
                child: Text(eventCategoryName),
              );
            },
          ),
        ),
      ],
    );
  }
}
