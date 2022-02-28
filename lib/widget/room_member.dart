import 'package:flutter/material.dart';

class RoomMemberCard extends StatelessWidget {
  const RoomMemberCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Member name",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox.square(dimension: 4),
                  Text(
                    "Member uid",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.close_rounded),
            )
          ],
        ),
      ),
    );
  }
}
