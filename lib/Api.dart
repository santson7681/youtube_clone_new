import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/Video.dart';

const URL_BASE = "https://www.googleapis.com/youtube/v3/";
const CHAVE_YOUTUBE_API = "AIzaSyDWE89CsostsHn-qq74zu4wWq26YrxQa-0"; // Certifique-se de usar sua chave de API válida.
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    final response = await http.get(
      Uri.parse(
        URL_BASE + "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&channelId=$ID_CANAL"
            "&q=$pesquisa",
      ),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = (dadosJson["items"] as List).map((map) {
        return Video.fromJson(map);
      }).toList();

      return videos;
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
