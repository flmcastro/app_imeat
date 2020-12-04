class ApiResponse<T> {
  bool statusSolicitacao;
  String msg;
  T result;

  ApiResponse.ok({this.result}) {
    statusSolicitacao = true;
  }

  ApiResponse.error(this.msg) {
    statusSolicitacao = false;
  }
}
