import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  static const IMAGE_HEIGHT = 300.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            PositionedDirectional(
              top: 0.0,
              start: 0.0,
              end: 0.0,
              height: IMAGE_HEIGHT,
              child: Image.network(
                'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?q=80&w=1310&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                fit: BoxFit.cover,
              ),
            ),
            PositionedDirectional(
              start: 0.0,
              end: 0.0,
              top: IMAGE_HEIGHT - 16.0,
              bottom: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.vertical(
                    top: Radius.circular(16.0),
                  ),
                ),
                padding: EdgeInsetsDirectional.only(
                  top: 30.0,
                  start: 20.0,
                  end: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Petits pois et carottes'),
                    Text('Cassegrain'),
                    ProductScores(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductScores extends StatelessWidget {
  const ProductScores({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [NutriScore(), VerticalDivider(), NovaScore()],
        ),
        Divider(),
        EcoScore(),
      ],
    );
  }
}

class NutriScore extends StatelessWidget {
  const NutriScore({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO
    return const Placeholder();
  }
}

class NovaScore extends StatelessWidget {
  const NovaScore({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO
    return const Placeholder();
  }
}

class EcoScore extends StatelessWidget {
  const EcoScore({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO
    return const Placeholder();
  }
}
