import 'package:flutter/material.dart';

// import 'package:tutorial/src/domain/entities/tutorial/tutorial.dart';
// import 'package:tutorial/src/presentation/views/tutorials/tutorial_details_view.dart';
import 'package:tutorial/src/presentation/views/tutorials/tutorials_view.dart';
// import 'package:tutorial/src/presentation/views/tutorials/saved_tutorials_view.dart';

class AppRoutes {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const TutorialsView());

      // case '/TutorialDetailsView':
      //   return _materialRoute(
      //       TutorialDetailsView(tutorial: settings.arguments as Tutorial));

      // case '/SavedTutorialsView':
      //   return _materialRoute(const SavedTutorialsView());

      default:
        return null;
    }
  }

  // static Route? onGenerateRoutes(RouteSettings settings) {
  //   switch (settings.name) {
  //     case '/':
  //       return _materialRoute(const BreakingNewsView());

  //     case '/ArticleDetailsView':
  //       return _materialRoute(
  //           ArticleDetailsView(article: settings.arguments as Article));

  //     case '/SavedArticlesView':
  //       return _materialRoute(const SavedArticlesView());

  //     default:
  //       return null;
  //   }
  // }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
