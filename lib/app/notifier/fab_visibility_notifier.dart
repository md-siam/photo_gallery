import 'package:flutter/material.dart';

class FABVisibilityState {
  final ValueNotifier<bool> isFabVisible = ValueNotifier<bool>(false);
}

FABVisibilityState fabVisibleState = FABVisibilityState();
