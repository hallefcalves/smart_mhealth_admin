import 'package:flutter/material.dart';

class AlwaysEnabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => true;
}
