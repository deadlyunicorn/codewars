//TODO: the function that moves the falling nuts, does not seem to move them

List<int> shake_tree(List<String> tree) {
  int treeWidth = tree[0].length;
  int treeHeight = tree.length - 1;

  List<List<String>> treeAsList = tree.map((el) => el.split('')).toList();

  for (int y = 0; y < treeHeight; y++) {
    print(treeAsList.join('\n'));
    for (int x = 0; x < treeWidth; x++) {
      final String currentItem = treeAsList[y][x];
      if (!currentItem.contains('o')) {
        continue;
      }

      final int currentNutCount =
          int.tryParse(currentItem.replaceAll('o', '')) ?? 1;

      // remove the current nut from the current position
      treeAsList[y][x] = '.';

      int direction;

      {
        final String itemAtBranchBelow = treeAsList[y + 1][x];
        if (itemAtBranchBelow == "/") {
          direction = -1;
        } else if (treeAsList[y + 1][x] == "\\") {
          direction = 1;
        } else {
          // final int nutCountBelow = itemAtBranchBelow.contains('o')
          //     ? int.tryParse(itemAtBranchBelow.replaceAll('o', '')) ?? 1
          //     : 0;
          // treeAsList[y + 1].replaceFirst(RegExp('.'), '${nutCountBelow + 1}o', x);
          treeAsList[y + 1] = replaceWithNutCount(
            branchBelow: treeAsList[y + 1],
            currentHorizontalAxisPosition: x,
            itemAtBranchBelow: itemAtBranchBelow,
            currentNutCount: currentNutCount,
          );
          continue;
        }
      }

      int newHorizontalPosition = x;
      while (true) {
        newHorizontalPosition += direction;
        final String itemAtBranchBelow =
            treeAsList[y + 1][newHorizontalPosition];

        if (itemAtBranchBelow != '\\' && itemAtBranchBelow != '/') {
          treeAsList[y + 1] = replaceWithNutCount(
            branchBelow: treeAsList[y + 1],
            currentHorizontalAxisPosition: newHorizontalPosition,
            itemAtBranchBelow: itemAtBranchBelow,
            currentNutCount: currentNutCount,
          );
          break;
        }
        direction = getNewDirection(
          currentDirection: direction,
          currentItem: itemAtBranchBelow,
        );
        if (direction == 0) {
          break;
        }
      }
    }
  }

  return treeAsList[treeHeight]
      .map(
        (String element) =>
            int.tryParse(
              element.replaceAll('o', ''),
            ) ??
            0,
      )
      .toList();
}

List<String> replaceWithNutCount({
  required String itemAtBranchBelow,
  required List<String> branchBelow,
  required int currentHorizontalAxisPosition,
  required int currentNutCount,
}) {
  final nutCountBelow = itemAtBranchBelow.contains('o')
      ? int.tryParse(itemAtBranchBelow.replaceAll('o', '')) ?? 1
      : 0;

  branchBelow[currentHorizontalAxisPosition] =
      '${nutCountBelow + currentNutCount}o';
  return branchBelow;
}

int getNewDirection({
  required int currentDirection,
  required String currentItem,
}) {
  int directionModifier = 0;

  if (currentItem == "/") {
    directionModifier = -1;
  } else if (currentItem == "\\") {
    directionModifier = 1;
  }

  if (directionModifier != currentDirection) {
    return 0;
  }
  return currentDirection;
}
