import 'package:fast_block/core/services/dio_provider.dart';
import 'package:fast_block/core/services/local_storage/local_storage.dart';
import 'package:fast_block/feature/auth/presentaion/bloc/auth_bloc.dart';
import 'package:fast_block/feature/auth/presentaion/page/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Ensure this import is present

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioProvider.init();
  await AppLocalStorage.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
