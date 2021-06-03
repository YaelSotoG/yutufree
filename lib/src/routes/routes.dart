import 'package:flutter/material.dart';

import 'package:yutufree/src/pages/home_page.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    'inicio': (BuildContext context) => Homepage(),
    // 'view': (BuildContext context) => ViewVideo(),
  };
}
