import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/utils/form_utils.dart';
import 'package:SnipSnap/widgets/list_item.dart';
import 'package:SnipSnap/widgets/theme_button.dart';
import 'package:SnipSnap/widgets/theme_text_input.dart';
import 'package:SnipSnap/utils/text_style.dart';

/// A single item for [Picker] dialog box.
@immutable
class PickerItem<T> extends Equatable {
  const PickerItem({
    this.precedingIcon,
    this.text,
    this.value,
  });

  final IconData precedingIcon;
  final String text;
  final T value;

  @override
  List<Object> get props => <T>[value];
}

/// Generic purpose picker style dialog box.
///
/// Params:
///   * isMultiselection: bool (false)
///   * items: List<PickerItem<T>>
///   * itemsSelected: List<PickerItem<T>>
///   * showSearchBox: bool
class Picker extends StatefulWidget {
  const Picker({Key key, this.params}) : super(key: key);

  final Map<String, dynamic> params;

  @override
  _PickerState createState() {
    return _PickerState();
  }
}

class _PickerState extends State<Picker> {
  final TextEditingController _textSearchController = TextEditingController();

  bool _loading = false;
  bool _isMultiselection = false;
  bool _showSearchBox = false;

  List<PickerItem<dynamic>> _items;
  List<PickerItem<dynamic>> _itemsBackup;
  List<PickerItem<dynamic>> _itemsSelected;

  @override
  void initState() {
    _isMultiselection = widget.params['isMultiselection'] as bool ?? false;
    _items = widget.params['items'] as List<PickerItem<dynamic>> ??
        <PickerItem<dynamic>>[];
    _itemsBackup = _items;
    _itemsSelected =
        widget.params['itemsSelected'] as List<PickerItem<dynamic>> ??
            <PickerItem<dynamic>>[];
    _showSearchBox = widget.params['showSearchBox'] as bool ?? false;

    super.initState();
  }

  /// On filter item.
  void _onFilter(String text) {
    if (text.isEmpty) {
      setState(() => _items = _itemsBackup);
      return;
    }
    setState(() {
      _items = _items
          .where((PickerItem<dynamic> item) =>
              item.text.toUpperCase().contains(text.toUpperCase()))
          .toList();
    });
  }

  /// On select item.
  void _onSelect(PickerItem<dynamic> item) {
    if (_itemsSelected.contains(item)) {
      _itemsSelected.remove(item);
    } else {
      if (!_isMultiselection) {
        _itemsSelected.clear();
      }
      _itemsSelected.add(item);
    }

    setState(() => _itemsSelected = _itemsSelected);

    if (!_isMultiselection) {
      _onSubmit();
    }
  }

  Future<void> _onSubmit() async {
    FormUtils.hideKeyboard(context);

    setState(() => _loading = true);

    if (_itemsSelected.isNotEmpty) {
      if (_isMultiselection) {
        Navigator.pop(
            context,
            _itemsSelected
                .map<dynamic>(
                    (PickerItem<dynamic> item) => item.value as dynamic)
                .toList());
      } else {
        Navigator.pop(context, _itemsSelected.first.value);
      }
    } else {
      Navigator.pop(context, null);
    }
  }

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingM),
      itemBuilder: (BuildContext context, int index) {
        final PickerItem<dynamic> item = _items[index];
        final Widget trailing = _itemsSelected.contains(item)
            ? Icon(Icons.check, color: Theme.of(context).accentColor)
            : null;
        return ListItem(
          title: item.text,
          titleTextStyle: _itemsSelected.contains(item)
              ? Theme.of(context)
                  .textTheme
                  .subtitle1
                  .fs18
                  .copyWith(color: Theme.of(context).accentColor)
              : null,
          leading: item.precedingIcon != null
              ? Icon(item.precedingIcon,
                  color: trailing != null
                      ? Theme.of(context).accentColor
                      : Theme.of(context).hintColor)
              : null,
          trailing: trailing,
          onPressed: () => _onSelect(item),
        );
      },
      itemCount: _items.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.params['title'] as String ?? ''),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            if (_showSearchBox)
              Padding(
                padding: const EdgeInsets.only(
                  left: kPaddingM,
                  right: kPaddingM,
                  top: kPaddingS,
                  bottom: kPaddingS,
                ),
                child: ThemeTextInput(
                  hintText: L10n.of(context).pickerPlaceholderSearch,
                  icon: const Icon(Icons.clear),
                  controller: _textSearchController,
                  onChanged: _onFilter,
                  onSubmitted: _onFilter,
                  onTapIcon: () async {
                    await Future<dynamic>.delayed(
                        const Duration(milliseconds: 100));
                    _textSearchController.clear();
                    _onFilter('');
                  },
                ),
              )
            else
              const Padding(padding: EdgeInsets.only(top: 15)),
            Expanded(child: _buildList()),
            if (_isMultiselection)
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kPaddingM, vertical: kPaddingS),
                child: ThemeButton(
                  onPressed: _onSubmit,
                  text: L10n.of(context).pickerBtnSelect,
                  showLoading: _loading,
                  disableTouchWhenLoading: true,
                ),
              )
            else
              Row(),
          ],
        ),
      ),
    );
  }
}
