import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optal_mobile/src/core/widget/optal_app.dart';

void main() => runZonedGuarded(
  () {
    late final WidgetsBinding binding;
    final stopwatch = Stopwatch()..start();
    try {
      binding = WidgetsFlutterBinding.ensureInitialized()..deferFirstFrame();

      runApp(ProviderScope(child: OptalApp()));
    } on Object catch (error, stackTrace) {
      Error.safeToString(error);
      stackTrace.toString();
      rethrow;
    } finally {
      stopwatch.stop();
      binding.addPostFrameCallback((_) {
        // Closes splash screen, and show the app layout.
        binding.allowFirstFrame();
        //final context = binding.renderViewElement;
      });
    }
  },
  (error, stackTrace) {
    debugPrintStack(stackTrace: stackTrace, label: '$error');
  },
);
