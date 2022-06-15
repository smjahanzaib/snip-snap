import 'package:flutter/material.dart';
import 'package:SnipSnap/generated/l10n.dart';

/// General purpose empty screen.
class EmptyScreen extends StatefulWidget {
  const EmptyScreen({Key key}) : super(key: key);

  @override
  _EmptyScreenState createState() => _EmptyScreenState();
}

class _EmptyScreenState extends State<EmptyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(L10n.of(context).emptyTitle),
      ),
      body: Container(),
    );
  }
}
