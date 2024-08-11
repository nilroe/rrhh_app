enum UserRole { Normal, Gerente, Administrador }

class User {
  String id;
  String email;
  String name;
  UserRole role;
  String companyId;
  String? gerenteId;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    required this.companyId,
    this.gerenteId,
  });
}
