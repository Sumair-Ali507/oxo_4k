import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oxo_4k/config/routes/routes_name.dart';
import 'package:oxo_4k/views/view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.onboardingScreen:
        return MaterialPageRoute(builder: (context) => const OnboardingScreen());
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RoutesName.settingsScreen:
        return MaterialPageRoute(builder: (context) => const SettingsScreen());

        case RoutesName.cameraInfoScreen:
        return MaterialPageRoute(builder: (context) => const CameraInfoScreen());

      case RoutesName.photoInfoScreen:
        return MaterialPageRoute(builder: (context) => const PhotoInfo());

      case RoutesName.sdCardInfoScreen:
        return MaterialPageRoute(builder: (context) => const SdCardInfoScreen());

      case RoutesName.videoSettingsScreen:
        return MaterialPageRoute(builder: (context) => const VideoSettingsScreen());

      case RoutesName.resolutionScreen:
        return MaterialPageRoute(builder: (context) => const ResolutionScreen());

      case RoutesName.fovScreen:
        return MaterialPageRoute(builder: (context) => const FOVScreen());

        default:
        return MaterialPageRoute(
            builder: (context) {
              return const Scaffold(
                body: Center(
                  child: Text('No route defined'),
                ),
              );
            }
        );
    }
  }
}