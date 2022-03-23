import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmDialog extends Dialog {
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final String message;
  const ConfirmDialog({
    Key? key,
    required this.message,
    this.onConfirm,
    this.onCancel,
  }) : super(key: key);
  @override
  Widget? get child {
    final context = Get.context!;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Confirmation",
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox.square(dimension: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox.square(dimension: 24),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                    onCancel?.call();
                  },
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    Get.back();
                    onConfirm?.call();
                  },
                  child: const Text("Confirm"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
