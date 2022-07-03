import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthServiceImpl());

abstract class  AuthService {
  void login(String login, String password);
}

class AuthServiceImpl implements AuthService {

  @override
  login(String login, String password) {
    print('Login: $login, Password: $password');
  }
}