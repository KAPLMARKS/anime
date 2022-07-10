import '../auth/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension _AuthViewRef on WidgetRef {
  AuthViewModel get viewModel => read(authViewModelProvider);
}

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: ref.viewModel.formKey,
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

class _Title extends ConsumerWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      ref.viewModel.title,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}

class _LoginField extends ConsumerWidget {
  const _LoginField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      controller: ref.viewModel.loginFieldController,
      validator: ref.viewModel.onValidatePassword,
      decoration: InputDecoration(
        label: Text(ref.viewModel.loginFieldLabel),
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(
          Icons.person,
          color: Colors.black,
        ),
        suffixIcon: IconButton(
          onPressed: ref.viewModel.onClearLoginPressed,
          icon: const Icon(
            Icons.cancel_sharp,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class _PasswordField extends ConsumerWidget {
  const _PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ValueListenableBuilder<bool>(
      valueListenable: ref.viewModel.obscurePassword,
      builder: (context, obscurePassword, ___) => TextFormField(
        controller: ref.viewModel.passwordFieldController,
        obscureText: obscurePassword,
        validator: ref.viewModel.onValidatePassword,
        decoration: InputDecoration(
          label: Text(ref.viewModel.passwordLabel),
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(
            Icons.lock_outline,
            color: Colors.black,
          ),
          suffixIcon: IconButton(
            onPressed: ref.viewModel.onHidePasswordPressed,
            icon: ValueListenableBuilder<IconData>(
              valueListenable: ref.viewModel.hidePasswordIcon,
              builder: (context, icon, ___) => Icon(
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

class _RememberMe extends ConsumerWidget {
  const _RememberMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        ValueListenableBuilder<bool>(
          valueListenable: ref.viewModel.rememberMe,
          builder: (context, rememberMe, ___) => Checkbox(
            value: rememberMe,
            onChanged: ref.viewModel.onRememberMeChanged,
          ),
        ),
        Text(ref.viewModel.rememberMeLabel),
      ],
    );
  }
}

class _ForgetPasswordButton extends ConsumerWidget {
  const _ForgetPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: ref.viewModel.onForgetPasswordPressed,
      child: Text(ref.viewModel.forgetPassportLabel),
    );
  }
}

class _LoginButton extends ConsumerWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.black),
        minimumSize: MaterialStateProperty.all(const Size(0, 50)),
      ),
      onPressed: ref.viewModel.onLoginPressed,
      child: Text(ref.viewModel.title),
    );
  }
}

class _CreateAccountButton extends ConsumerWidget {
  const _CreateAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: ref.viewModel.onCreateAccountPressed,
      child: Text(ref.viewModel.createAccountLabel),
    );
  }
}
