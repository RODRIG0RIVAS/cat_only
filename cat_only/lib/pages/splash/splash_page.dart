import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:miados/miados.dart';

import 'strings/splash_strings.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  final int timeToAnimate = 2000;

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(milliseconds: timeToAnimate),
      vsync: this,
    );

    animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.ease,
      ),
    );

    controller.forward();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    SystemUiOverlayController.splash(context);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Center(
            child: CustomLottie(asset: 'assets/lottie/gueito_a_dormire.json'),
          ),
          Align(
            alignment: const Alignment(0, .65),
            child: AnimatedBuilder(
                animation: animation,
                builder: (context, widget) {
                  return AnimatedOpacity(
                    duration: Duration(milliseconds: timeToAnimate),
                    opacity: animation.value,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          SplashStrings.silence,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          SplashStrings.catAtSleepingOfKuduairo,
                          style: Theme.of(context).textTheme.headline5!.apply(
                                fontSizeFactor: 0.6,
                              ),
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(RouteNames.firstLoading);
                          },
                          child: const Text(SplashStrings.continueSneaky),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
