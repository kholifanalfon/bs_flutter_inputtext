import 'package:bs_flutter_inputtext/bs_flutter_inputtext.dart';
import 'package:bs_flutter_utils/bs_flutter_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Widget of Bootstrap Input Text and customize input text
class BsInput extends StatefulWidget {
  /// Construct BsInput
  const BsInput({
    Key? key,
    this.style = BsInputStyle.outline,
    this.size = BsInputSize.md,
    this.hintText,
    this.hintTextLabel,
    this.focusNode,
    this.width,
    this.disabled = false,
    this.readOnly = false,
    this.minLines = 1,
    this.maxLines = 1,
    required this.controller,
    this.obscureText = false,
    this.autofocus = false,
    this.autocorrect = false,
    this.keyboardType,
    this.inputFormatters,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textCapitalization = TextCapitalization.none,
    this.textDirection,
    this.textInputAction,
    this.onTap,
    this.onEditingComplete,
    this.onChange,
    this.onFieldSubmitted,
    this.onSaved,
    this.showCursor,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.scrollController,
    this.scrollPhysics,
    this.validators = const [],
    this.toolbarOptions,
    this.prefixIcon,
    this.suffixIcon,
    this.onTapPrefixIcon,
    this.onTapSuffixIcon,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BsInputState();
  }

  /// define style of [BsInput]
  final BsInputStyle style;

  /// define size of [BsInput]
  final BsInputSize size;

  /// define width of [BsInput]
  final double? width;

  /// define disabled of [BsInput]
  final bool disabled;

  /// define readOnley of [BsInput]
  final bool readOnly;

  /// define hintText of [BsInput]
  final String? hintText;

  /// define hintTextLabel of [BsInput]
  final String? hintTextLabel;

  /// define maxLines of [BsInput]
  final int? maxLines;

  /// define maxLines of [BsInput]
  final int? minLines;

  /// define focusNode of [BsInput]
  final FocusNode? focusNode;

  /// define controller of [BsInput]
  final TextEditingController controller;

  /// define obscureText of [BsInput]
  final bool obscureText;

  /// define autofocus of [BsInput]
  final bool autofocus;

  /// define autocorrect of [BsInput]
  final bool autocorrect;

  /// define keyboardType of [BsInput]
  final TextInputType? keyboardType;

  /// define inputFormatters of [BsInput]
  final List<TextInputFormatter>? inputFormatters;

  /// define textAlign of [BsInput]
  final TextAlign textAlign;

  /// define textAlignVertical [BsInput]
  final TextAlignVertical? textAlignVertical;

  /// define textCapitalization [BsInput]
  final TextCapitalization textCapitalization;

  /// define textDirection [BsInput\
  final TextDirection? textDirection;

  /// define textInputAction [BsInput]
  final TextInputAction? textInputAction;

  /// define onTap [BsInput]
  final GestureTapCallback? onTap;

  /// define onEditingComplete [BsInput]
  final VoidCallback? onEditingComplete;

  /// define onChange [BsInput]
  final ValueChanged<String>? onChange;

  /// define onFieldSubmitted [BsInput]
  final FormFieldSetter<String>? onFieldSubmitted;

  /// define onSave [BsInput]
  final FormFieldSetter<String>? onSaved;

  /// define showCursor [BsInput]
  final bool? showCursor;

  /// define cursorWidth [BsInput]
  final double cursorWidth;

  /// define cursorHeight [BsInput]
  final double? cursorHeight;

  /// define cursorRadius [BsInput]
  final Radius? cursorRadius;

  /// define cusrorColor [BsInput]
  final Color? cursorColor;

  /// define scrollPadding [BsInput]
  final EdgeInsets scrollPadding;

  /// define scrollPhysics [BsInput]
  final ScrollPhysics? scrollPhysics;

  /// define scrolLController [BsInput]
  final ScrollController? scrollController;

  /// define validators [BsInput]
  final List<BsInputValidator> validators;

  final ToolbarOptions? toolbarOptions;

  final IconData? prefixIcon;

  final IconData? suffixIcon;

  final VoidCallback? onTapPrefixIcon;

  final VoidCallback? onTapSuffixIcon;
}

class _BsInputState extends State<BsInput> with SingleTickerProviderStateMixin {
  GlobalKey<State> _errorKey = GlobalKey<State>();
  FocusNode _focusHintLabel = FocusNode();

  FocusNode? focusNode;
  FormFieldState? formFieldState;

  Duration duration = Duration(milliseconds: 100);
  late AnimationController animated;

  String? get hintText {
    if (widget.hintText == null) return '';

    return widget.hintText;
  }

  String? _errorText;
  TextEditingController get controller => widget.controller;
  bool get isEmpty => controller.text == '';

  @override
  void initState() {
    focusNode = widget.focusNode == null ? FocusNode() : widget.focusNode;
    focusNode!.addListener(onFocusNode);

    _focusHintLabel = FocusNode();
    _focusHintLabel.addListener(() {
      if (_focusHintLabel.hasFocus) focusNode!.requestFocus();
    });

    animated = AnimationController(vsync: this, duration: duration);
    super.initState();
  }

  void updateState(Function function) {
    if (mounted)
      setState(() {
        function();
      });
  }

  @override
  void didUpdateWidget(covariant BsInput oldWidget) {
    animated.duration = duration;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    focusNode!.dispose();
    animated.dispose();

    super.dispose();
  }

  void onFocusNode() {
    updateState(() {
      if (!focusNode!.hasFocus) {
        animated.reverse();
      } else {
        animated.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: controller.text == '' ? null : controller.text,
      validator: (value) {
        _errorText = null;

        if (!widget.disabled)
          widget.validators.map((validator) {
            if (_errorText == null) _errorText = validator.validator(value);
          }).toList();

        return _errorText;
      },
      builder: (field) {
        Future.delayed(Duration(milliseconds: 100), () {
          if (field.mounted && controller.text != '')
            field.didChange(controller.text);
        });

        if (formFieldState == null) formFieldState = field;

        BoxBorder? border = widget.style.border;
        if (focusNode!.hasFocus) if (widget.style.boxShadowFocused.length == 0)
          border = Border(bottom: BorderSide(color: BsColor.primary));

        if (field.hasError) if (widget.style.boxShadowFocused.length == 0)
          border = Border(bottom: BorderSide(color: BsColor.danger));
        else
          border = Border.all(color: BsColor.danger);

        List<BoxShadow> boxShadow = [];
        if (focusNode!.hasFocus) boxShadow = widget.style.boxShadowFocused;

        if (field.hasError && widget.style.boxShadowFocused.length != 0)
          boxShadow = [
            BoxShadow(
              color: BsColor.dangerShadow,
              offset: Offset(0, 0),
              spreadRadius: 2.5,
            )
          ];

        return Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => focusNode!.requestFocus(),
                    child: Container(
                        padding: EdgeInsets.only(
                            left: widget.size.padding.left,
                            right: widget.size.padding.right,
                            top: widget.size.padding.top,
                            bottom: widget.size.padding.bottom),
                        decoration: BoxDecoration(
                            color: widget.disabled
                                ? widget.style.disabledColor
                                : widget.style.backgroundColor,
                            border: border,
                            borderRadius: widget.style.borderRadius,
                            boxShadow: boxShadow),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return Container(
                              width: constraints.maxWidth,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  widget.prefixIcon == null
                                      ? Container()
                                      : Container(
                                          margin: EdgeInsets.only(right: 5.0),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              onTap: widget.onTapPrefixIcon,
                                              child: Icon(
                                                widget.prefixIcon,
                                                size: widget.size.iconSize,
                                                color: field.hasError
                                                    ? Colors.red
                                                    : widget.style.iconColor,
                                              ),
                                              splashColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                            ),
                                          ),
                                        ),
                                  Expanded(child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      return Container(
                                        width: constraints.maxWidth,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: hintText,
                                              contentPadding: EdgeInsets.zero,
                                              isDense: true,
                                              hintStyle: TextStyle(
                                                fontSize: widget.size.fontSize,
                                                color: field.hasError
                                                    ? Colors.red
                                                    : null,
                                              )),
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          focusNode: focusNode,
                                          enabled: !widget.disabled,
                                          readOnly: widget.readOnly,
                                          autofocus: widget.autofocus,
                                          autocorrect: widget.autocorrect,
                                          maxLines: widget.maxLines,
                                          minLines: widget.minLines,
                                          controller: controller,
                                          obscureText: widget.obscureText,
                                          keyboardType: widget.keyboardType,
                                          inputFormatters:
                                              widget.inputFormatters,
                                          textAlign: widget.textAlign,
                                          textAlignVertical:
                                              widget.textAlignVertical,
                                          textCapitalization:
                                              widget.textCapitalization,
                                          textDirection: widget.textDirection,
                                          textInputAction:
                                              widget.textInputAction,
                                          onTap: widget.onTap,
                                          onEditingComplete:
                                              widget.onEditingComplete,
                                          onChanged: (value) {
                                            field.didChange(value);
                                            if (widget.onChange != null)
                                              widget.onChange!(value);

                                            field.setState(() {});
                                          },
                                          onFieldSubmitted: (value) {
                                            field.didChange(value);
                                            if (widget.onFieldSubmitted != null)
                                              widget.onFieldSubmitted!(value);

                                            field.setState(() {});
                                          },
                                          onSaved: (value) {
                                            field.didChange(value);
                                            if (widget.onSaved != null)
                                              widget.onSaved!(value);

                                            field.setState(() {});
                                          },
                                          toolbarOptions: widget.toolbarOptions,
                                          showCursor: widget.showCursor,
                                          cursorColor: widget.cursorColor,
                                          cursorHeight: widget.cursorHeight,
                                          cursorRadius: widget.cursorRadius,
                                          cursorWidth: widget.cursorWidth,
                                          scrollPadding: widget.scrollPadding,
                                          scrollController:
                                              widget.scrollController,
                                          scrollPhysics: widget.scrollPhysics,
                                        ),
                                      );
                                    },
                                  )),
                                  widget.suffixIcon == null
                                      ? Container()
                                      : Container(
                                          margin: EdgeInsets.only(left: 5.0),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              onTap: widget.onTapSuffixIcon,
                                              child: Icon(
                                                widget.suffixIcon,
                                                size: widget.size.iconSize,
                                                color: field.hasError
                                                    ? Colors.red
                                                    : widget.style.iconColor,
                                              ),
                                              splashColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            );
                          },
                        )),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    mouseCursor: SystemMouseCursors.text,
                  ),
                ),
                !field.hasError
                    ? Container(key: _errorKey)
                    : Container(
                        key: _errorKey,
                        margin: EdgeInsets.only(top: 5.0, left: 2.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          field.errorText!,
                          style: TextStyle(
                              fontSize: 12.0, color: BsColor.textError),
                        ),
                      )
              ],
            ),
            widget.hintTextLabel == null
                ? Container(width: 0)
                : renderHintTextLabel(
                    !field.hasError
                        ? widget.style.textColor!
                        : BsColor.textError,
                    Colors.grey,
                    !field.hasError),
          ],
        );
      },
    );
  }

  Widget renderHintTextLabel(Color color, Color placeholderColor, bool valid) {
    return AnimatedBuilder(
      animation: animated,
      builder: (context, _) {
        double x = widget.size.marginLeft + widget.size.padding.left;
        double y = widget.size.marginTop + widget.size.padding.top;
        double fontSize = widget.size.fontSize;

        if (!isEmpty) {
          y = widget.size.transitionLabelY;
          x = widget.size.transitionLabelX;
          fontSize = widget.size.fontSize - widget.size.transisionFontSize;
        } else if (!isEmpty || focusNode!.hasFocus) {
          y = widget.size.transitionLabelY * animated.value;
          x = widget.size.transitionLabelX;
          fontSize = widget.size.fontSize -
              widget.size.transisionFontSize * animated.value;
        }

        Color textColor = color;
        if (animated.value == 0) textColor = placeholderColor;

        if ((!isEmpty && animated.value == 1) || !valid) textColor = color;

        return Positioned(
          left: x,
          top: y,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                focusNode: _focusHintLabel,
                onTap: () => focusNode!.requestFocus(),
                child: Container(
                  padding: EdgeInsets.only(left: 2.0, right: 2.0),
                  color: widget.disabled
                      ? widget.style.disabledColor
                      : widget.style.backgroundColor,
                  child: Text(widget.hintTextLabel!,
                      style: TextStyle(
                        fontSize: fontSize,
                        color: textColor,
                      ),
                      overflow: TextOverflow.ellipsis),
                ),
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                mouseCursor: SystemMouseCursors.text,
              ),
            ),
          ),
        );
      },
    );
  }
}
