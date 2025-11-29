class UsuarioApiModel {
  final String id;
  final String name;
  final String email;

  UsuarioApiModel({required this.id, required this.name, required this.email});

  factory UsuarioApiModel.fromJson(Map<String, dynamic> json) {
    return UsuarioApiModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email};
  }
}
