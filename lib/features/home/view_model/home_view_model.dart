import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm/features/home/repository/home_repository.dart';
import '../../../data/response/api_response.dart';
import '../model/anime_list_model.dart';

class HomeViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();

  Map<String, String> query = {
    'page': '1',
    'size': '50',
    'sortBy': 'ranking',
    'sortOrder': 'asc'
  };

  setAnimeList(ApiResponse<AnimeListModel> response) {
    animeList = response;
  }

  ApiResponse<AnimeListModel> animeList = ApiResponse.loading();

  Future<void> getAnimeData() async {
    setAnimeList(ApiResponse.loading());
    var response = await _myRepo.getAnimeData(query: query);
    response.fold((failure) => setAnimeList(ApiResponse.error(failure.message)),
        (data) async {
      setAnimeList(ApiResponse.completed(data));
    });
    notifyListeners();
  }
}
