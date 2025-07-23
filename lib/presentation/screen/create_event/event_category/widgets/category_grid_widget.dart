import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/presentation/screen/create_event/bloc/create_event_bloc.dart';
import 'package:flutter_my_event/utils/app_constants.dart';

class CategoryGridWidget extends StatelessWidget {
  const CategoryGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<EventCategoryEnum> eventCategoryList = [
      EventCategoryEnum.wedding,
      EventCategoryEnum.birthday,
      EventCategoryEnum.sport,
      EventCategoryEnum.religious,
      EventCategoryEnum.corporate,
    ];
    return BlocBuilder<CreateEventBloc, CreateEventState>(
      builder: (context, state) {
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
              final IconData eventCategoryIcon = _getEventCategoryIcon(
                eventCategory,
              );
              final Color eventCategoryColor = _getEventCategoryColor(
                eventCategory,
              );

              return GestureDetector(
                onTap: () {
                  context.read<CreateEventBloc>().add(
                    OnSelectCategoryEvent(category: eventCategoryName),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(16),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 2,
                      color:
                          state.category == eventCategoryName
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                    ),
                    color: eventCategoryColor,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 16,
                      children: [
                        Icon(eventCategoryIcon),
                        Text(eventCategoryName),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Color _getEventCategoryColor(EventCategoryEnum eventCategory) {
    switch (eventCategory) {
      case EventCategoryEnum.wedding:
        return Colors.pink.shade100;
      case EventCategoryEnum.birthday:
        return Colors.purple.shade100;
      case EventCategoryEnum.sport:
        return Colors.blue.shade100;
      case EventCategoryEnum.religious:
        return Colors.green.shade100;
      case EventCategoryEnum.corporate:
        return Colors.orange.shade100;
    }
  }

  IconData _getEventCategoryIcon(EventCategoryEnum eventCategory) {
    switch (eventCategory) {
      case EventCategoryEnum.wedding:
        return Icons.celebration;
      case EventCategoryEnum.birthday:
        return Icons.cake;
      case EventCategoryEnum.sport:
        return Icons.sports_soccer;
      case EventCategoryEnum.religious:
        return Icons.church;
      case EventCategoryEnum.corporate:
        return Icons.business;
    }
  }
}
