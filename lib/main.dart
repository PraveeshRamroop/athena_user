import 'package:flutter/material.dart';
import 'package:athena_user/providers/app_state.dart';
import 'package:athena_user/providers/user.dart';
import 'package:athena_user/screens/login.dart';
import 'package:athena_user/screens/splash.dart';
import 'locators/service_locator.dart';
import 'screens/home.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppStateProvider>.value(
        value: AppStateProvider(),
      ),
      ChangeNotifierProvider<UserProvider>.value(
        value: UserProvider.initialize(),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Athena',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserProvider auth = Provider.of<UserProvider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return MyHomePage();
      default:
        return LoginScreen();
    }
  }
}
