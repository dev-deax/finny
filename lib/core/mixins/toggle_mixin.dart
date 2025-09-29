mixin ToggleMixin<T> {
  List<T> toggleItem(
    List<T> currentList,
    T item,
    bool Function(T, T) isEqual,
  ) {
    final newList = List<T>.from(currentList);

    if (newList.any((existingItem) => isEqual(existingItem, item))) {
      newList.removeWhere((existingItem) => isEqual(existingItem, item));
    } else {
      newList.add(item);
    }

    return newList;
  }

  List<T> toggleItemById(List<T> currentList, T item) {
    return toggleItem(currentList, item, (a, b) => a == b);
  }
}
