import 'package:flutter/material.dart';
import 'package:flutter_providers_example/providers/favourite_provider.dart';
import 'package:flutter_providers_example/providers/login_auth_provider.dart';
import 'package:flutter_providers_example/providers/theme_change_provider.dart';
import 'package:flutter_providers_example/ui_screens/favourites_list_screen.dart';
import 'package:flutter_providers_example/ui_screens/login_screen.dart';
import 'package:flutter_providers_example/ui_screens/theme_change_screen.dart';
import 'package:flutter_providers_example/ui_screens/value_notify_listner_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
        ChangeNotifierProvider(create: (_) => LoginAuthProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeChangeProvider = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.red,
              appBarTheme: AppBarTheme(backgroundColor: Colors.red, elevation: 2),
              iconTheme: IconThemeData(color: Colors.grey),
            ),
            themeMode: themeChangeProvider.themeMode,
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.purple,
              primaryColor: Colors.purple,
              appBarTheme: AppBarTheme(backgroundColor: Colors.green, elevation: 2),
              iconTheme: IconThemeData(color: Colors.pink),
            ),
            home: LoginScreen(),
          );
        },
      ),
    );
  }
}
