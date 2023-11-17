import 'package:flutter/material.dart';
import 'package:ocean_hack/logger/log_printer.dart';
import 'package:ocean_hack/routes/route_name.dart';
import 'package:ocean_hack/screens/auth/login/login_page.dart';
import 'package:ocean_hack/screens/auth/sign_up/sign_up_page.dart';
import 'package:ocean_hack/screens/bottom_nav/bottom_navigation.dart';
import 'package:ocean_hack/screens/result_detail/activities_detail.dart';
import 'package:ocean_hack/screens/result_detail/result_chips.dart';

final _logger = getLogger('EhpRouter');

class EhpRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    _logger.i(
        'generateRoute: name: ${settings.name} arguments: ${settings.arguments}');

    switch (settings.name) {
      case RouteName.signUp:
        return MaterialPageRoute(
          builder: (_) => const SignUpPage(),
        );
      case RouteName.loginPage:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case RouteName.navbar:
        BottomNavigationArgs args = settings.arguments as BottomNavigationArgs;
        return MaterialPageRoute(
          builder: (_) => BottomNavigation(
            args: args,
          ),
        );
      case RouteName.activityDetail:
        ActivityDetailArgs args = settings.arguments as ActivityDetailArgs;
        return MaterialPageRoute(
          builder: (_) =>  ActivitiesDetailPage(
            args: args,
          ),
        );
      case RouteName.resultChips:
        ResultChipsArgs args = settings.arguments as ResultChipsArgs;
        return MaterialPageRoute(
          builder: (_) => ResultChips(
            args: args,
          ),
        );
      // case RouteName.educationalModulePage:
      //   EducationalModulePageArgs args =
      //       settings.arguments as EducationalModulePageArgs;
      //   return MaterialPageRoute(
      //     builder: (_) => EducationalModulePage(
      //       args: args,
      //     ),
      //   );
    }

    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text('No route defined for ${settings.name}'),
        ),
      ),
    );
  }
}
