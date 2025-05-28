import 'package:flutter/material.dart';
import 'package:untitled4/model/product.dart';
import 'package:untitled4/res/app_icons.dart';
import 'package:untitled4/ui/details/product_tab0.dart';
import 'package:untitled4/ui/details/product_tab1.dart';
import 'package:untitled4/ui/details/product_tab2.dart';
import 'package:untitled4/ui/details/product_tab3.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _position = 0;

  @override
  Widget build(BuildContext context) {
    return ProductProvider(
      product: generateProduct(),
      child: Scaffold(
        body: Stack(
          children: [
            Offstage(offstage: _position != 0, child: ProductTab0()),
            Offstage(offstage: _position != 1, child: ProductTab1()),
            Offstage(offstage: _position != 2, child: ProductTab2()),
            Offstage(offstage: _position != 3, child: ProductTab3()),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _position,
          onTap: (int position) => setState(() {
            _position = position;
          }),
          items: ProductDetailsCurrentTab.values
              .map((ProductDetailsCurrentTab tab) {
                return BottomNavigationBarItem(
                  label: tab.label,
                  icon: Icon(tab.icon),
                );
              })
              .toList(growable: false),
        ),
      ),
    );
  }
}

enum ProductDetailsCurrentTab {
  summary('Fiche', AppIcons.tab_barcode),
  info('Caractéristiques', AppIcons.tab_fridge),
  nutrition('Nutrition', AppIcons.tab_nutrition),
  nutritionalValues('Tableau', AppIcons.tab_array);

  final String label;
  final IconData icon;

  const ProductDetailsCurrentTab(this.label, this.icon);
}

class ProductProvider extends InheritedWidget {
  const ProductProvider({
    required this.product,
    required super.child,
    super.key,
  });

  final Product product;

  static ProductProvider of(BuildContext context) {
    final ProductProvider? result = context
        .dependOnInheritedWidgetOfExactType<ProductProvider>();
    assert(result != null, 'No ProductProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ProductProvider old) {
    return product != old.product;
  }
}
