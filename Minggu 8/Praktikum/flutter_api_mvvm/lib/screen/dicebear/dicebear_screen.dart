import 'package:flutter/material.dart';
import 'package:flutter_api_mvvm/screen/dicebear/dicebear_view_model.dart';
import 'package:flutter_api_mvvm/widgets/sidebar_widget.dart';
import 'package:flutter_api_mvvm/widgets/text_field_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class DicebearScreen extends StatelessWidget {
  const DicebearScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Random Image Generator',
        ),
        centerTitle: true,
      ),
      drawer: const SidebarWidget(),
      body: Consumer<DicebearViewModel>(
        builder: (context, dicebearProvider, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dicebearProvider.isLoading
                  ? const CircularProgressIndicator()
                  : dicebearProvider.image.isEmpty
                      ? const Icon(
                          Icons.image_rounded,
                          size: 100,
                        )
                      : SvgPicture.string(
                          dicebearProvider.image,
                          height: 100,
                          width: 100,
                        ),
              TextFieldWidget(
                label: 'Name',
                hintText: 'Input your name',
                keyboardType: TextInputType.name,
                controller: dicebearProvider.textController,
              ),
              ElevatedButton(
                onPressed: () {
                  dicebearProvider.getDiceBear();
                },
                child: const Text(
                  'Generate Image',
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
