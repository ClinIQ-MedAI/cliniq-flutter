import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final resendTimerProvider =
    NotifierProvider.autoDispose<ResendTimerNotifier, int>(
      ResendTimerNotifier.new,
    );

class ResendTimerNotifier extends Notifier<int> {
  Timer? _timer;

  @override
  int build() {
    ref.onDispose(() {
      _timer?.cancel();
    });

    return 0;
  }

  bool get canResend => state == 0;

  void start(int seconds) {
    _timer?.cancel();
    state = seconds;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state <= 1) {
        timer.cancel();
        state = 0;
      } else {
        state--;
      }
    });
  }
}
