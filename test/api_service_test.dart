import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rpl_keamanan/services/api_service.dart';

/// Class untuk mengizinkan request HTTP asli saat pengujian dijalankan
class TestHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    // Mengaktifkan akses jaringan internet asli untuk pengujian
    HttpOverrides.global = TestHttpOverrides();

    // Muat konfigurasi environment
    dotenv.testLoad(fileInput: '''
BASE_URL=https://jsonplaceholder.typicode.com
API_KEY=dummy_api_key_12345
''');
  });

  test('Pengujian API getUsers harus mengembalikan daftar user', () async {
    final apiService = ApiService();

    try {
      final users = await apiService.getUsers();

      expect(users, isA<List>());
      expect(users.isNotEmpty, true);
      print('✅ API Berhasil! Jumlah user yang didapat: ${users.length}');
    } catch (e) {
      fail('❌ API mengalami error: $e');
    }
  });
}