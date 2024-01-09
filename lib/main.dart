import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_articles_app/core/theme/color_constant.dart';
import 'package:ny_articles_app/core/utils/bloc_observer.dart';
import 'package:ny_articles_app/presentation/article_screen/di/di_container.dart' as di;
import 'presentation/article_screen/article_page.dart';

Future<void> main() async {

  await di.init();
  /** SimpleBlocObserver oversees Blocs and delegates to BlocDelegate.
      BlocDelegate handles events from all Blocs which are delegated by the BlocSupervisor.
      Can be used to intercept all Bloc events, transitions, and errors.
      It is a great way to handle logging/analytics as well as error handling universally.**/
  Bloc.observer =  SimpleBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.mainColor,
        primaryColorDark: AppColors.secondaryColor,
        scaffoldBackgroundColor: AppColors.white,
      ),
      home: const ArticlePage(),
      routes: routes,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => const ArticlePage(),
        );
      },
    );
  }

  /// we can add all screens here or create a separate router util class
  var routes = <String, WidgetBuilder>{
    ArticlePage.routeName: (BuildContext context) => const ArticlePage(),
  };
}
