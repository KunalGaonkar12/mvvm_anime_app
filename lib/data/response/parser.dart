import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm/data/app_exceptions.dart';
import 'package:flutter_mvvm/features/home/model/anime_list_model.dart';
import 'package:flutter_mvvm/features/user/model/user_model.dart';
import 'package:http/http.dart' as http;


class Parser{

  static Future<UserModel> parseLoginResponse(String responseBody) async{
    return UserModel.fromJson(jsonDecode(responseBody));
  }

 static Future<AnimeListModel> parseAnimeResponse(String responseBody) async{
    return AnimeListModel.fromJson(jsonDecode(responseBody));
  }

  static Future<Either<AppException,Q>> parseResponse<Q, R>( http.Response response, ComputeCallback<String, R> callback) async {
    if(response==null){
      if(kDebugMode){
        print('response is null ');
      }
      return Left(UnknownError());
    }else{
      try{
        switch(response.statusCode){
          case 200:
            var result= await compute(callback,response.body);
            return Right(result as Q);
            case 401:
            return Left(ForbiddenError());
            break;
          case 403:
            return Left(UnAuthorizedError());
            break;
          case 404:
            return Left(ServerError(
                statusCode: response.statusCode, message: "File not found"));
            break;
          case 500:
            return Left(ServerError(
                statusCode: response.statusCode, message: "Server Failure"));
            break;
          default:
            return Left(UnknownError(
                statusCode: response.statusCode, message: response.body));
        }
      }catch (e){
        return  Left(UnknownError());
      }
    }


  }

}