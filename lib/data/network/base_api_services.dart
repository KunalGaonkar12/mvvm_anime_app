import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../app_exceptions.dart';

abstract class BaseApiServices {

  Future<Either<AppException, Q>> callPostApi<Q, R>(String url,
      Map<String, String> headers, ComputeCallback<String, R> callback,
      {body});

  Future<Either<AppException, Q>> callGetApi<Q, R>(String url,
      Map<String, String> headers, ComputeCallback<String, R> callback, {Map<String, dynamic> query});

}
