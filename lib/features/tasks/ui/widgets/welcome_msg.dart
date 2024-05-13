import 'package:flutter/material.dart';

class WelcomeMsg extends StatelessWidget {
  const WelcomeMsg({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Welcome, ',
        children: [
          TextSpan(
            text: 'Ahmed',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: Theme.of(context).indicatorColor,
                ),
          ),
        ],
        style: Theme.of(context).textTheme.headline6?.copyWith(
              color: Theme.of(context).primaryColor,
            ),
      ),
    );
  }
}
