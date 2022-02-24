import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final VoidCallback? onTab;
  const RoomCard({Key? key, this.onTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: SizedBox(
        width: double.maxFinite,
        child: Card(
          color: Colors.grey.shade300,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Room name"),
                Text("Latest message"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
