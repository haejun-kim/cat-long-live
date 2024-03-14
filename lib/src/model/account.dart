class Account {
  final String id;
  final String email;

  const Account({
    required this.id,
    required this.email,
  });

  Account copyWith({
    String? id,
    String? email,
  }) {
    return Account(
      id: id ?? this.id,
      email: email ?? this.email,
    );
  }
}
