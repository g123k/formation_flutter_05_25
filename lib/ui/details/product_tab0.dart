import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled4/model/product.dart';
import 'package:untitled4/res/app_colors.dart';
import 'package:untitled4/res/app_icons.dart';
import 'package:untitled4/style.dart';

class ProductTab0 extends StatefulWidget {
  static const double kImageHeight = 300.0;

  const ProductTab0({super.key});

  @override
  State<ProductTab0> createState() => _ProductTab0State();
}

double _scrollProgress(BuildContext context) {
  ScrollController? controller = PrimaryScrollController.of(context);
  return !controller.hasClients
      ? 0
      : (controller.position.pixels / ProductTab0.kImageHeight).clamp(0, 1);
}

class _ProductTab0State extends State<ProductTab0> {
  double _currentScrollProgress = 0.0;

  // Quand on scroll, on redraw pour changer la couleur de l'image
  void _onScroll() {
    if (_currentScrollProgress != _scrollProgress(context)) {
      setState(() {
        _currentScrollProgress = _scrollProgress(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = PrimaryScrollController.of(
      context,
    );

    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          _onScroll();
          return false;
        },
        child: SizedBox.expand(
          child: Stack(
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?q=80&w=1310&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                width: double.infinity,
                height: ProductTab0.kImageHeight,
                cacheHeight: (ProductTab0.kImageHeight * 3).toInt(),
                fit: BoxFit.cover,
                color: Colors.black.withValues(alpha: _currentScrollProgress),
                colorBlendMode: BlendMode.srcATop,
              ),
              Positioned.fill(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: const _Body(),
                ),
              ),
              PositionedDirectional(
                child: _HeaderIcon(
                  icon: Icons.adaptive.arrow_back,
                  tooltip: MaterialLocalizations.of(context).backButtonTooltip,
                  onPressed: () => GoRouter.of(context).pop(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderIcon extends StatefulWidget {
  final IconData icon;
  final String? tooltip;
  final VoidCallback? onPressed;

  const _HeaderIcon({
    required this.icon,
    // ignore: unused_element
    this.tooltip,
    // ignore: unused_element
    this.onPressed,
  });

  @override
  State<_HeaderIcon> createState() => _HeaderIconState();
}

class _HeaderIconState extends State<_HeaderIcon> {
  double _opacity = 0.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    PrimaryScrollController.of(context).addListener(_onScroll);
  }

  void _onScroll() {
    double newOpacity = _scrollProgress(context);

    if (newOpacity != _opacity) {
      setState(() {
        _opacity = newOpacity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsetsDirectional.all(8.0),
        child: Material(
          type: MaterialType.transparency,
          child: Tooltip(
            message: widget.tooltip,
            child: InkWell(
              onTap: widget.onPressed ?? () {},
              customBorder: const CircleBorder(),
              child: Ink(
                padding: const EdgeInsetsDirectional.only(
                  start: 18.0,
                  end: 12.0,
                  top: 15.0,
                  bottom: 15.0,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: _opacity),
                ),
                child: Icon(
                  widget.icon,
                  color: Color.lerp(Colors.white, Colors.black, _opacity),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  static const double _kHorizontalPadding = 20.0;
  static const double _kVerticalPadding = 30.0;

  const _Body();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadiusDirectional.only(
          topStart: Radius.circular(16.0),
          topEnd: Radius.circular(16.0),
        ),
      ),
      margin: EdgeInsetsDirectional.only(top: ProductTab0.kImageHeight - 16.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: _kHorizontalPadding,
              vertical: _kVerticalPadding,
            ),
            child: _Header(),
          ),
          _Scores(),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: _kHorizontalPadding,
              vertical: _kVerticalPadding,
            ),
            child: _Info(),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Petits pois et carottes', style: context.theme.title1),
        const SizedBox(height: 3.0),
        Text('Cassegrain', style: context.theme.title2),
        const SizedBox(height: 8.0),
      ],
    );
  }
}

class _Scores extends StatelessWidget {
  static const double _horizontalPadding = _Body._kHorizontalPadding;
  static const double _verticalPadding = 18.0;

  const _Scores();

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: context.theme.altText,
      child: Container(
        color: AppColors.gray1,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: _verticalPadding,
                horizontal: _horizontalPadding,
              ),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 44,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 5.0),
                        child: _Nutriscore(nutriscore: ProductNutriscore.A),
                      ),
                    ),
                    VerticalDivider(),
                    Expanded(
                      flex: 66,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(start: 25.0),
                        child: _NovaGroup(novaScore: ProductNovaScore.group1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 1.0),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: _verticalPadding,
                horizontal: _horizontalPadding,
              ),
              child: _GreenScore(greenScore: ProductGreenScore.A),
            ),
          ],
        ),
      ),
    );
  }
}

class _Nutriscore extends StatelessWidget {
  final ProductNutriscore nutriscore;

  const _Nutriscore({required this.nutriscore});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nutri-Score', style: context.theme.title3),
        const SizedBox(height: 5.0),
        Image.asset(_findAssetName(), width: 100.0),
      ],
    );
  }

  String _findAssetName() {
    return switch (nutriscore) {
      ProductNutriscore.A => 'res/drawables/nutriscore_a.png',
      ProductNutriscore.B => 'res/drawables/nutriscore_b.png',
      ProductNutriscore.C => 'res/drawables/nutriscore_c.png',
      ProductNutriscore.D => 'res/drawables/nutriscore_d.png',
      ProductNutriscore.E => 'res/drawables/nutriscore_e.png',
      ProductNutriscore.unknown => 'TODO',
    };
  }
}

class _NovaGroup extends StatelessWidget {
  final ProductNovaScore novaScore;

  const _NovaGroup({required this.novaScore});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Groupe Nova', style: context.theme.title3),
        const SizedBox(height: 5.0),
        Text(_findLabel(), style: const TextStyle(color: AppColors.gray2)),
      ],
    );
  }

  String _findLabel() {
    return switch (novaScore) {
      ProductNovaScore.group1 =>
        'Aliments non transformés ou transformés minimalement',
      ProductNovaScore.group2 => 'Ingrédients culinaires transformés',
      ProductNovaScore.group3 => 'Aliments transformés',
      ProductNovaScore.group4 =>
        'Produits alimentaires et boissons ultra-transformés',
      ProductNovaScore.unknown => 'Score non calculé',
    };
  }
}

class _GreenScore extends StatelessWidget {
  final ProductGreenScore greenScore;

  const _GreenScore({required this.greenScore});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Green-Score', style: context.theme.title3),
        const SizedBox(height: 5.0),
        Row(
          children: [
            Icon(_findIcon(), color: _findIconColor()),
            const SizedBox(width: 10.0),
            Expanded(
              child: Text(
                _findLabel(),
                style: const TextStyle(color: AppColors.gray2),
              ),
            ),
          ],
        ),
      ],
    );
  }

  IconData _findIcon() {
    return switch (greenScore) {
      ProductGreenScore.Aplus => AppIcons.ecoscore_a_plus,
      ProductGreenScore.A => AppIcons.ecoscore_a,
      ProductGreenScore.B => AppIcons.ecoscore_b,
      ProductGreenScore.C => AppIcons.ecoscore_c,
      ProductGreenScore.D => AppIcons.ecoscore_d,
      ProductGreenScore.E => AppIcons.ecoscore_e,
      ProductGreenScore.F => AppIcons.ecoscore_f,
      // TODO
      ProductGreenScore.unknown => AppIcons.ecoscore_e,
    };
  }

  Color _findIconColor() {
    return switch (greenScore) {
      ProductGreenScore.Aplus => AppColors.greenScoreAPlus,
      ProductGreenScore.A => AppColors.greenScoreA,
      ProductGreenScore.B => AppColors.greenScoreB,
      ProductGreenScore.C => AppColors.greenScoreC,
      ProductGreenScore.D => AppColors.greenScoreD,
      ProductGreenScore.E => AppColors.greenScoreE,
      ProductGreenScore.F => AppColors.greenScoreF,
      // TODO
      ProductGreenScore.unknown => Colors.transparent,
    };
  }

  String _findLabel() {
    return switch (greenScore) {
      ProductGreenScore.Aplus => 'Très faible impact environnemental',
      ProductGreenScore.A => 'Très faible impact environnemental',
      ProductGreenScore.B => 'Faible impact environnemental',
      ProductGreenScore.C => 'Impact modéré sur l\'environnement',
      ProductGreenScore.D => 'Impact environnemental élevé',
      ProductGreenScore.E => 'Impact environnemental très élevé',
      ProductGreenScore.F => 'Impact environnemental très élevé',
      ProductGreenScore.unknown => 'Score non calculé',
    };
  }
}

class _Info extends StatelessWidget {
  const _Info();

  @override
  Widget build(BuildContext context) {
    final Product product = generateProduct();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _ProductItemValue(label: 'Quantité', value: product.quantity ?? '-'),
        _ProductItemValue(
          label: 'Vendu',
          value: product.manufacturingCountries?.join(', ') ?? '-',
          includeDivider: false,
        ),
        const SizedBox(height: 15.0),
        Row(
          children: [
            Expanded(
              flex: 40,
              child: _ProductBubble(
                label: 'Végétalien',
                value: product.isVegan == ProductAnalysis.yes
                    ? _ProductBubbleValue.on
                    : _ProductBubbleValue.off,
              ),
            ),
            Spacer(flex: 10),
            Expanded(
              flex: 40,
              child: _ProductBubble(
                label: 'Végétarien',
                value: product.isVegetarian == ProductAnalysis.yes
                    ? _ProductBubbleValue.on
                    : _ProductBubbleValue.off,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ProductItemValue extends StatelessWidget {
  final String label;
  final String value;
  final bool includeDivider;

  const _ProductItemValue({
    required this.label,
    required this.value,
    this.includeDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(vertical: 12.0),
          child: Row(
            children: [
              Expanded(child: Text(label)),
              Expanded(child: Text(value, textAlign: TextAlign.end)),
            ],
          ),
        ),
        if (includeDivider) const Divider(height: 1.0),
      ],
    );
  }
}

class _ProductBubble extends StatelessWidget {
  final String label;
  final _ProductBubbleValue value;

  const _ProductBubble({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.blueLight,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsetsDirectional.symmetric(
        vertical: 10.0,
        horizontal: 15.0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            value == _ProductBubbleValue.on
                ? AppIcons.checkmark
                : AppIcons.close,
            color: AppColors.white,
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Text(label, style: const TextStyle(color: AppColors.white)),
          ),
        ],
      ),
    );
  }
}

enum _ProductBubbleValue { on, off }

class ProductIW extends InheritedWidget {
  const ProductIW({super.key, required this.product, required super.child});

  final Product product;

  static ProductIW of(BuildContext context) {
    final ProductIW? result = context
        .dependOnInheritedWidgetOfExactType<ProductIW>();
    assert(result != null, 'No ProductIW found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ProductIW old) {
    return product != old.product;
  }
}
