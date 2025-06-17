import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nawel/config/assets/app_images.dart';
import 'package:nawel/config/theme/app_colors.dart';
import 'package:nawel/core/widgets/default_elevated_button.dart';
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

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.11),
                  // App logo centered in the layout
                  Image.asset(
                    AppImages.appLogo,
                    height: screenHeight * 0.41,
                    width:
                        screenHeight *
                        0.41, // Using height value for width ensures a square shape
                  ),

                  SizedBox(
                    child: CustomTextFormField(
                      hintText: 'mail',
                      icon: Icons.mail_outline,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomTextFormField(
                    hintText: 'password',
                    icon: Icons.lock_outline,
                    obscureText: true,
                    controller: _passwordController,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: DefaultElevatedButton(
                      text: 'Log in',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // TODO
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      // TODO
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
    );
  }
}
