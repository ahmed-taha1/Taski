import 'package:flutter/material.dart';

class WelcomeMsg extends StatelessWidget {
  const WelcomeMsg({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Keep',
        children: [
          TextSpan(
            text: ' Going',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).indicatorColor,
                ),
          ),
        ],
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Theme.of(context).primaryColor,
            ),
      ),
    );
  }
}
