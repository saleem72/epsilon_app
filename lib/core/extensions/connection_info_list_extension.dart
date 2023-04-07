//

import 'package:collection/collection.dart';
import 'package:epsilon_app/core/helpers/database_communicator/domain/models/connection_params.dart';

extension ConnectionInfoExtension on List<ConnectionInfo> {
  ConnectionInfo? lastInUse() {
    if (isEmpty) {
      return null;
    }

    final lastInUse = firstWhereOrNull((element) => element.lastInUse);
    if (lastInUse != null) {
      return lastInUse;
    }

    return first;
  }
}
