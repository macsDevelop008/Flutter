class Test {
  static final Test _instance = Test._internal();

  factory Test() {
    return _instance;
  }

  Test._internal();

  // Aquí puedes definir tus variables globales
  String test = 'Vacios';
}
