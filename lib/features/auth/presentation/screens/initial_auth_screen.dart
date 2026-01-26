import 'package:flutter/material.dart';
import 'package:cliniq/features/auth/presentation/widgets/initial_auth_body.dart';

class InitialAuthScreen extends StatelessWidget {
  const InitialAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: const Center(child: InitialAuthBody()),
              ),
            );
          },
        ),
      ),
    );
  }
}
