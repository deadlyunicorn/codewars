//* problem: https://www.codewars.com/kata/6329d94bf18e5d0e56bfca77/train/dart

List<int> lru(int memorySlots, List<int> referenceList) {
  final Map<int, List<int>> history = <int, List<int>>{};
  //The map has the following structure:
  // 1: [ 45, 82, 15] -> 45, 82, 15 taskIds have been accessed 1 times.

  final List<int> activeMemory = List<int>.generate(
    memorySlots,
    (int index) => -1,
  );

  for (final int taskId in referenceList) {
    int indexToInsert = activeMemory.indexOf(-1);

    if (history.values.fold<List<int>>(<int>[],
        (List<int> previousValue, List<int> element) {
      previousValue.addAll(element);
      return previousValue;
    }).contains(taskId)) {
      final int currentLevel = history.entries
          .where(
            (MapEntry<int, List<int>> element) =>
                element.value.contains(taskId),
          )
          .first
          .key;
      history[currentLevel]!.remove(taskId);
      if (history[currentLevel]!.isEmpty) {
        history.removeWhere(
          (int key, List<int> value) => key == history.keys.first,
        );
      }
      history.update(
        currentLevel + 1,
        (List<int> value) {
          value.add(taskId);
          return value;
        },
        ifAbsent: () => <int>[taskId],
      );
    } else {
      if (indexToInsert == -1) {
        final List<int>? leastAccessed = history.values.firstOrNull;
        if (leastAccessed == null) break;
        final int itemToRemove = leastAccessed.first;
        leastAccessed.remove(itemToRemove);
        if (leastAccessed.isEmpty) {
          history.removeWhere(
            (int key, List<int> value) => key == history.keys.first,
          );
        }

        indexToInsert = activeMemory.indexOf(itemToRemove);
      }

      history.update(
        1,
        (List<int> value) {
          value.add(taskId);
          return value;
        },
        ifAbsent: () => <int>[taskId],
      );

      activeMemory[indexToInsert] = taskId;
    }
  }

  return activeMemory;
}
