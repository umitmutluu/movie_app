class WidgetNotFoundException<T, R> implements Exception {
  final R data;

  WidgetNotFoundException(this.data);
  @override
  String toString() {
    return 'Class doesnt have this state: $T, $data';
  }
}
