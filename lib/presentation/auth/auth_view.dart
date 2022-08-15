import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/domain/services/auth_service.dart';
import '/presentation/auth/auth_view_model.dart';

extension _AuthViewContext on BuildContext {
  AuthViewModel get viewModel => read();
}

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [authServiceProvider, authViewModelProvider,],
      child: const Scaffold(
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.viewModel.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 64),
            const _Title(),
            const SizedBox(height: 64),
            const _LoginField(),
            const SizedBox(height: 8),
            const _PasswordField(),
            Row(
              children: const [
                _RememberMe(),
                Spacer(),
                _ForgetPasswordButton(),
              ],
            ),
            const SizedBox(height: 64),
            const _LoginButton(),
            const SizedBox(height: 8),
            const _CreateAccountButton(),
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      context.viewModel.title,
      style: Theme
          .of(context)
          .textTheme
          .headlineLarge,
    );
  }
}

class _LoginField extends StatelessWidget {
  const _LoginField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: context.viewModel.loginFieldController,
      validator: context.viewModel.onValidatePassword,
      decoration: InputDecoration(
        label: Text(context.viewModel.loginFieldLabel),
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(
          Icons.person,
          color: Colors.black,
        ),
        suffixIcon: IconButton(
          onPressed: context.viewModel.onClearLoginPressed,
          icon: const Icon(
            Icons.cancel_sharp,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: context.viewModel.obscurePassword,
      builder: (context, obscurePassword, ___) =>
          TextFormField(
            controller: context.viewModel.passwordFieldController,
            obscureText: obscurePassword,
            validator: context.viewModel.onValidatePassword,
            decoration: InputDecoration(
              label: Text(context.viewModel.passwordLabel),
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(
                Icons.lock_outline,
                color: Colors.black,
              ),
              suffixIcon: IconButton(
                onPressed: context.viewModel.onHidePasswordPressed,
                icon: ValueListenableBuilder<IconData>(
                  valueListenable: context.viewModel.hidePasswordIcon,
                  builder: (context, icon, ___) =>
                      Icon(
                        icon,
                        color: Colors.black,
                      ),
                ),
              ),
            ),
          ),
    );
  }
}

class _RememberMe extends StatelessWidget {
  const _RememberMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder<bool>(
          valueListenable: context.viewModel.rememberMe,
          builder: (context, rememberMe, ___) =>
              Checkbox(
                value: rememberMe,
                onChanged: context.viewModel.onRememberMeChanged,
              ),
        ),
        Text(context.viewModel.rememberMeLabel),
      ],
    );
  }
}

class _ForgetPasswordButton extends StatelessWidget {
  const _ForgetPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: context.viewModel.onForgetPasswordPressed,
      child: Text(context.viewModel.forgetPassportLabel),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.black),
        minimumSize: MaterialStateProperty.all(const Size(0, 50)),
      ),
      onPressed: context.viewModel.onLoginPressed,
      child: Text(context.viewModel.title),
    );
  }
}

class _CreateAccountButton extends StatelessWidget {
  const _CreateAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: context.viewModel.onCreateAccountPressed,
      child: Text(context.viewModel.createAccountLabel),
    );
  }
}
