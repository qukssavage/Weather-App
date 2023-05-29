import 'package:flutter/material.dart';

class ErroPage extends StatelessWidget {
  const ErroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: const Text('Страница не найдена'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Ошибка 404',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 26,
            color: Colors.brown[700],
          ),
        ),
      ),
    );
  }
}
