class Health {
  final List<String> healthCategoryItem;
  // final String? hospital;
  // final String? title;
  // final String? content;
  // final DateTime? dateTime;

  const Health({
    required this.healthCategoryItem,
    // this.hospital,
    // this.title,
    // this.content,
    // this.dateTime,
  });

  Health copyWith({
    List<String>? healthCategoryItem,
    // String? hospital,
    // String? title,
    // String? content,
    // DateTime? dateTime,
  }) {
    return Health(
      healthCategoryItem: healthCategoryItem ?? this.healthCategoryItem,
      // hospital: hospital ?? this.hospital,
      // title: title ?? this.title,
      // content: content ?? this.content,
      // dateTime: dateTime ?? this.dateTime,
    );
  }
}
