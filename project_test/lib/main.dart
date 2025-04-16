import 'package:flutter/material.dart';
import 'package:project_test/common/wrap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Danh sách thuật toán'),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: const WrapDemo(),
      )),
    );
  }
}
