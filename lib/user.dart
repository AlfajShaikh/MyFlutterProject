class User {
  final String firstName;
  final String lastName;
  final String firstName1;
  final String lastName1;
  final String age;

  const User({
    required this.firstName,
    required this.lastName,
    required this.firstName1,
    required this.lastName1,
    required this.age,
  });

  User copy({
    String? firstName,
    String? lastName,
    String? firstName1,
    String? lastName1,
    String? age,
  }) =>
      User(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        firstName1: firstName1 ?? this.firstName1,
        lastName1: lastName1 ?? this.lastName1,
        age: age ?? this.age,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          age == other.age;

  @override
  int get hashCode => firstName.hashCode ^ lastName.hashCode ^ age.hashCode;
}
