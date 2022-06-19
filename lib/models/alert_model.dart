// To parse this JSON data, do
//


class AlertModel {
  AlertModel({
     this.id,
    required this.link,
    required this.titulo,
    required this.fecha,
    required this.imagen,
  });

  int? id;
  String link;
  String titulo;
  String fecha;
  String imagen;

  factory AlertModel.fromJson(Map<String, dynamic> json) => AlertModel(
    id: json["id"],
    link: json["link"],
    titulo: json["titulo"],
    fecha: json["fecha"],
    imagen: json["imagen"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "link": link,
    "titulo": titulo,
    "fecha": fecha,
    "imagen": imagen,
  };
}
