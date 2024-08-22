class Pair<E, F> {
  Pair(this.first, this.last);

  final E first;
  final F last;

  @override
  int get hashCode => first.hashCode ^ last.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is! Pair) {
      return false;
    }

    return other.first == first && other.last == last;
  }

  @override
  String toString() => '($first, $last)';
}
