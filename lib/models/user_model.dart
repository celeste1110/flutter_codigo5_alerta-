class UserModel {
  UserModel({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.nombreCompleto,
    required this.dni,
    required this.telefono,
    required this.direccion,
    this.token,
  });

  String nombre;
  String apellido;
  int id;
  String nombreCompleto;
  String dni;
  String telefono;
  String direccion;
  String? token;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    nombre: json["nombre"],
    apellido: json["apellido"],
    nombreCompleto: json["nombreCompleto"],
    dni: json["dni"],
    telefono: json["telefono"],
    direccion: json["direccion"],
    token: json["token"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre": nombre,
    "apellido": apellido,
    "nombreCompleto": nombreCompleto,
    "dni": dni,
    "telefono": telefono,
    "direccion": direccion,
    "token": token ?? "",
  };
}