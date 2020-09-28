class ProductosModels {
  int idInstitucion;
  String descripcion;
  String idDocumento;
  String idProducto;
  String nombreSocio;

  ProductosModels({
    this.idInstitucion,
    this.descripcion,
    this.idDocumento,
    this.idProducto,
    this.nombreSocio,
  });

//El factory es para crear una instancia  de mi modelo de institución
  factory ProductosModels.fromJson(Map<String, dynamic> json) =>
      new ProductosModels(
        idInstitucion: json["idInstitucion"],
        descripcion: json["descripcion"],
        idDocumento: json["idDocumento"],
        idProducto: json["idProducto"],
        nombreSocio: json["nombreSocio"],
      );

//El toJson es retorna un objeto del mismo JSON con la estructura del modelo
  Map<String, dynamic> toJson() => {
        "idInstitucion": idInstitucion,
        "descripcion": descripcion,
        "idDocumento": idDocumento,
        "idProducto": idProducto,
        "nombreSocio": nombreSocio,
      };

  //Lo nuevo
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["idInstitucion"] = idInstitucion;
    map["descripcion"] = descripcion;
    map["idDocumento"] = idDocumento;
    map["idProducto"] = idProducto;
    map["nombreSocio"] = nombreSocio;

    return map;
  }

  ProductosModels.fromMap(dynamic obj) {
    this.idInstitucion = obj["idInstitucion"];
    this.descripcion = obj["descripcion"];
    this.idDocumento = obj["idDocumento"];
    this.idProducto = obj["idProducto"];
    this.nombreSocio = obj["nombreSocio"];
  }
}
