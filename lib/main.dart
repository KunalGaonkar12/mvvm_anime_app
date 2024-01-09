import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utils/global.dart';
import 'package:flutter_mvvm/utils/provider/provider.dart';
import 'package:flutter_mvvm/utils/routes/routes.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: Providers.getAllProviders(),
        child: MaterialApp(
          debugShowCheckedModeBanner:false,
          title: 'Mvvm',
          onGenerateRoute: Routes.generateRoute,
          initialRoute: RoutesName.splash,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          navigatorKey: navigatorKey,
          key: scaffoldMessengerKey,
        ));
  }
}
