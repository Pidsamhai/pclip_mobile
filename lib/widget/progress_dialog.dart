import 'package:flutter/material.dart';

class ProgressDialog extends Dialog {
  const ProgressDialog({Key? key}) : super(key: key);

  // @override
  // ShapeBorder? get shape {
  //   return RoundedRectangleBorder(
  //     borderRadius: BorderRadius.circular(16),
  //   );
  // }

  @override
  Widget? get child {
    return WillPopScope(
      onWillPop: () async => false,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CircularProgressIndicator(),
            SizedBox.square(dimension: 16),
            Text("Progress..."),
          ],
        ),
      ),
    );
  }
}
