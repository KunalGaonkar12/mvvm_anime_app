import 'package:flutter_mvvm/data/response/enum/status.dart';

class ApiResponse<T>{

  Status? status;
  T? data;
  String? message;

  ApiResponse(this.data,this.status,this.message);

  ApiResponse.loading() : status=Status.LOADING;

  ApiResponse.completed(this.data) : status=Status.COMPLETE;

  ApiResponse.error(this.message) : status=Status.ERROR;

  @override
  String toString(){
    return "Status : $status \n Message : $message \n Data : $data";
  }

}