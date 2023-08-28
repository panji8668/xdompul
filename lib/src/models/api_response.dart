// ignore_for_file: constant_identifier_names

class ApiResponse<T> {
  Status status;
  late T data;
  String ?message;

  ApiResponse.init() : status = Status.INIT;
  ApiResponse.loading(this.message) : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR, INIT }
enum JenisViewTrx { INQ_REQ, INQ_RES, PAY_RES, LOADING, ERROR, INIT }
enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
  BLANK_SERVER,
  PHONE_NOT_REGISTERED,
  PHONE_REGISTERED,
  ERROR,
  INIT
}

class JenisTransaksiPPOBView<T> {
  JenisViewTrx ?status;
  T ?data;
  String ?message;

  JenisTransaksiPPOBView.init(this.message) : status = JenisViewTrx.INIT;
  JenisTransaksiPPOBView.loading(this.message) : status = JenisViewTrx.LOADING;
  JenisTransaksiPPOBView.error(this.message) : status = JenisViewTrx.ERROR;
  JenisTransaksiPPOBView.inqreq(this.message) : status = JenisViewTrx.INQ_REQ;
  JenisTransaksiPPOBView.inqres(this.data) : status = JenisViewTrx.INQ_RES;
  JenisTransaksiPPOBView.payres(this.data) : status = JenisViewTrx.PAY_RES;
}

class AuthenticationStatus<T> {
  AuthStatus ?status;
  T ?data;
  String ?message;
  AuthenticationStatus.init() : status = AuthStatus.INIT;
  AuthenticationStatus.notdetermined(this.message)
      : status = AuthStatus.NOT_DETERMINED;
  AuthenticationStatus.loggedIn(this.data) : status = AuthStatus.LOGGED_IN;
  AuthenticationStatus.fullLogined(this.data)
      : status = AuthStatus.PHONE_REGISTERED;
  AuthenticationStatus.error(this.message) : status = AuthStatus.ERROR;
  AuthenticationStatus.notloggedin(this.message)
      : status = AuthStatus.NOT_LOGGED_IN;

  AuthenticationStatus.blankServer(this.message)
      : status = AuthStatus.BLANK_SERVER;
  AuthenticationStatus.phoneNotRegistered(this.message)
      : status = AuthStatus.PHONE_NOT_REGISTERED;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}


class ApiResponseOTP<T> {
  OTPStatus ?status;
  T ?data;
  String ?message;

  ApiResponseOTP.init() : status = OTPStatus.INIT;
  ApiResponseOTP.loading(this.message) : status = OTPStatus.LOADING;
  ApiResponseOTP.completeOTP(this.data) : status = OTPStatus.COMPLETE_GETOTP;
  ApiResponseOTP.completeVEFIRY(this.data) : status = OTPStatus.COMPLETE_VERIFY;
  ApiResponseOTP.error(this.message) : status = OTPStatus.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum OTPStatus { LOADING, COMPLETE_GETOTP, COMPLETE_VERIFY, ERROR, INIT }
