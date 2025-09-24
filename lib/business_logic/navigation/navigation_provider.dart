import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_provider.g.dart';

@riverpod
class NavigationNotifier extends _$NavigationNotifier {
  @override
  int build() => 0; // Default selected index

  void selectSection(int index) {
    state = index;
  }
}
