import '../services/api_service.dart';
import '../repositories/user_repository.dart';
import '../repositories/user_repository_impl.dart';
import '../repositories/post_repository.dart';
import '../repositories/post_repository_impl.dart';

class DependencyInjector {
  // Singleton pattern
  static final DependencyInjector _instance = DependencyInjector._internal();
  factory DependencyInjector() => _instance;
  DependencyInjector._internal();

  late final ApiService apiService;
  late final UserRepository userRepository;
  late final PostRepository postRepository;

  void initialize() {
    apiService = ApiService();
    userRepository = UserRepositoryImpl(apiService: apiService);
    postRepository = PostRepositoryImpl(apiService: apiService);
  }
}