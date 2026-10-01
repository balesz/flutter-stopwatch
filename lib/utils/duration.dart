extension DurationEx on Duration {
  String get asDigitalText => [
    ...toString()
        .split(RegExp(r'[:\.]')) //
        .skip(1)
        .map((i) => int.parse(i))
        .map((i) => '$i'.padLeft(2, '0'))
        .map((i) => i.substring(0, 2)),
  ].join(':');
}
