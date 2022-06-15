import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/button_group_model.dart';
import 'package:SnipSnap/widgets/strut_text.dart';

class ThemeButtonGroup extends StatefulWidget {
  const ThemeButtonGroup({
    Key key,
    this.buttonValues,
    this.elevation,
    this.onChange,
    this.buttonPadding,
    this.preselectedValue,
    this.isUnselectable = false,
  }) : super(key: key);

  /// Values of button group.
  final List<ButtonGroupModel> buttonValues;

  /// Button elevation.
  final double elevation;

  /// On value change.
  final Function(ButtonGroupModel) onChange;

  /// Button padding.
  final EdgeInsetsGeometry buttonPadding;

  /// Preselected button value.
  final ButtonGroupModel preselectedValue;

  final bool isUnselectable;

  @override
  _ThemeButtonGroupState createState() => _ThemeButtonGroupState();
}

class _ThemeButtonGroupState extends State<ThemeButtonGroup> {
  ButtonGroupModel _currentSelectedButton;

  @override
  void initState() {
    super.initState();

    if (widget.preselectedValue != null) {
      final int index = widget.buttonValues.indexOf(widget.preselectedValue);
      if (index != -1) {
        _currentSelectedButton = widget.buttonValues[index];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _buildButtonsRow()
            .map((Widget c) => Container(
                  child: c,
                  padding: widget.buttonPadding ??
                      const EdgeInsetsDirectional.only(end: kPaddingS),
                ))
            .toList(),
      ),
    );
  }

  List<Widget> _buildButtonsRow() {
    return widget.buttonValues.map((ButtonGroupModel button) {
      final int index = widget.buttonValues.indexOf(button);
      return Card(
        margin: EdgeInsets.zero,
        elevation: widget.elevation ?? 0,
        color: _currentSelectedButton == widget.buttonValues[index]
            ? kPrimaryColor
            : Theme.of(context).highlightColor,
        shape: OutlineInputBorder(
          borderSide: BorderSide(
            color: _currentSelectedButton == widget.buttonValues[index]
                ? kPrimaryColor
                : Theme.of(context).highlightColor,
            width: 0,
          ),
          borderRadius:
              const BorderRadius.all(Radius.circular(kRoundedButtonRadius)),
        ),
        child: MaterialButton(
            onPressed: () {
              if (widget.onChange != null) {
                widget.onChange(button);
              }
              setState(() {
                if (widget.isUnselectable &&
                    _currentSelectedButton == widget.buttonValues[index]) {
                  _currentSelectedButton = null;
                } else {
                  _currentSelectedButton = widget.buttonValues[index];
                }
              });
            },
            child: Center(
              child: StrutText(
                widget.buttonValues[index].label,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle().copyWith(
                  color: _currentSelectedButton == widget.buttonValues[index]
                      ? kWhite
                      : Theme.of(context).textTheme.button.color,
                  fontWeight:
                      _currentSelectedButton == widget.buttonValues[index]
                          ? FontWeight.bold
                          : FontWeight.w400,
                ),
              ),
            )),
      );
    }).toList();
  }
}
