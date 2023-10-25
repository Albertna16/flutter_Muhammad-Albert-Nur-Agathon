import 'package:flutter/material.dart';
import 'package:flutter_task_openai/screen/result_screen.dart';
import 'package:flutter_task_openai/services/recommendation.dart';
import 'package:flutter_task_openai/widgets/textfield_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _anggaranController = TextEditingController();
  final TextEditingController _kameraController = TextEditingController();
  final TextEditingController _memoriController = TextEditingController();
  bool isLoading = false;

  void _getRecommendationPhone() async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await RecommendationServices.getRecommendationPhone(
        anggaran: _anggaranController.value.text,
        kamera: _kameraController.value.text,
        memori: _memoriController.value.text,
      );

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return ResultScreen(gptResponseData: result);
          },
        ),
      );

      _anggaranController.clear();
      _kameraController.clear();
      _memoriController.clear();
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('Gagal mengirim permintaan'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rekomendasi Ponsel AI', style: GoogleFonts.poppins()),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldWidget(
                  label: "Anggaran dana",
                  hintText: "Masukkan anggaran dana anda (IDR)",
                  controller: _anggaranController,
                ),
                const SizedBox(height: 20),
                TextFieldWidget(
                  label: "Min Camera Spesifikasi",
                  hintText: "Masukkan minimal spesifikasi camera (MP)",
                  controller: _kameraController,
                ),
                const SizedBox(height: 20),
                TextFieldWidget(
                  label: "Min Internal Memori",
                  hintText: "Masukkan minimal ukuran ROM (GB)",
                  controller: _memoriController,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 8
                  ),
                  child: isLoading && _formkey.currentState!.validate() != false
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan
                        ),
                          onPressed: _getRecommendationPhone,
                          child: const Center(
                            child: Text(
                              'Get Recommendation by OpenAI',
                            ),
                          ),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
