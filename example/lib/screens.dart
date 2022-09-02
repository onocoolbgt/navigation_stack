import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen(
      {Key? key,
      required this.title,
      this.noBack = false,
      this.onGoBack,
      this.customBody})
      : super(key: key);
  final String title;
  final bool noBack;
  final Function()? onGoBack;
  final Widget? customBody;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: customBody ??
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('this is screen $title'),
                if (!noBack) ...[
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: onGoBack ?? () => Navigator.pop(context),
                    child: const Text('Go Back'),
                  )
                ]
              ],
            ),
          ),
    );
  }
}
