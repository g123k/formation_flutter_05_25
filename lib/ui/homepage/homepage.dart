import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled4/l10n/app_localizations.dart';
import 'package:untitled4/res/app_colors.dart';
import 'package:untitled4/res/app_icons.dart';
import 'package:untitled4/res/app_vectorial_images.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations.homepage_title),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () async {
              // TODO Mettre le scanner ici
              // GoRouter.of(context).push('/details?barcode=5000159484695');
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
                appLocalizations.homepage_empty,
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
                GoRouter.of(context).push('/details?barcode=5000159484695');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(appLocalizations.homepage_button.toUpperCase()),
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
