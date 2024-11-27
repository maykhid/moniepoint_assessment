import 'package:riverpod/riverpod.dart';

class FindHousingProvider extends Notifier<bool> {
  @override
  bool build() => true;

  void toogle() {
    final currentState = state;
    state = !currentState;
  }
}

final findHousingProvider =
    NotifierProvider<FindHousingProvider, bool>(FindHousingProvider.new);
