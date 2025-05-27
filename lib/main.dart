import 'package:flutter/material.dart';
import 'package:untitled4/res/app_colors.dart';
import 'package:untitled4/ui/details/product_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Avenir',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18.0,
            color: AppColors.blue,
          ),
        ),
      ),
      home: ProductDetails(),
    );
  }
}

class StackDemo extends StatelessWidget {
  const StackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            PositionedDirectional(
              top: 10.0,
              start: 10.0,
              end: 10.0,
              child: Container(width: 200, height: 200, color: Colors.red),
            ),
            Container(width: 150, height: 150, color: Colors.yellow),
          ],
        ),
      ),
    );
  }
}
