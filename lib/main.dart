import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/candidato_controller.dart';
import 'controllers/favorito_controller.dart';
import 'models/constantes_model.dart';
import 'pages/candidatos_page.dart';
import 'pages/dummy_page.dart';
import 'providers/favoritos_provider.dart';
import 'services/candidato_services_randomuser.dart';
import 'services/favorito_services_file.dart';
import 'services/favorito_services_hive.dart';
import 'services/favorito_services_lite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //var localFavoritoService = FavoritoServicesFile();
  var localFavoritoService = FavoritoServiceHive();
  await localFavoritoService.init();
  var favoritoCtrl = FavoritoController(localFavoritoService);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Favoritos>(
          create: (_) => Favoritos(controller: favoritoCtrl)),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Placeholder(),
    );
  }
}
