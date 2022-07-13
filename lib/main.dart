import 'package:algoritma_test/view/test_screen.dart';
import 'package:algoritma_test/view_model/test_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TestViewModel(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TestScreen(),
      ),
    );
  }
}
