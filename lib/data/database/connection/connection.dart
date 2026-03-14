// Conditional import: uses native.dart on native platforms, web.dart on web
export 'native.dart' if (dart.library.js_interop) 'web.dart';
