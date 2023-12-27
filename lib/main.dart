import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigation_managar/navigation_manager.dart';
import 'network/network_service.dart';
import 'providers/home_provider.dart';
import 'providers/profile_provider.dart';
import 'screens/home_screen.dart';

void main() {
  NetworkService.create();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
            create: (context) => HomeProvider()),
        ChangeNotifierProvider<ProfileProvider>(
            create: (context) => ProfileProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const HomeScreen(),
        onGenerateRoute: NavigationManager.onGenerateRoute,
      ),
    );
  }
}
