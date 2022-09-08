import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:miados/miados.dart';

import 'inject/first_loading_inject.dart';
import 'strings/first_loading_strings.dart';
import 'widgets/cat_paws.dart';

class FirstLoadingPage extends StatefulWidget {
  const FirstLoadingPage({super.key});

  @override
  State<FirstLoadingPage> createState() => _FirstLoadingPageState();
}

class _FirstLoadingPageState extends State<FirstLoadingPage> {
  final controller = FirstLoadingInject.controller();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    SystemUiOverlayController.firstLoading(context);
    start(context);
  }

  Future<void> start(BuildContext context) async {
    await controller.getCatePageLimit();

    if (controller.hasError) {
      await Future.delayed(const Duration(seconds: 3));

      if (!mounted) return;
      await start(context);
    } else {
      if (!mounted) return;
      Navigator.of(context)
          .pushReplacementNamed(RouteNames.home, arguments: controller.catList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Stack(
        children: [
          const Center(
            child: CustomLottie(asset: 'assets/lottie/cat_window.json'),
          ),
          Align(
            alignment: const Alignment(0, .5),
            child: Text(
              FirstLoadingStrings.callingAllCats,
              style: Theme.of(context).textTheme.headline5!.apply(
                    fontSizeFactor: 0.5,
                  ),
            ),
          ),
          const CatPaws(),
        ],
      ),
    );
  }
}
