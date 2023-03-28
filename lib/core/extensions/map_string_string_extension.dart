//

import 'dart:convert';

import 'package:flutter/material.dart';

extension PrinttBeautify on Map<String, String> {
  beautify() {
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    String prettyprint = encoder.convert(this);
    debugPrint(prettyprint);
  }
}
