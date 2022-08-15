import 'package:provider/provider.dart';

final authServiceProvider = Provider<AuthService>(
    create: (context) => AuthServiceImpl(),
);

abstract class  AuthService {
  void login(String login, String password);
}

class AuthServiceImpl implements AuthService {

  @override
  login(String login, String password) {
    print('Login: $login, Password: $password');
  }
}