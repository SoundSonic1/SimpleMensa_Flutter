import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:simple_mensa/extension/build_context_extension.dart';
import 'package:simple_mensa/ui/widget/simple_app_bar.dart';
import 'package:simple_mensa/ui/widget/simple_drawer.dart';
import 'package:simple_mensa/util/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SimpleAppBar(title: context.loc.about),
        drawer: const SimpleDrawer(
          selectedIndex: 2,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: context.loc.about_content,
                  style: const TextStyle(fontSize: 20.0, color: Colors.black)),
              TextSpan(
                text: context.loc.about_link,
                style:
                    const TextStyle(fontSize: 20.0, color: Colors.deepPurple),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    launchUrl(Uri.parse(Constants.projectUrl));
                  },
              )
            ]),
          ),
        ));
  }
}
