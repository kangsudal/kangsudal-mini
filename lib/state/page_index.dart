import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavigatorSelectedIndex = StateProvider<int>((ref) => 0);
final isLogin = StateProvider<bool>((ref) => false);
