import 'dart:convert';
import 'package:flutter_task_openai/constants/open_ai.dart';
import 'package:flutter_task_openai/models/openai_models.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class RecommendationServices {
  static Future<OpenAiModels> getRecommendationPhone({
    required String anggaran,
    required String kamera,
    required String memori,
  }) async {
    late OpenAiModels openAiModels = OpenAiModels(
      id: "",
      object: "",
      created: 0,
      model: "",
      choices: [],
      usage: Usage(
        promptTokens: 0,
        completionTokens: 0,
        totalTokens: 0,
      ),
    );

    try {
      var url = Uri.parse('https://api.openai.com/v1/completions');
      Map<String, String> headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8',
        'Authorization': 'Bearer $apiKey'
      };

      final formatCurrency = NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'IDR',
        decimalDigits: 0,
      );

      String phoneBudget = formatCurrency.format(int.parse(anggaran));
      String phoneCamera = formatCurrency.format(int.parse(kamera));
      String phoneROM = formatCurrency.format(int.parse(memori));

      String promptData =
          "Berikan saya 10 rekomendasi ponsel dengan harga $phoneBudget, lalu minimal kamera utama ponsel $phoneCamera megapixels, dan minimal ROM ponsel $phoneROM GB";
      final data = jsonEncode({
        "model": "text-davinci-003",
        "prompt": promptData,
        "temperature": 0.4,
        "max_tokens": 512,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0
      });

      var response = await http.post(url, headers: headers, body: data);
      if (response.statusCode == 200) {
        openAiModels = openAiModelsFromJson(response.body);
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan saat mengirim permintaan');
    }

    return openAiModels;
  }
}
