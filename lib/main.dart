import 'package:flutter/material.dart';
import 'package:pr_5/provider/wallProvider.dart';
import 'package:pr_5/screen/home_page.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MultiProvider(providers: [ChangeNotifierProvider(create: (context) => ApiProvider(),)],child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
