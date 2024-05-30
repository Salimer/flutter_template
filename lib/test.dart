import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_template/assets/gen/assets.gen.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Assets.images.png.screenShot.image()
      ),
      body: SafeArea(child: Text(AppLocalizations.of(context).helloWorld)),
    );
  }
}