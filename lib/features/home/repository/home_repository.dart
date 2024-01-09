import 'package:flutter_mvvm/data/network/base_api_services.dart';
import 'package:flutter_mvvm/data/network/network_api_services.dart';
import 'package:flutter_mvvm/data/response/parser.dart';
import 'package:flutter_mvvm/resourses/app_urls.dart';
import 'package:flutter_mvvm/resourses/constants.dart';

class HomeRepository{

  final BaseApiServices _apiServices=NetworkApiService();

  Map<String,String> header={
    'X-RapidAPI-Key': Constant.animeDbApiKey,
    'X-RapidAPI-Host': Constant.animeDbHost
  };

  Future<dynamic> getAnimeData({Map<String, dynamic>? query}) async {
    return await _apiServices.callGetApi(AppUrl.animeListEndPoint, header, Parser.parseAnimeResponse,query:query! );
  }


}