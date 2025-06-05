// ValueNotifer: holds the data
// ValueListenableBuilder: listen to the data changes (no need for setState)

import 'package:flutter/material.dart';

ValueNotifier<int> selectedPageNotifier = ValueNotifier(0);
ValueNotifier<bool> isDarkModeNotifier = ValueNotifier(false);
