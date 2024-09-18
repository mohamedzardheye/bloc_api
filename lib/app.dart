import 'package:bloc_api/features/login/login.dart';
import 'package:bloc_api/routes/generated_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import 'navigation_menu.dart';
import 'utils/constants/text_strings.dart';
import 'utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator().generateRoute,
      // initialBinding: GeneralBindings(),
      //home: const LoginScreen(),
      // child: Text('Awesome Project Structure is setup and running. \n Happy T Coding 🎊', textAlign: TextAlign.center,),
    );
  }
}
