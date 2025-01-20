import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final connectivityStreamProvider = StreamProvider<ConnectivityResult?>((ref) {
  final connectivity = Connectivity();
  return connectivity.onConnectivityChanged
      .map((list) => list.isNotEmpty ? list.first : null);
});

final modalVisibleProvider = StateProvider<bool>((ref) => false);
