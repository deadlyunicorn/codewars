int evaporator(double contentUnits, int percentageOfContentLossPerDay,
    int unusableContentUnitsThresholdPercentage,) {
  int i = 0;
  final double thresholdInUnits = contentUnits * unusableContentUnitsThresholdPercentage * 0.01;
  while (contentUnits >= thresholdInUnits) {
    contentUnits = contentUnits - percentageOfContentLossPerDay * 0.01 * contentUnits;
    i++;
  }

  return i;
}
