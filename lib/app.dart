import 'package:flutter/material.dart';
import 'router.dart';

class NoBrokerApp extends StatelessWidget {
  const NoBrokerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'NoBrokerApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
