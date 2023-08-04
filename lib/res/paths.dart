import 'package:smapur/utils/config.dart';

class BasePaths {
  static const baseImagePath = "assets/img";
  static const baseRestAPIProdUrl = ""; //Fill with railway domain API
  static const baseRestAPITestUrl = "http://127.0.0.1:8000/api";
  static const baseRestAPI =
      AppConfig.devMode ? baseRestAPITestUrl : baseRestAPIProdUrl;
}
