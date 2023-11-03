import 'package:dio/dio.dart';
import 'package:terra_discover_project/constant/image_api_constant.dart';

class ImageApi {
  Future<String> postImageQuery({required String prompt}) async {
    String imageHash = "";
    final response = await Dio().post(
      'https://arimagesynthesizer.p.rapidapi.com/generate',
      options: Options(
        headers: {
          'X-RapidAPI-Key' : apiKey,
          'X-RapidAPI-Host' : "arimagesynthesizer.p.rapidapi.com"
        },
        contentType: "application/x-www-form-urlencoded",
      ),
      data: {
        "prompt" : prompt,
        "id" : 12345,
        "width" : 768,
        "height" : 768,
        "inferenceSteps"  : 50,
        "guidanceScale" : 60,
        "img2img_strength" : 1
      }
    );

    if (response.statusCode == 202) {
      imageHash = response.data["hash"].toString();
    }

    return imageHash;
  }

  Future<void> getImage({required String imageHash}) async {
    await Dio().get(
      'https://arimagesynthesizer.p.rapidapi.com/get?hash=$imageHash',
      options: Options(
        headers: {
          'X-RapidAPI-Key' : apiKey,
          'X-RapidAPI-Host' : "arimagesynthesizer.p.rapidapi.com"
        },
      )
    );
  }
}