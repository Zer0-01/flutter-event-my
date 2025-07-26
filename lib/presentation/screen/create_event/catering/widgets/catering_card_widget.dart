import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/presentation/screen/create_event/catering/bloc/catering_bloc.dart';

class CateringCardWidget extends StatelessWidget {
  final int id;
  final String name;
  final String description;
  final String address;
  final List<String> tags;
  final List<String> services;
  final bool isSelected;

  const CateringCardWidget({
    super.key,
    required this.name,
    required this.description,
    required this.address,
    required this.tags,
    required this.services,
    required this.id,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color:
              isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(description),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.location_pin,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 4),
                Text(
                  address.split(',').last.trim(),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 4,
              children:
                  tags
                      .map(
                        (tag) => Chip(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondaryContainer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: Colors.transparent),
                          ),
                          label: Text(
                            tag,
                            style: Theme.of(
                              context,
                            ).textTheme.labelMedium?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                      .toList(),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 4,
              children:
                  services
                      .map(
                        (service) => Chip(
                          backgroundColor: Colors.green.shade50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: Colors.transparent),
                          ),
                          label: Text(
                            service,
                            style: Theme.of(
                              context,
                            ).textTheme.labelMedium?.copyWith(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                      .toList(),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // Implement view details if needed
                    },
                    child: const Text("View Details"),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      context.read<CateringBloc>().add(
                        OnSelectCatererEvent(selectedCatererId: id),
                      );
                    },
                    child: const Text("Select"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
