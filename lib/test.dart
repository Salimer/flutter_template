import 'package:flutter/material.dart';
import 'package:flutter_template/assets/gen/assets.gen.dart';
import 'package:flutter_template/core/extensions/context_extension.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Assets.images.png.screenShot.image()
      ),
      body: SafeArea(child: Text(context.locale.helloWorld)),
    );
  }
}