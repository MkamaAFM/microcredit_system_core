import 'package:flutter/material.dart';

class InButtonProgressIndicator extends StatelessWidget {
  const InButtonProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: 12, height: 12, child: CircularProgressIndicator());
  }
}
