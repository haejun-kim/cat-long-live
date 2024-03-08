class Cat {
  final String imageUrl;

  Cat({required this.imageUrl});

  Cat copyWith({String? imageUrl}) {
    return Cat(
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
