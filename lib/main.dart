import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled4/res/app_colors.dart';
import 'package:untitled4/style.dart';
import 'package:untitled4/ui/details/product_details.dart';
import 'package:untitled4/ui/homepage/homepage.dart';

void main() {
  runApp(const MyApp());
}

GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, _) {
        return Homepage();
      },
      routes: [
        GoRoute(
          path: 'details',
          builder: (_, _) {
            return ProductDetails();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        extensions: [OffThemeExtension.defaultValues()],
        fontFamily: 'Avenir',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18.0,
            color: AppColors.blue,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: AppColors.blue,
          unselectedItemColor: AppColors.gray2,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
        ),
        navigationBarTheme: const NavigationBarThemeData(
          indicatorColor: AppColors.blue,
        ),
      ),
      routerConfig: _router,
    );
  }
}
