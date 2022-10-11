import '../../_core_exports.dart';

abstract class PageRouteRepository {
  Future<dynamic> page(final String routeName, {final Object? arguments});
  Future<dynamic> pageAndReplace(final String routeName, {final Object? arguments});
  Future<dynamic> pageAndRemoveUntil(final String routeName, {final Object? arguments});
  dynamic back({final Object? arguments});
}

class Go implements PageRouteRepository {
  static Go to = Go._init();
  Go._init();

  Future<dynamic> page(final String routeName, {final Object? arguments}) async {
    if (GlobalContextKey.instance.globalKey.currentState != null) {
      ScaffoldMessenger.of(GlobalContextKey.instance.globalKey.currentContext!).clearSnackBars();
      return GlobalContextKey.instance.globalKey.currentState!.pushNamed(routeName, arguments: arguments);
    } else {
      currentStateNullError();
    }
  }

  Future<dynamic> pageAndReplace(final String routeName, {final Object? arguments}) async {
    if (GlobalContextKey.instance.globalKey.currentState != null) {
      ScaffoldMessenger.of(GlobalContextKey.instance.globalKey.currentContext!).clearSnackBars();

      return GlobalContextKey.instance.globalKey.currentState!.pushReplacementNamed(routeName, arguments: arguments);
    } else {
      currentStateNullError();
    }
  }

  Future<dynamic> pageAndRemoveUntil(final String routeName, {final Object? arguments}) async {
    if (GlobalContextKey.instance.globalKey.currentState != null) {
      ScaffoldMessenger.of(GlobalContextKey.instance.globalKey.currentContext!).clearSnackBars();

      return GlobalContextKey.instance.globalKey.currentState!
          .pushNamedAndRemoveUntil(routeName, (final route) => false, arguments: arguments);
    } else {
      currentStateNullError();
    }
  }

  dynamic back({final Object? arguments}) async {
    if (GlobalContextKey.instance.globalKey.currentState != null) {
      ScaffoldMessenger.of(GlobalContextKey.instance.globalKey.currentContext!).clearSnackBars();

      return GlobalContextKey.instance.globalKey.currentState!.pop(arguments);
    } else {
      currentStateNullError();
    }
  }

  void currentStateNullError() {}
}
