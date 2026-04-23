import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/models/news_data.dart';
import 'api_constants.dart';
import 'package:news/models/sources_model.dart';

class HttpApi {
  //https://newsapi.org/v2/top-headlines/sources?apiKey=968ad320e69d4c9296e480834fd70e29
  static Future<List<Sources>> getSources(String category) async {
    try{
      var request = Uri.https(ApiConstants.server, ApiConstants.sourcesEndPoint, {'category':category,'apiKey': ApiConstants.apiKey});
      http.Response response = await http.get(request);
      debugPrint('\n\n');
      SourcesModel sourcesModel = SourcesModel.fromJson(jsonDecode(response.body));
      for(int i = 0;i<sourcesModel.sources!.length;i++){
        debugPrint(sourcesModel.sources![i].id);
      }
      return sourcesModel.sources!;
    } catch(e){
      rethrow;
    }
  }
  static Future<NewsData> getNewsData(Sources source) async {
    try{
      var request = Uri.https(ApiConstants.server, ApiConstants.newsEndPoint, {'sources':source.id,'apiKey': ApiConstants.apiKey});
      http.Response response = await http.get(request);
      NewsData newsData = NewsData.fromJson(jsonDecode(response.body));
      return newsData;
    }catch (e){
      rethrow;
    }
  }
  static Future<NewsData> searchNews(String search) async{
    try{
      Map<String,dynamic> queryParameters = {};
      if(search.isNotEmpty){
        queryParameters['q'] = search;
      }
      queryParameters['apiKey'] = ApiConstants.apiKey;
      debugPrint(queryParameters.toString());
      var request = Uri.https(ApiConstants.server, ApiConstants.searchEndPoint,queryParameters);
      http.Response response = await http.get(request);
      NewsData newsData = NewsData.fromJson(jsonDecode(response.body));
      debugPrint(response.body);

      return newsData;
    }catch (e){
      rethrow;
    }
  }
}


