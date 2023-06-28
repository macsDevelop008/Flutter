class Usuario {
  final String nombre;
  final int edad;
  final List<String> profesiones;

  Usuario(
      {required this.nombre, required this.edad, required this.profesiones});

  //Copia del objeto, si no llega el parametro se usa el valor del atributo,
  //si no el atributo se reemplaza por el valor del parametro
  /*Usuario copyWith(
      {String? nombre, int? edad, final List<String>? profesiones}) {
    return Usuario(
        nombre: nombre ?? this.nombre,
        edad: edad ?? this.edad,
        profesiones: profesiones ?? this.profesiones);
  }*/

  Usuario copyWith(
          {String? nombre, int? edad, final List<String>? profesiones}) =>
      Usuario(
          nombre: nombre ?? this.nombre,
          edad: edad ?? this.edad,
          profesiones: profesiones ?? this.profesiones);
}
