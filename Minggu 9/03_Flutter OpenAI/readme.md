# (24) OpenAI In Flutter

OpenAI merupakan sebuah library yang dapat digunakan untuk memanfaatkan teknologi AI(Artifical Intelligence) yang disediakan oleh OpenAI. Library ini nantinya dapat diintegrasikan dengan berbagai aplikasi seperti API, Web, dan Mobile. Keuntungan dari OpenAI yaitu yang pertama adalah gratis, lalu Mudah dipasang, lalu dapat digunakan di berbagai perangkat dan jumlah parameter: 175 miliar (model davinci 03). 

## Project Example
1. Mendapatkan API Key
Untuk mengakses API yang disediakan oleh OpenAI kita harus membuat sebuah API Key baru dari web yang disediakan oleh OpenAI. Setelah API Key telah dibuat, pastikan API Key disimpan di dalam sebuah file karena API Key hanya bisa dicopy satu kali saja. 

2. Membuat Project Flutter
Setelah itu kita buat project flutter baru yang digunakan untuk membuat program.

3. Instalasi package dan Buat file konfigurasi
```dart
flutter pub add http
flutter pub add intl

flutter pub add envied
flutter pub add --dev envied_generator
flutter pub add --dev build_runner
```

jika menggunakan Git, pastikan file .env dan env.g.dart sudah ditambahkan di dalam file .gitignore
```dart
// FILE .ENV
OPENAI_API_KEY = 'YOUR_OPENAI_API_KEY'
```

4. Membaca file konfigurasi serta melakukan generate code
```dart
/// FILE LIB/ENV/ENV.DART
import 'package:envied/envied.dart';
part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'OPENAI_API_KEY')
  static const apiKey = _Env.apiKey;
}
```

```
/// GENERATE CODE UNTUK MEMBACA .ENV
flutter pub run build_runner build
```

```dart
/// MEMBUAT VARIABLE UNTUK MENYIMPAN API KEY
import 'package:flutter_openai_demo/env/env.dart';

String apiKey = Env.apiKey;
```
5. Membuat Data Model
```dart
/// FILE LIB/MODELS/OPEN_AI.DART
class GptData {
  GptData({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
  });

  String id;
  String object;
  int created;
  String model;
  List<Choice> choices;
  Usage usage;

  factory GptData.fromJson(Map<String, dynamic> json) => GptData(
        id: json["id"],
        object: json["object"],
        created: json["created"],
        model: json["model"],
        choices: json["choices"] == null
            ? []
            : List<Choice>.from(
                json["choices"]!.map((x) => Choice.fromJson(x))),
        usage: Usage.fromJson(json["usage"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "created": created,
        "model": model,
        "choices": List<dynamic>.from(choices.map((x) => x.toJson())),
        "usage": usage.toJson(),
      };
}

class Choice {
  Choice({
    required this.text,
    required this.index,
    this.logprobs,
    required this.finishReason,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        text: json["text"],
        index: json["index"],
        logprobs: json["logProbs"],
        finishReason: json["finish_reason"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "index": index,
        "logProbs": logProbs,
        "finish_reason": finishReason,
      };
}

class Ussage {
  Usage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalToken,
  });

  int promptTokens,
  int completionTokens,
  int totalToken,

  factory Usage.fromJson(Map<String, dynamic> json) => Usage(
      promptTokens: json["prompt_tokens"],
      completionTokens: json["completion_tokens"],
      totalToken: json["total_tokens"],
    );

  Map<String, dynamic> toJson() => {
      "prompt_tokens": promptTokens,
      "completion_tokens": completionTokens,
      "total_tokens": totalTokens,
    };
}
```

6. Membuat Komponen Service