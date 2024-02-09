import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flavors/utils/assets_utils.dart';
import 'package:flutter_flavors/utils/white_label_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Hello, World!',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 16),
            Image.asset(
              AssetsUtils.getLogoPath(),
            ),
          ],
        ),
      ),
    );
  }
}
