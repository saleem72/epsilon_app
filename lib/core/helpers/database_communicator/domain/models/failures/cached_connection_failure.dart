//

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cached_connection_failure.freezed.dart';

@freezed
class CachedConnectionFailure with _$CachedConnectionFailure {
  factory CachedConnectionFailure.noCache() = _NoCache;
}
