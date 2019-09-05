class User {
  final int id;
  final String name;

  User({
    this.id,
    this.name,
  });

  factory User.fromJSON(Map<String, dynamic> json) => User(
    id: json['id'] as int,
    name: json['name'] as String,
  );
}

class UserDetails {
  final String name;
  final String email;
  final String website;

  UserDetails({
    this.name,
    this.email,
    this.website,
  });

  factory UserDetails.fromJSON(Map<String, dynamic> json) => UserDetails(
    name: json['name'] as String,
    email: json['email'] as String,
    website: json['website'] as String,
  );
}
