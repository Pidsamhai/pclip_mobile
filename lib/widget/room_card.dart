import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final VoidCallback? onTab;
  const RoomCard({Key? key, this.onTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        child: InkWell(
          onTap: onTab,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Room name",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox.square(dimension: 4),
                Text(
                  "Latest message",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
