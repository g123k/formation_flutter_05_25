// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get retry => 'Réessayer';

  @override
  String get homepage_title => 'Mes scans';

  @override
  String get homepage_empty => 'Vous n\'avez pas encore scanné de produits.';

  @override
  String get homepage_button => 'Commencer';

  @override
  String get product_quantity => 'Quantité';

  @override
  String get product_countries => 'Vendu en';

  @override
  String get product_vegan => 'Végétalien';

  @override
  String get product_vegetarian => 'Végétarien';

  @override
  String get product_nutri_score => 'Nutri-Score';

  @override
  String get product_green_score => 'Green-Score';

  @override
  String get product_nova_score => 'Groupe NOVA';
}
