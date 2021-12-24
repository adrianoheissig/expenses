import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptativeButton extends StatelessWidget {
  final isIosDevice = Platform.isIOS;

  final String? label;
  final Function()? onPressed;

  AdaptativeButton({
    Key? key,
    @required this.label,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isIosDevice
        ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: CupertinoButton(
              child: Text(label!),
              onPressed: onPressed,
              color: Theme.of(context).primaryColor,
              // padding: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.all(10),
            ),
          )
        : RaisedButton(
            child: Text(label!),
            onPressed: onPressed,
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).textTheme.button?.color,
          );
  }
}
