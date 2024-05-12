
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';

class TopIcon extends StatelessWidget {
  const TopIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            color: Theme.of(context).indicatorColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.check_rounded,
            color: Theme.of(context).scaffoldBackgroundColor,
            size: 20,
          ),
        ),
        horizontalSpace(10),
        Text(
          'Taski',
          style: Theme.of(context).textTheme.headline6?.copyWith(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
