import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_1/app/presentation/utils/validator.dart';

void main() {
  test('isValidPasswordTest', () {
    final errors = isValidPassword('text');
    expect(errors.isNotEmpty, true);
  });
}
