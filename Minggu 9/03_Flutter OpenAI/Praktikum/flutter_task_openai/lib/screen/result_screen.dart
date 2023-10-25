import 'package:flutter/material.dart';
import 'package:flutter_task_openai/models/openai_models.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.gptResponseData});

  final OpenAiModels gptResponseData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommendation'),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Saya merekomendasikan anda untuk membeli: ',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              textAlign: TextAlign.justify,
            ),
            Text(
              gptResponseData.choices[0].text,
              style: GoogleFonts.poppins(
              ),
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
