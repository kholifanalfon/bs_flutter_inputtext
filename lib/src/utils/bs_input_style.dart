import 'package:bs_flutter_utils/bs_flutter_utils.dart';
import 'package:flutter/material.dart';

/// Class to define of [BsInputText]
class BsInputStyle {
  /// Construct [BsInputStyle]
  const BsInputStyle({
    this.textColor = BsColor.primary,
    this.iconColor = Colors.black87,
    this.backgroundColor = Colors.transparent,
    this.disabledColor = const Color(0xffe7e7e7),
    this.border,
    this.borderRadius,
    this.boxShadowFocused = const [],
  });

  /// define color of [BsInputText]
  final Color? textColor;

  final Color? iconColor;

  /// define color of backgroundColor [BsInputText]
  final Color? backgroundColor;

  /// define disabledColor of backgroundColor [BsInputText]
  final Color? disabledColor;

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

  static const BsInputStyle outlineRounded = BsInputStyle(
      backgroundColor: Colors.white,
      border: Border(
        top: BorderSide(color: BsColor.borderColor),
        bottom: BorderSide(color: BsColor.borderColor),
        left: BorderSide(color: BsColor.borderColor),
        right: BorderSide(color: BsColor.borderColor),
      ),
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
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