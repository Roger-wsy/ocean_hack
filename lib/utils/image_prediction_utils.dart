import 'dart:math' as math;

List<double> softmax(List input) {
  final expValues = input.map((x) => math.exp(x)).toList();
  final sumExp = expValues.reduce((a, b) => a + b);
  return expValues.map((x) => x / sumExp).toList();
}

sortProbsIdx(List imagePrediction) {
  Map<String, double> idxProbMap = imagePrediction.fold<Map<String, double>>(
    {},
    (map, prob) {
      map['${imagePrediction.indexOf(prob)}'] = prob;
      return map;
    },
  );
  List<MapEntry<String, double>> sortedEntries = idxProbMap.entries.toList()
    ..sort(
      (a, b) => b.value.compareTo(a.value),
    );

  return Map.fromEntries(sortedEntries);
}
