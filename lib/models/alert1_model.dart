class Alert1Model {
  Alert1Model({
    required this.id,
    required this.tipoIncidente,
    required this.longitud,
    required this.latitud,
    required this.fecha,
    required this.hora,
    required this.ciudadanoNombre,
    required this.fechaCreacion,
    required this.datosCiudadano,
    required this.estado,
    required this.tipoOrigen,
    required this.atendido,
    required this.atendidoSerenazgo,
    required this.calificacion,
    required this.calificacionCiudadano,
  });

  int id;
  TipoIncidente tipoIncidente;
  double longitud;
  double latitud;
  String fecha;
  String hora;
  String ciudadanoNombre;
  String fechaCreacion;
  DatosCiudadano datosCiudadano;
  String estado;
  String tipoOrigen;
  bool atendido;
  bool atendidoSerenazgo;
  int calificacion;
  int calificacionCiudadano;


  factory Alert1Model.fromJson(Map<String, dynamic> json) => Alert1Model(
    id: json["id"],
    tipoIncidente: TipoIncidente.fromJson(json["tipoIncidente"]),
    longitud: json["longitud"].toDouble(),
    latitud: json["latitud"].toDouble(),
    fecha: json["fecha"],
    hora: json["hora"],
    ciudadanoNombre: json["ciudadanoNombre"],
    fechaCreacion: json["fechaCreacion"],
    datosCiudadano: DatosCiudadano.fromJson(json["datosCiudadano"]),
    estado: json["estado"],
    tipoOrigen: json["tipoOrigen"],
    atendido: json["atendido"],
    atendidoSerenazgo: json["atendidoSerenazgo"],
    calificacion: json["calificacion"],
    calificacionCiudadano: json["calificacionCiudadano"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tipoIncidente": tipoIncidente.toJson(),
    "longitud": longitud,
    "latitud": latitud,
    "fecha": fecha,
    "hora": hora,
    "ciudadanoNombre": ciudadanoNombre,
    "fechaCreacion": fechaCreacion,
    "datosCiudadano": datosCiudadano.toJson(),
    "estado": estado,
    "tipoOrigen": tipoOrigen,
    "atendido": atendido,
    "atendidoSerenazgo": atendidoSerenazgo,
    "calificacion": calificacion,
    "calificacionCiudadano": calificacionCiudadano,
  };
}

class DatosCiudadano {
  DatosCiudadano({
    required this.nombres,
    required this.dni,
    required this.telefono,
  });

  String nombres;
  String dni;
  String telefono;

  factory DatosCiudadano.fromJson(Map<String, dynamic> json) => DatosCiudadano(
    nombres: json["nombres"],
    dni: json["dni"],
    telefono: json["telefono"],
  );

  Map<String, dynamic> toJson() => {
    "nombres": nombres,
    "dni": dni,
    "telefono": telefono,
  };
}

class TipoIncidente {
  TipoIncidente({
    required this.id,
    required this.value,
    required this.text,
    required this.titulo,
    required this.area,
    required this.nivel,
  });

  int id;
  int value;
  String text;
  String titulo;
  String area;
  String nivel;

  factory TipoIncidente.fromJson(Map<String, dynamic> json) => TipoIncidente(
    id: json["id"],
    value: json["value"],
    text: json["text"],
    titulo: json["titulo"],
    area: json["area"],
    nivel: json["nivel"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "value": value,
    "text": text,
    "titulo": titulo,
    "area": area,
    "nivel": nivel,
  };
}