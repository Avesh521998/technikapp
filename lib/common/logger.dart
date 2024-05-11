import 'package:flutter/foundation.dart';

void timber(dynamic value) {

    if (value is String)
      print(value);
    else
      print(value.toString());

}
