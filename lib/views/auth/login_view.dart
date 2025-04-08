import 'package:flutter/material.dart';
import 'package:ridehailing_passenger/models/auth/login_models.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = LoginViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.checkLoginStatusAndNavigate(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _viewModel.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // App Logo
                    const Icon(
                      Icons.local_taxi,
                      size: 80,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 20),

                    // App Name
                    const Text(
                      'Ride Hailing App',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Email Field
                    TextFormField(
                      controller: _viewModel.emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorText: _viewModel.emailError,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: _viewModel.validateEmail,
                    ),
                    const SizedBox(height: 20),

                    // Password Field
                    ValueListenableBuilder<bool>(
                      valueListenable: _viewModel,
                      builder: (context, isLoading, _) {
                        return TextFormField(
                          controller: _viewModel.passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _viewModel.isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: _viewModel.toggleObscure,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorText: _viewModel.passwordError,
                          ),
                          obscureText: _viewModel.isObscure,
                          validator: _viewModel.validatePassword,
                        );
                      },
                    ),
                    const SizedBox(height: 10),

                    // Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => _viewModel.resetPassword(context),
                        child: const Text('Lupa Password?'),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Login Button
                    ValueListenableBuilder<bool>(
                      valueListenable: _viewModel,
                      builder: (context, isLoading, _) {
                        return ElevatedButton(
                          onPressed: _viewModel.isLoading
                              ? null
                              : () => _viewModel.login(context),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: _viewModel.isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),

                    // Register Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Belum punya akun?'),
                        TextButton(
                          onPressed: () {
                            // Navigate to registration page
                          },
                          child: const Text('Daftar'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.emailController.dispose();
    _viewModel.passwordController.dispose();
    super.dispose();
  }
}
