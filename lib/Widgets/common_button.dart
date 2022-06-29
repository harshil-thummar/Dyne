// ignore_for_file: unrelated_type_equality_checks, prefer_const_constructors, must_be_immutable, unnecessary_null_comparison, avoid_init_to_null, overridden_fields, annotate_overrides, unnecessary_new, prefer_const_constructors_in_immutables, library_private_types_in_public_api
library flutter_switch;

import 'package:flutter/material.dart';
import '../Constance/constance.dart';
import '../Language/app_localization.dart';
import '../Responsive/responsive.dart';

class InfiniteElevatedButton extends StatelessWidget {
  final String? text;
  final Color? containerColor;
  final IconData? icon;
  final String? image;
  final VoidCallback onPressed;
  bool? disableButton;
  final VoidCallback? onLongPress;
  final double? height;
  final TextStyle? style;
  final double horizontalMargin;
  bool? miniRadius;
  bool? responsive;
  InfiniteElevatedButton(
      {Key? key,
      this.text,
      this.containerColor,
      this.icon,
      this.image,
      this.miniRadius,
      this.horizontalMargin = 0,
      required this.onPressed,
      this.disableButton,
      this.onLongPress,
      this.height = 50,
      this.responsive,
      this.style})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return responsive != true
        ? elevatedButton(context)
        : Column(
            children: [
              if (Responsive.isMobile(context)) elevatedButton(context),
              if (Responsive.isTablet(context))
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 7),
                  child: elevatedButton(context),
                ),
              if (Responsive.isDesktop(context))
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 4),
                  child: elevatedButton(context),
                ),
            ],
          );
  }

  Widget elevatedButton(BuildContext context) {
    return SizedBox(
      height: height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: miniRadius != null && miniRadius != false
                          ? BorderRadius.circular(defaultRadius - 6)
                          : BorderRadius.circular(defaultRadius))),
              // shadowColor: MaterialStateProperty.all(Colors.transparent),
              backgroundColor: MaterialStateProperty.all(containerColor)),
          onPressed: disableButton != true ? onPressed : null,
          onLongPress: onLongPress,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null && icon != ""
                  ? Row(
                      children: [
                        Icon(icon, color: Colors.white, size: 24),
                        SizedBox(width: 5)
                      ],
                    )
                  : SizedBox(),
              image != null && image != ""
                  ? Row(
                      children: [
                        Image.asset(
                          image!,
                          height: 22,
                          color: Colors.white,
                          alignment: Alignment.bottomLeft,
                        ),
                        SizedBox(width: 5)
                      ],
                    )
                  : SizedBox(),
              text != null && text != ""
                  ? InfiniteText(text!,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: style != null && style != ""
                          ? style
                          : Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(fontSize: 16, color: Colors.white))
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class SplashIcon extends StatelessWidget {
  final double size;
  final VoidCallback? onPressed;
  final Widget icon;
  final String? tooltip;
  final double padding;
  final Color? color;
  final Color? iconColor;

  SplashIcon({
    Key? key,
    this.tooltip,
    this.size = 25,
    this.onPressed,
    required this.icon,
    this.padding = 0,
    this.color,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size + padding,
      width: size + padding,
      child: IconButton(
        splashRadius: onPressed != null && onPressed != ""
            ? size / 2 + padding
            : size / 1.2,
        padding: EdgeInsets.zero,
        color: iconColor,
        tooltip: tooltip,
        icon: ClipOval(
          child: Material(
            color: color != null && color != "" ? color : Colors.transparent,
            child: Padding(
              padding: EdgeInsets.all(padding / 2),
              child: Center(child: icon),
            ),
          ),
        ),
        // icon: Ink(
        //   decoration: ShapeDecoration(color: color, shape: CircleBorder()),
        //   child: Padding(
        //     padding: EdgeInsets.all(padding / 2),
        //     child: Center(child: icon),
        //   ),
        // ),
        iconSize: size,
        onPressed: onPressed != null && onPressed != "" ? onPressed : () {},
      ),
    );
  }
}

class CustomField extends StatelessWidget {
  final String hintText;
  final dynamic suffixChild;
  final dynamic prefixChild;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final EdgeInsetsGeometry margin;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color? fillColor;
  final Color? hoverColor;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final TextInputAction textInputAction;
  bool? obscureText = false;
  bool? readOnly = false;
  bool? autofocus = false;
  InputBorder? enabledBorder;
  InputBorder? focusedBorder;
  CustomField(
      {Key? key,
      required this.hintText,
      this.suffixChild,
      this.prefixChild,
      this.keyboardType,
      this.onTap,
      this.controller,
      this.style,
      this.obscureText,
      this.hintStyle,
      this.readOnly,
      this.autofocus,
      this.focusedBorder,
      this.enabledBorder,
      this.margin = EdgeInsets.zero,
      this.fillColor,
      this.hoverColor,
      this.textInputAction = TextInputAction.next,
      this.horizontalPadding,
      this.verticalPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: TextFormField(
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          textAlignVertical: TextAlignVertical.center,
          style: style ??
              Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 18),
          autofocus: autofocus != null ? true : false,
          readOnly: readOnly != null ? true : false,
          obscureText: obscureText != null ? true : false,
          onTap: onTap,
          controller: controller,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: horizontalPadding != null && horizontalPadding != ""
                    ? horizontalPadding!
                    : defaultPadding,
                vertical: verticalPadding != null && verticalPadding != ""
                    ? verticalPadding!
                    : defaultPadding,
              ),
              filled: true,
              hoverColor: hoverColor ?? Theme.of(context).backgroundColor,
              fillColor: fillColor ?? Theme.of(context).backgroundColor,
              prefixIcon: prefixChild != null
                  ? SizedBox(
                      height: 30, width: 30, child: Center(child: prefixChild))
                  : null,
              hintText: hintText,
              suffixIcon: suffixChild,
              hintStyle: hintStyle ??
                  Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 16),
              labelStyle:
                  Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 16),
              focusedBorder: focusedBorder ??
                  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2)),
              enabledBorder: enabledBorder ??
                  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2)))),
    );

    /* Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding != null && horizontalPadding != ""
            ? horizontalPadding!
            : 10,
        vertical: verticalPadding != null && verticalPadding != ""
            ? verticalPadding!
            : 0,
      ),
      height: 57,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(defaultRadius)),
      child: Center(
        child: TextFormField(
          textInputAction: TextInputAction.next,
          keyboardType: keyboardType,
          autofocus: autofocus != null && autofocus != "" ? true : false,
          readOnly: readOnly != null && readOnly != "" ? true : false,
          obscureText: obscureText != null && obscureText != "" ? true : false,
          cursorColor: Colors.grey,
          onTap: onTap,
          controller: controller,
          style: Theme.of(context).textTheme.headline1,
          decoration: InputDecoration(
              prefixIcon: prefixIcon != null && prefixIcon != ""
                  ? Icon(prefixIcon,
                      color: blueColor,
                      size: prefixSize != null && prefixSize != ""
                          ? prefixSize
                          : 22)
                  : null,
              hintText: hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 15),
              border: InputBorder.none,
              suffixIcon: suffixChild),
        ),
      ),
    ); */
  }
}

class FlutterSwitch extends StatefulWidget {
  /// Creates a material design switch.
  ///
  /// The following arguments are required:
  ///
  /// * [value] determines whether this switch is on or off.
  /// * [onToggle] is called when the user toggles the switch on or off.
  ///

  const FlutterSwitch({
    Key? key,
    required this.value,
    required this.onToggle,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.activeTextColor = Colors.white70,
    this.inactiveTextColor = Colors.white70,
    this.toggleColor = Colors.white,
    this.activeToggleColor,
    this.inactiveToggleColor,
    this.width = 70.0,
    this.height = 35.0,
    this.toggleSize = 25.0,
    this.valueFontSize = 16.0,
    this.borderRadius = 20.0,
    this.padding = 4.0,
    this.showOnOff = false,
    this.activeText,
    this.inactiveText,
    this.activeTextFontWeight,
    this.inactiveTextFontWeight,
    this.switchBorder,
    this.activeSwitchBorder,
    this.inactiveSwitchBorder,
    this.toggleBorder,
    this.activeToggleBorder,
    this.inactiveToggleBorder,
    this.activeIcon,
    this.inactiveIcon,
    this.duration = const Duration(milliseconds: 200),
    this.disabled = false,
  })  : assert(
            (switchBorder == null || activeSwitchBorder == null) &&
                (switchBorder == null || inactiveSwitchBorder == null),
            'Cannot provide switchBorder when an activeSwitchBorder or inactiveSwitchBorder was given\n'
            'To give the switch a border, use "activeSwitchBorder: border" or "inactiveSwitchBorder: border".'),
        assert(
            (toggleBorder == null || activeToggleBorder == null) &&
                (toggleBorder == null || inactiveToggleBorder == null),
            'Cannot provide toggleBorder when an activeToggleBorder or inactiveToggleBorder was given\n'
            'To give the toggle a border, use "activeToggleBorder: color" or "inactiveToggleBorder: color".'),
        super(key: key);

  /// Determines if the switch is on or off.
  ///
  /// This property is required.
  final bool value;

  /// Called when the user toggles the switch.
  ///
  /// This property is required.
  ///
  /// [onToggle] should update the state of the parent [StatefulWidget]
  /// using the [setState] method, so that the parent gets rebuilt; for example:
  ///
  /// ```dart
  /// FlutterSwitch(
  ///   value: _status,
  ///   width: 110,
  ///   borderRadius: 30.0,
  ///   onToggle: (val) {
  ///     setState(() {
  ///        _status = val;
  ///     });
  ///   },
  /// ),
  /// ```
  final ValueChanged<bool> onToggle;

  /// Displays an on or off text.
  ///
  /// InfiniteText value can be override by the [activeText] and
  /// [inactiveText] properties.
  ///
  /// Defaults to 'false' if no value was given.
  final bool showOnOff;

  /// The text to display when the switch is on.
  /// This parameter is only necessary when [showOnOff] property is true.
  ///
  /// Defaults to 'On' if no value was given.
  ///
  /// To change value style, the following properties are available
  ///
  /// [activeTextColor] - The color to use on the text value when the switch is on.
  /// [activeTextFontWeight] - The font weight to use on the text value when the switch is on.
  final String? activeText;

  /// The text to display when the switch is off.
  /// This parameter is only necessary when [showOnOff] property is true.
  ///
  /// Defaults to 'Off' if no value was given.
  ///
  /// To change value style, the following properties are available
  ///
  /// [inactiveTextColor] - The color to use on the text value when the switch is off.
  /// [inactiveTextFontWeight] - The font weight to use on the text value when the switch is off.
  final String? inactiveText;

  /// The color to use on the switch when the switch is on.
  ///
  /// Defaults to [Colors.blue].
  final Color activeColor;

  /// The color to use on the switch when the switch is off.
  ///
  /// Defaults to [Colors.grey].
  final Color inactiveColor;

  /// The color to use on the text value when the switch is on.
  /// This parameter is only necessary when [showOnOff] property is true.
  ///
  /// Defaults to [Colors.white70].
  final Color activeTextColor;

  /// The color to use on the text value when the switch is off.
  /// This parameter is only necessary when [showOnOff] property is true.
  ///
  /// Defaults to [Colors.white70].
  final Color inactiveTextColor;

  /// The font weight to use on the text value when the switch is on.
  /// This parameter is only necessary when [showOnOff] property is true.
  ///
  /// Defaults to [FontWeight.w900].
  final FontWeight? activeTextFontWeight;

  /// The font weight to use on the text value when the switch is off.
  /// This parameter is only necessary when [showOnOff] property is true.
  ///
  /// Defaults to [FontWeight.w900].
  final FontWeight? inactiveTextFontWeight;

  /// The color to use on the toggle of the switch.
  ///
  /// Defaults to [Colors.white].
  ///
  /// If the [activeSwitchBorder] or [inactiveSwitchBorder] is used, this property must be null.
  final Color toggleColor;

  /// The color to use on the toggle of the switch when the given value is true.
  ///
  /// If [inactiveToggleColor] is used and this property is null. the value of
  /// [Colors.white] will be used.
  final Color? activeToggleColor;

  /// The color to use on the toggle of the switch when the given value is false.
  ///
  /// If [activeToggleColor] is used and this property is null. the value of
  /// [Colors.white] will be used.
  final Color? inactiveToggleColor;

  /// The given width of the switch.
  ///
  /// Defaults to a width of 70.0.
  final double width;

  /// The given height of the switch.
  ///
  /// Defaults to a height of 35.0.
  final double height;

  /// The size of the toggle of the switch.
  ///
  /// Defaults to a size of 25.0.
  final double toggleSize;

  /// The font size of the values of the switch.
  /// This parameter is only necessary when [showOnOff] property is true.
  ///
  /// Defaults to a size of 16.0.
  final double valueFontSize;

  /// The border radius of the switch.
  ///
  /// Defaults to the value of 20.0.
  final double borderRadius;

  /// The padding of the switch.
  ///
  /// Defaults to the value of 4.0.
  final double padding;

  /// The border of the switch.
  ///
  /// This property will give a uniform border to both states of the toggle
  ///
  /// If the [activeSwitchBorder] or [inactiveSwitchBorder] is used, this property must be null.
  final BoxBorder? switchBorder;

  /// The border of the switch when the given value is true.
  ///
  /// This property is optional.
  final BoxBorder? activeSwitchBorder;

  /// The border of the switch when the given value is false.
  ///
  /// This property is optional.
  final BoxBorder? inactiveSwitchBorder;

  /// The border of the toggle.
  ///
  /// This property will give a uniform border to both states of the toggle
  ///
  /// If the [activeToggleBorder] or [inactiveToggleBorder] is used, this property must be null.
  final BoxBorder? toggleBorder;

  /// The border of the toggle when the given value is true.
  ///
  /// This property is optional.
  final BoxBorder? activeToggleBorder;

  /// The border of the toggle when the given value is false.
  ///
  /// This property is optional.
  final BoxBorder? inactiveToggleBorder;

  /// The icon inside the toggle when the given value is true.
  /// activeIcon can be an Icon Widget, an Image or Fontawesome Icons.
  ///
  /// This property is optional.
  final Widget? activeIcon;

  /// The icon inside the toggle when the given value is false.
  /// inactiveIcon can be an Icon Widget, an Image or Fontawesome Icons.
  ///
  /// This property is optional.
  final Widget? inactiveIcon;

  /// The duration in milliseconds to change the state of the switch
  ///
  /// Defaults to the value of 200 milliseconds.
  final Duration duration;

  /// Determines whether the switch is disabled.
  ///
  /// Defaults to the value of false.
  final bool disabled;

  @override
  _FlutterSwitchState createState() => _FlutterSwitchState();
}

class _FlutterSwitchState extends State<FlutterSwitch>
    with SingleTickerProviderStateMixin {
  late final Animation _toggleAnimation;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      value: widget.value ? 1.0 : 0.0,
      duration: widget.duration,
    );
    _toggleAnimation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(FlutterSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value == widget.value) return;

    if (widget.value) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    Color toggleColor = Colors.white;
    Color switchColor = Colors.white;
    Border? switchBorder;
    Border? toggleBorder;

    if (widget.value) {
      toggleColor = widget.activeToggleColor ?? widget.toggleColor;
      switchColor = widget.activeColor;
      switchBorder = widget.activeSwitchBorder as Border? ??
          widget.switchBorder as Border?;
      toggleBorder = widget.activeToggleBorder as Border? ??
          widget.toggleBorder as Border?;
    } else {
      toggleColor = widget.inactiveToggleColor ?? widget.toggleColor;
      switchColor = widget.inactiveColor;
      switchBorder = widget.inactiveSwitchBorder as Border? ??
          widget.switchBorder as Border?;
      toggleBorder = widget.inactiveToggleBorder as Border? ??
          widget.toggleBorder as Border?;
    }

    double textSpace = widget.width - widget.toggleSize;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Align(
          child: GestureDetector(
            onTap: () {
              if (!widget.disabled) {
                if (widget.value) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }

                widget.onToggle(!widget.value);
              }
            },
            child: Opacity(
              opacity: widget.disabled ? 0.6 : 1,
              child: Container(
                width: widget.width,
                height: widget.height,
                padding: EdgeInsets.all(widget.padding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  color: switchColor,
                  border: switchBorder,
                ),
                child: Stack(
                  children: <Widget>[
                    AnimatedOpacity(
                      opacity: widget.value ? 1.0 : 0.0,
                      duration: widget.duration,
                      child: Container(
                        width: textSpace,
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        alignment: Alignment.centerLeft,
                        child: _activeText,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: AnimatedOpacity(
                        opacity: !widget.value ? 1.0 : 0.0,
                        duration: widget.duration,
                        child: Container(
                          width: textSpace,
                          padding: EdgeInsets.symmetric(horizontal: 4.0),
                          alignment: Alignment.centerRight,
                          child: _inactiveText,
                        ),
                      ),
                    ),
                    Align(
                      alignment: _toggleAnimation.value,
                      child: Container(
                        width: widget.toggleSize,
                        height: widget.toggleSize,
                        padding: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: toggleColor,
                          border: toggleBorder,
                        ),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Stack(
                            children: [
                              Center(
                                child: AnimatedOpacity(
                                  opacity: widget.value ? 1.0 : 0.0,
                                  duration: widget.duration,
                                  child: widget.activeIcon,
                                ),
                              ),
                              Center(
                                child: AnimatedOpacity(
                                  opacity: !widget.value ? 1.0 : 0.0,
                                  duration: widget.duration,
                                  child: widget.inactiveIcon,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  FontWeight get _activeTextFontWeight =>
      widget.activeTextFontWeight ?? FontWeight.w900;
  FontWeight get _inactiveTextFontWeight =>
      widget.inactiveTextFontWeight ?? FontWeight.w900;

  Widget get _activeText {
    if (widget.showOnOff) {
      return InfiniteText(
        widget.activeText ?? "On",
        style: TextStyle(
          color: widget.activeTextColor,
          fontWeight: _activeTextFontWeight,
          fontSize: widget.valueFontSize,
        ),
      );
    }

    return InfiniteText("");
  }

  Widget get _inactiveText {
    if (widget.showOnOff) {
      return InfiniteText(
        widget.inactiveText ?? "Off",
        style: TextStyle(
          color: widget.inactiveTextColor,
          fontWeight: _inactiveTextFontWeight,
          fontSize: widget.valueFontSize,
        ),
        textAlign: TextAlign.right,
      );
    }

    return InfiniteText("");
  }
}
