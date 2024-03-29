import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/domain/services/auth_service.dart';
import '/domain/services/navigation_service.dart';

final authViewModelProvider = Provider<AuthViewModel>(
  create: (context) {
    final authViewModel = AuthViewModelImpl(
      authService: context.read(),
      navigationService: context.read(),
    );
    return authViewModel;
  },
  dispose: (context, authViewModel) => authViewModel.dispose(),
);

abstract class AuthViewModel {
  Key get formKey;

  String get title;

  TextEditingController get loginFieldController;

  String get loginFieldLabel;

  TextEditingController get passwordFieldController;

  ValueListenable<bool> get obscurePassword;

  ValueListenable<IconData> get hidePasswordIcon;

  ValueListenable<bool> get rememberMe;

  String get rememberMeLabel;

  String get forgetPassportLabel;

  String get createAccountLabel;

  String get passwordLabel;

  String? onValidateLogin(String? login);

  void onClearLoginPressed();

  String? onValidatePassword(String? password);

  void onHidePasswordPressed();

  void onRememberMeChanged(bool? value);

  void onLoginPressed();

  void onCreateAccountPressed();

  void onForgetPasswordPressed();

  void dispose();
}

class AuthViewModelImpl implements AuthViewModel {
  AuthViewModelImpl({
    required AuthService authService,
    required NavigationService navigationService,
  })  : _authService = authService,
        _navigationService = navigationService;

  @override
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  final String title = 'LOGIN';

  @override
  final TextEditingController loginFieldController = TextEditingController();

  @override
  final String loginFieldLabel = 'Login';

  @override
  final TextEditingController passwordFieldController = TextEditingController();

  @override
  final ValueNotifier<bool> obscurePassword = ValueNotifier(false);

  @override
  final ValueNotifier<IconData> hidePasswordIcon =
      ValueNotifier(Icons.visibility_off);

  @override
  final ValueNotifier<bool> rememberMe = ValueNotifier(false);

  @override
  final String rememberMeLabel = 'Remember Me';

  @override
  final String forgetPassportLabel = 'FORGET PASSWORD';

  @override
  final String createAccountLabel = 'CREATE ACCOUNT';

  @override
  final String passwordLabel = 'Password';

  final AuthService _authService;

  final NavigationService _navigationService;

  @override
  String? onValidateLogin(String? login) {
    if (login == null || login.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  @override
  void onClearLoginPressed() {
    loginFieldController.text = '';
  }

  @override
  String? onValidatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  @override
  void onHidePasswordPressed() {
    if (obscurePassword.value == true) {
      obscurePassword.value = false;
      hidePasswordIcon.value = Icons.visibility;
    } else {
      obscurePassword.value = true;
      hidePasswordIcon.value = Icons.visibility_off;
    }
  }

  @override
  void onRememberMeChanged(bool? value) {
    if (value == true) {
      rememberMe.value = true;
    } else {
      rememberMe.value = false;
    }
  }

  @override
  void onLoginPressed() {
    if (formKey.currentState!.validate()) {
      _authService.login(
        loginFieldController.text,
        passwordFieldController.text,
      );
      _navigationService.openHome(true);
    }
  }

  @override
  void onCreateAccountPressed() {
    throw UnimplementedError();
  }

  @override
  void onForgetPasswordPressed() {
    throw UnimplementedError();
  }

  @override
  void dispose() {
    rememberMe.dispose();
  }
}
