import '../models/user.dart';

/// Abstraksi repository untuk mengelola data pengguna.
abstract class UserRepository {
  /// Mengambil daftar semua pengguna.
  Future<List<User>> getUsers();

  /// Mengambil pengguna berdasarkan [id].
  Future<User> getUserById(int id);
}