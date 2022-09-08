import 'package:cat_api/cat_api.dart';
import 'package:cat_only/pages/home/inject/home_inject.dart';
import 'package:cat_only/pages/home/widgets/more_cats_button.dart';
import 'package:dependency/dependency.dart';
import 'package:flutter/material.dart';
import 'package:miados/miados.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeInject.controller();

  final _buttonCrossFadeDuration = 150;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final cats = ModalRoute.of(context)!.settings.arguments as List<CatRaw>;
    controller.setCatList(cats);

    SystemUiOverlayController.home(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return CustomStaggeredGrid(
              crossAxisCount: 2,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              childrenDelegate: SliverChildBuilderDelegate(
                (context, index) {
                  final cat = controller.cats[index];
                  if (controller.isLastCat(index)) {
                    return AnimatedCrossFade(
                      firstChild: MoreCatsButton(
                        key: const ValueKey('moreCatsButton'),
                        onPressed: controller.moreCatsOnPressed,
                      ),
                      secondChild: const CustomLottie(
                          asset: 'assets/lottie/cat_loading.json'),
                      crossFadeState: controller.crossFadeStateFromLoading,
                      duration:
                          Duration(milliseconds: _buttonCrossFadeDuration),
                    );
                  }
                  return FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    fit: BoxFit.cover,
                    image: cat.url,
                  );
                },
                childCount: controller.cats.length,
              ),
            );
          },
        ),
      ),
    );
  }
}
