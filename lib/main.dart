import 'package:doerr/auth_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'injection_container.dart' as di;
import 'shared/presentation/theme/theme.dart';
import 'src/onboarding/presentation/interface/screens/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: const AuthWrapper(),
    );
  }
}
