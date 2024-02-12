import 'package:clean_architecture_app_2/common/app_route.dart';
import 'package:clean_architecture_app_2/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:clean_architecture_app_2/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<LoginCubit>()),
      ],
      child: const MaterialApp(
        initialRoute: AppRoute.login,
        onGenerateRoute: AppRoute.onGenerateRoute,
      ),
    );
  }
}
