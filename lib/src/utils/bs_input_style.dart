import 'package:bs_flutter_utils/bs_flutter_utils.dart';
import 'package:flutter/material.dart';

/// Class to define of [BsInputText]
class BsInputStyle {
  /// Construct [BsInputStyle]
  const BsInputStyle({
    this.color = BsColor.primary,
    this.backgroundColor = Colors.transparent,
    this.border,
    this.borderRadius,
    this.boxShadowFocused = const [],
  });

  /// define color of [BsInputText]
  final Color? color;

  /// define color of backgroundColor [BsInputText]
  final Color? backgroundColor;

  /// define border of [BsInputText]
  final BoxBorder? border;

  /// define borderRadius of [BsInputText]
  final BorderRadiusGeometry? borderRadius;

  /// define boxShadowFocused of [BsInputText]
  final List<BoxShadow> boxShadowFocused;

  /// define style outline input text
  static const BsInputStyle outline = BsInputStyle(
      backgroundColor: Colors.white,
      border: Border(
        top: BorderSide(color: BsColor.borderColor),
        bottom: BorderSide(color: BsColor.borderColor),
        left: BorderSide(color: BsColor.borderColor),
        right: BorderSide(color: BsColor.borderColor),
      ),
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      boxShadowFocused: [
        BoxShadow(
          color: BsColor.primaryShadow,
          offset: Offset(0, 0),
          spreadRadius: 2.5,
        )
      ]);

  /// define style outline bottom input text
  static const BsInputStyle outlineBottom = BsInputStyle(
      border: Border(bottom: BorderSide(color: BsColor.borderColor)));
}