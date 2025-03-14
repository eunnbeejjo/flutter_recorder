import 'package:flutter/cupertino.dart';

class RegisterForm extends StatelessWidget {
  final String title;
  final ListView child;

  const RegisterForm({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                height: 1.3,
                letterSpacing: -0.24,
              ),
            ),
          ),
          child, // ListView > TextField
        ],
      ),
    );
  }
}
