import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled4/res/app_colors.dart';
import 'package:untitled4/res/app_icons.dart';
import 'package:untitled4/res/app_vectorial_images.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes scans'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () async {
              bool? res = await showDialog<bool>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Ma question'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Text('Oui'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text('Non'),
                      ),
                    ],
                  );
                },
              );

              print(res);
            },
            icon: Padding(
              padding: const EdgeInsetsDirectional.only(end: 8.0),
              child: Icon(AppIcons.barcode),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 20),
            SvgPicture.asset(AppVectorialImages.illEmpty),
            Spacer(flex: 15),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 4.0),
              child: Text(
                'Vous n\'avez pas encore scanné de produit',
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(flex: 10),
            TextButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.blue,
                backgroundColor: AppColors.yellow,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(22.0)),
                ),
              ),
              onPressed: () {
                GoRouter.of(context).push('/details');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Commencer'.toUpperCase()),
                  const SizedBox(width: 10.0),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
            Spacer(flex: 20),
          ],
        ),
      ),
    );
  }
}
