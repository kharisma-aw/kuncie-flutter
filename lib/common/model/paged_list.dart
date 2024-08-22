class PagedList<R, T> {
  PagedList(this.nextPageKey, this.items);

  R nextPageKey;

  List<T> items;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PagedList &&
          runtimeType == other.runtimeType &&
          nextPageKey == other.nextPageKey &&
          items == other.items;

  @override
  int get hashCode => nextPageKey.hashCode ^ items.hashCode;

  void updateItems(PagedList<R, T> newItems) {
    nextPageKey = newItems.nextPageKey;
    items = [...items, ...newItems.items];
  }
}
