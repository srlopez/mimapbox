import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/data_controller.dart';
import 'providers/data_provider.dart';
import 'services/data_services_file.dart';
import 'ui/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var localDataService = DataServicesFile();
  await localDataService.init();
  var dataCtrl = DataController(localDataService);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Data>(
        create: (_) => Data(controller: dataCtrl),
      ),
    ],
    child: MyApp(),
  ));
}
