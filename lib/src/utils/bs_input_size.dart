import 'package:flutter/material.dart';

/// Class to define size of [BsInputText]
class BsInputSize {
  /// Construct [BsInputSize]
  const BsInputSize({
    this.padding,
    this.fontSize,
    this.marginTop = 0,
    this.marginLeft = 0,
    this.transitionMarginLeft = 0,
    this.transitionMarginTop = 0,
    this.transisionFontSize = 2.0,
  });

  /// define padding of [BsInputText]
  final EdgeInsetsGeometry? padding;

  /// defin marginTop [BsInputText]
  final double? marginTop;

  /// define marginLeft [BsInputText]
  final double? marginLeft;

  /// define transitionMarginLeft [BsInputText]
  final double? transitionMarginLeft;

  /// define transitionMarginTop [BsInputText]
  final double? transitionMarginTop;

  /// define transisionFontSize [BsInputText]
  final double? transisionFontSize;

  /// defin fontSize [BsInputText]
  final double? fontSize;

  /// define input size small
  static const BsInputSize sm = BsInputSize(
    fontSize: 10.0,
    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
    marginTop: 11.0,
    marginLeft: 10.0,
    transitionMarginTop: 4.0,
    transitionMarginLeft: -5.0,
  );

  /// define input size medium
  static const BsInputSize md = BsInputSize(
    fontSize: 14.0,
    padding: EdgeInsets.only(left: 14.0, right: 14.0, top: 14.0, bottom: 14.0),
    marginTop: 12.0,
    marginLeft: 10.0,
    transitionMarginTop: 7.0,
    transitionMarginLeft: -5.0,
  );

  /// define input text large
  static const BsInputSize lg = BsInputSize(
    fontSize: 18.0,
    padding: EdgeInsets.only(left: 18.0, right: 18.0, top: 18.0, bottom: 18.0),
    marginTop: 15.0,
    marginLeft: 18.0,
    transitionMarginTop: 10.0,
    transitionMarginLeft: -5.0,
  );

  /// define size input text outline bottom small
  static const BsInputSize outlineBottomSm = BsInputSize(
    fontSize: 10.0,
    padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0, bottom: 10.0),
    marginTop: 10.0,
    marginLeft: 5.0,
    transitionMarginTop: 5.0,
  );

  /// define size input text outline bottom medium
  static const BsInputSize outlineBottomMd = BsInputSize(
    fontSize: 14.0,
    padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 14.0, bottom: 14.0),
    marginTop: 14.0,
    marginLeft: 5.0,
    transitionMarginTop: 10.0,
  );

  /// define size input outline bottom large
  static const BsInputSize outlineBottomLg = BsInputSize(
    fontSize: 18.0,
    padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 14.0, bottom: 14.0),
    marginTop: 10.0,
    marginLeft: 5.0,
    transitionMarginTop: 10.0,
    transisionFontSize: 5.0,
  );
}