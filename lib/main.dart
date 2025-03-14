import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myth/app_router/app_router.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:myth/services/bloc_observer.dart';
import 'package:myth/services/dependency_injector.dart';
import 'package:myth/services/device_utils.dart';
import 'package:myth/utils/global_data.dart';
import 'package:myth/utils/local_storage.dart';
import 'package:myth/utils/shared_preference_helper.dart';
import 'generated/l10n.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

Future<void> main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  GlobalData.selectedLanguage =
  await SharedPreferenceHelper.getCustomerLanguage();
  await LocalStorage.initHive();
  setupServiceLocator();
  runApp(ProviderScope(child: Phoenix(child: MyApp())));
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final appRouter =  Routes();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {
        return AppDimensions(
          height: constraints.maxHeight,
          child: MaterialApp(
            showSemanticsDebugger: false,
            locale: Locale(GlobalData.selectedLanguage??GlobalData.preferedLanguage),
            localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                  ],
            supportedLocales: S.delegate.supportedLocales,
                  
            title: 'Myth Clinic',
            theme: ThemeData(
              
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            onGenerateRoute: appRouter.generatedRoute ,
            initialRoute: Routes.initRoute,//SplashPage(),
          ),
        );
      }
    );
  }
}
