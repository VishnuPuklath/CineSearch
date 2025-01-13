import 'package:cinesearch/features/search/presentation/bloc/search_bloc.dart';
import 'package:cinesearch/init_dependencies.dart';
import 'package:cinesearch/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (_) => serviceLocator<SearchBloc>())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      initialRoute: '/',
      onGenerateRoute: generateRoute,
    );
  }
}
