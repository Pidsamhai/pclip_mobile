import 'package:flutter/material.dart';

class ColorPallet extends StatelessWidget {
  final MaterialColor color;
  final bool selected;
  final VoidCallback? onTap;
  const ColorPallet({
    Key? key,
    required this.color,
    required this.selected,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100),
          border: selected ? Border.all(color: Colors.black, width: 2) : null,
        ),
        child: selected ? const Icon(Icons.check) : null,
      ),
    );
  }
}
