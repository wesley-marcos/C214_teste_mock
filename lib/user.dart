class User {

  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;

  // Construtor
  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website
  });

  // Convertendo para Json
  factory User.fromJson(Map<String, dynamic>  json){

    return User(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        phone: json['phone'],
        website: json['website']);
  }
}