import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptativeTextField extends StatelessWidget {
  final isIosDevice = Platform.isIOS;
  final String? label;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  final TextInputType? textInputType;

  AdaptativeTextField({
    Key? key,
    this.label,
    this.controller,
    this.onSubmitted,
    this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isIosDevice
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CupertinoTextField(
              placeholder: label,
              controller: controller,
              onSubmitted: onSubmitted,
              keyboardType: textInputType,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            ),
          )
        : TextField(
            decoration: InputDecoration(labelText: label),
            controller: controller,
            onSubmitted: onSubmitted,
            keyboardType: textInputType,
          );
  }
}
