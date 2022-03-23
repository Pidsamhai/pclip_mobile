import 'package:flutter/material.dart';
import 'package:pclip_mobile/model/room.dart';

class RoomCard extends StatelessWidget {
  final VoidCallback? onTab;
  final VoidCallback? onLongPress;
  final Room room;
  const RoomCard({Key? key, required this.room, this.onTab, this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        child: InkWell(
          onLongPress: onLongPress,
          onTap: onTab,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  room.name,
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
