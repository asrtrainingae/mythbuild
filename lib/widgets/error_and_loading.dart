import 'package:flutter/material.dart';

class ShowError extends StatelessWidget {
  String errorMessage;
   ShowError({required this.errorMessage,super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(errorMessage),
    );
  }
}

class Loading extends StatelessWidget {
   Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator(),
    );
  }
}