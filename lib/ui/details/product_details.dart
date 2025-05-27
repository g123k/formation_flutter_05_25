import 'package:flutter/material.dart';
import 'package:untitled4/res/app_icons.dart';
import 'package:untitled4/ui/details/product_tab0.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _position = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductTab0(),
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
