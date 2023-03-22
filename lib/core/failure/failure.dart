//

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class Failure extends Equatable {
  String message(BuildContext context);

  @override
  List<Object?> get props => throw UnimplementedError();
}
