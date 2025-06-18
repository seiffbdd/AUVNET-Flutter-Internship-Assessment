import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nawel/config/assets/app_images.dart';
import 'package:nawel/config/routes/app_router.dart';
import 'package:nawel/config/theme/app_colors.dart';
import 'package:nawel/core/widgets/default_elevated_button.dart';
import 'package:nawel/features/auth/presentation/view_models/login_bloc/login_bloc.dart';
import 'package:nawel/features/auth/presentation/widgets/center_screen_loading_indicator.dart';
import 'package:nawel/features/auth/presentation/widgets/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isSuccess) {
          log('success');
          context.goNamed(AppRouter.homePageName);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Welcome to nawel')));
        }
        if (state.errMessage != null) {
          log('error');

          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('${state.errMessage}')));
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Center(
                  child: Form(
                    key: _formKey, // Form key used for validation
                    child: Column(
                      children: [
                        SizedBox(height: screenHeight * 0.11),
                        // App logo
                        Image.asset(
                          AppImages.appLogo,
                          height: screenHeight * 0.41,
                          width:
                              screenHeight *
                              0.41, // Using height value for width ensures a square shape
                        ),
                        // Email input field
                        CustomTextFormField(
                          hintText: 'mail',
                          icon: Icons.mail_outline,
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 12),

                        // Password input field
                        CustomTextFormField(
                          hintText: 'password',
                          icon: Icons.lock_outline,
                          obscureText: true,
                          controller: _passwordController,
                          textInputAction: TextInputAction.done,
                        ),
                        const SizedBox(height: 24),

                        // Login button
                        SizedBox(
                          width: double.infinity,
                          child: DefaultElevatedButton(
                            text: 'Log in',
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                context.read<LoginBloc>().add(
                                  LoginSubmitted(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Navigate to signup
                        TextButton(
                          onPressed: () {
                            context.pushReplacementNamed(
                              AppRouter.signupPageName,
                            );
                          },
                          child: Text(
                            'Create an account',
                            style: GoogleFonts.dmSans(
                              textStyle: Theme.of(
                                context,
                              ).textTheme.displaySmall!.copyWith(
                                color: AppColors.facebookBlue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return CenterScreenLoadingIndicator();
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
