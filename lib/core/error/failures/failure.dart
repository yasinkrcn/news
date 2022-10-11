import 'package:equatable/equatable.dart';
import 'package:news/core/error/failures/base_response_status_failures.dart';

abstract class Failure extends Equatable {
  const Failure([final List properties = const <dynamic>[]]);

  // void snackbarMethod(){
  //    showCustomMessenger(
  //     CustomMessengerState.ERROR,
  //     errorMessage(),
  //   );
  // }

  static Failure getFailure(String errorMessage) {
    ServiceMessageFailure.message = errorMessage;
    errorMessage = errorMessage.toString();

    switch (errorMessage) {
      case 'Ana sayfada haberleri çekerken bir hata oluştu':
        return RequestHomeFailure();
      default:
        return NullPointerFailure();
    }
  }
}

extension FailureExtension on Failure {
  String errorMessage() {
    switch (runtimeType) {
      case RequestHomeFailure:
        return 'FailureRequestHome';
    }
    return 'Beklenmeyen bir hata oluştu';
  }
}
