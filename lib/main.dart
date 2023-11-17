import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:ocean_hack/routes/router.dart';
import 'package:ocean_hack/screens/auth/login/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load();
  // await MongoConnect.connect();
  Logger.level = Level.info;
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
        //MultiBlocProvider(
        //providers: const [
        // BlocProvider<AuthBloc>(
        //   create: (context) => AuthBloc()..add(AuthInitialize()),
        // ),
        // BlocProvider(
        //   create: (context) => ScreenBloc(),
        // ),
        // BlocProvider(
        //   create: (context) => AcpQuestionnaireBloc(),
        // ),
        // BlocProvider(
        //   create: (context) => MedicalInfoBloc(),
        // ),
        //],
        //child:
        MaterialApp(
      title: 'Ocean Hack',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF184E77),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      onGenerateRoute: EhpRouter.generateRoute,
      home: const LoginPage(),
    );
    //);
  }
}
