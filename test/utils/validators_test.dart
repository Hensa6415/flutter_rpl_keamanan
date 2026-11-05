import 'package:flutter_test/flutter_test.dart';
import 'package:rpl_keamanan/utils/validators.dart';

void main() {
  group('Validators Unit Tests', () {
    test('isValidEmail harus return true untuk format email yang benar', () {
      expect(Validators.isValidEmail('mahasiswa@amikom.ac.id'), isTrue);
    });

    test('isValidEmail harus return false untuk format email yang salah', () {
      expect(Validators.isValidEmail('mahasiswa.amikom.ac.id'), isFalse);
    });

    test('validateText harus return error message jika string kosong', () {
      final result = Validators.validateText('', fieldName: 'Nama');
      expect(result, 'Nama tidak boleh kosong');
    });

    test('sanitize harus mengubah/menghilangkan karakter berbahaya', () {
      // Pastikan fungsi sanitize() di Validators mengganti '<' menjadi '&lt;'
      final input = '<script>alert("XSS")</script>';
      final result = Validators.sanitize(input);
      expect(result.contains('<'), isFalse);
    });
  });
}