import 'package:flutter/material.dart';
import 'package:on_mall/features/authentication/presentation/views/functions/builde_auth_header.dart';
import 'package:on_mall/features/authentication/presentation/views/widgets/register_form.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            buildAuthHeader(context),
            const RegisterForm(),
          ],
        ),
      ),
    );
  }
}
