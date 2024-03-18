class Cat {
  Cat({
    this.breed,
    this.weight,
    this.catImage,
    required this.id,
    required this.userId,
    required this.name,
    required this.birthday,
    required this.gender,
  });

  final String id;
  final String userId;
  final String name;
  final DateTime birthday;
  final String gender;
  final String? breed;
  final double? weight;
  final String? catImage;

  Cat copyWith({
    required String id,
    required String userId,
    required String name,
    required DateTime birthday,
    required String gender,
    String? breed,
    double? weight,
    String? catImage,
  }) {
    return Cat(
      id: id,
      userId: userId,
      name: name,
      birthday: birthday,
      gender: gender,
      breed: breed ?? this.breed,
      weight: weight ?? this.weight,
      catImage: catImage ?? this.catImage,
    );
  }
}
