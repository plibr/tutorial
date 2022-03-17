import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tutorial/src/config/routes/app_routes.dart';
import 'package:tutorial/src/config/themes/app_theme.dart';
import 'package:tutorial/src/core/utils/constants.dart';
import 'package:tutorial/src/injector.dart';
import 'package:tutorial/src/presentation/blocs/remote_tutorials/remote_tutorials_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteTutorialsBloc>(
      create: (_) => injector()..add(const GetTutorials()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kMaterialAppTitle!,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        theme: AppTheme.light,
      ),
    );
  }
}
