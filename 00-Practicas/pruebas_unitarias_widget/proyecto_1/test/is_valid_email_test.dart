import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_1/app/presentation/utils/validator.dart';

void main() {
  test('isValidEmailTest', () {
    expect(isValidEmail('text'), false);
    expect(isValidEmail('test@test.com'), true);
  });
}
