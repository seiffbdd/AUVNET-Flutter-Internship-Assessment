import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nawel/config/assets/app_images.dart' show AppImages;
import 'package:nawel/config/routes/app_router.dart';
import 'package:nawel/config/theme/app_colors.dart';
import 'package:nawel/core/widgets/default_elevated_button.dart';
import 'package:nawel/features/auth/presentation/widgets/custom_text_form_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _ensurePasswordController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _ensurePasswordController = TextEditingController();
    _formKey = GlobalKey<FormState>();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _ensurePasswordController.dispose();
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
                  SizedBox(height: screenHeight * 0.05),
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
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 12),

                  CustomTextFormField(
                    hintText: 'password',
                    icon: Icons.lock_outline,
                    obscureText: true,
                    controller: _ensurePasswordController,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field can\'t be empty';
                      } else if (_passwordController.text !=
                          _ensurePasswordController.text) {
                        return 'Password doesn\'t match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: DefaultElevatedButton(
                      text: 'Sign up',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // TODO
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () {
                      context.pushReplacementNamed(AppRouter.loginPageName);
                    },
                    child: Text(
                      'I have an account',
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
    ;
  }
}
