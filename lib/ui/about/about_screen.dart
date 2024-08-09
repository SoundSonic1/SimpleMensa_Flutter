import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:simple_mensa/data/model/version_info.dart';
import 'package:simple_mensa/extension/build_context_extension.dart';
import 'package:simple_mensa/ui/home/home_screen.dart';
import 'package:simple_mensa/ui/theme/simple_colors.dart';
import 'package:simple_mensa/ui/widget/simple_app_bar.dart';
import 'package:simple_mensa/ui/widget/simple_drawer.dart';
import 'package:simple_mensa/util/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
            (route) => false);
      },
      child: Scaffold(
          appBar: SimpleAppBar(title: context.loc.about),
          drawer: const SimpleDrawer(
            page: DrawerPage.about,
          ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: context.loc.about_content,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 20)),
              TextSpan(
                text: context.loc.about_link,
                style: const TextStyle(
                    fontSize: 20.0, color: SimpleColors.accentColor),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    launchUrl(Uri.parse(Constants.projectUrl));
                  },
              )
            ]),
          ),
          const Spacer(),
          Text(
            'Version: ${VersionInfo.packageInfo.version}',
            style: const TextStyle(
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
