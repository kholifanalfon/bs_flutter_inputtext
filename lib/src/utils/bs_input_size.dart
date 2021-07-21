import 'package:flutter/material.dart';

/// Class to define size of [BsInputText]
class BsInputSize {
  /// Construct [BsInputSize]
  const BsInputSize({
    this.padding,
    this.fontSize = 14.0,
    this.marginTop = 0,
    this.marginLeft = 0,
    this.transitionLabelX = 0,
    this.transitionLabelY = 0,
    this.transisionFontSize = 2.0,
  });

  /// define padding of [BsInputText]
  final EdgeInsetsGeometry? padding;

  /// defin marginTop [BsInputText]
  final double marginTop;

  /// define marginLeft [BsInputText]
  final double marginLeft;

  /// define transitionMarginLeft [BsInputText]
  final double transitionLabelX;

  /// define transision margin top [BsInputText]
  final double transitionLabelY;

  /// define transisionFontSize [BsInputText]
  final double transisionFontSize;

  /// defin fontSize [BsInputText]
  final double fontSize;

  /// define input size small
  static const BsInputSize sm = BsInputSize(
    fontSize: 10.0,
    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
    marginLeft: 10.0,
    transitionLabelX: -5.0,
    transitionLabelY: 37.0,
  );

  /// define input size medium
  static const BsInputSize md = BsInputSize(
    fontSize: 14.0,
    padding: EdgeInsets.only(left: 14.0, right: 14.0, top: 14.0, bottom: 14.0),
    marginLeft: 15.0,
    transitionLabelX: -5.0,
    transitionLabelY: 47.0,
  );

  /// define input text large
  static const BsInputSize lg = BsInputSize(
    fontSize: 18.0,
    padding: EdgeInsets.only(left: 18.0, right: 18.0, top: 18.0, bottom: 18.0),
    marginLeft: 15.0,
    transitionLabelX: -5.0,
    transitionLabelY: 57.0,
  );

  /// define size input text outline bottom small
  static const BsInputSize outlineBottomSm = BsInputSize(
    fontSize: 10.0,
    padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0, bottom: 10.0),
    marginLeft: 5.0,
    transitionLabelX: 2.0,
    transitionLabelY: 35.0
  );

  /// define size input text outline bottom medium
  static const BsInputSize outlineBottomMd = BsInputSize(
    fontSize: 14.0,
    padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 14.0, bottom: 14.0),
    marginLeft: 5.0,
    transitionLabelX: 2.0,
    transitionLabelY: 45.0,
  );

  /// define size input outline bottom large
  static const BsInputSize outlineBottomLg = BsInputSize(
    fontSize: 18.0,
    padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 14.0, bottom: 14.0),
    marginLeft: 5.0,
    transitionLabelX: 2.0,
    transitionLabelY: 45.0,
    transisionFontSize: 7.0
  );
}