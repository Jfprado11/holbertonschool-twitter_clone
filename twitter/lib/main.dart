import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/providers/auth_state.dart';
import 'package:twitter/providers/share_state.dart';
import 'package:twitter/screens/signin_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SharedState()),
        ChangeNotifierProvider(create: (context) => Auth())
      ],
      child: const MaterialApp(
        title: 'Twitter Clone',
        home: SignIn(),
      ),
    );
  }
}
