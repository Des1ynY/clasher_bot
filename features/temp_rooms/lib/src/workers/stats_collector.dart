import 'dart:async';

import '../cache/cache.dart';

class StatsCollector {
  final Cache cache;

  StatsCollector({required this.cache}) {
    Timer.periodic(const Duration(seconds: 15), (timer) => cache.statsDao.collectStats());
  }
}
