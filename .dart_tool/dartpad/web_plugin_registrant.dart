// Flutter web plugin registrant file.
//
// Generated file. Do not edit.
//

// @dart = 2.13
// ignore_for_file: type=lint

import 'package:bs_flutter_datatable/bs_flutter_datatable_web.dart';
import 'package:bs_flutter_utils/bs_flutter_utils_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins([final Registrar? pluginRegistrar]) {
  final Registrar registrar = pluginRegistrar ?? webPluginRegistrar;
  BsFlutterDatatableWeb.registerWith(registrar);
  BsFlutterUtilsWeb.registerWith(registrar);
  registrar.registerMessageHandler();
}
