import 'package:flutter/material.dart';
import 'package:flutter_api_mvvm/models/user_models.dart';
import 'package:flutter_api_mvvm/screen/user/user_view_model.dart';
import 'package:flutter_api_mvvm/widgets/sidebar_widget.dart';
import 'package:flutter_api_mvvm/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Screen"),
        centerTitle: true,
      ),
      drawer: const SidebarWidget(),
      body: Center(
        child: Consumer<UserViewModel>(
          builder: (context, userViewModel, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFieldWidget(
                  label: 'Title',
                  hintText: 'Input your title',
                  keyboardType: TextInputType.text,
                  controller: userViewModel.titleController,
                ),
                TextFieldWidget(
                  label: 'Body',
                  hintText: 'Input your body',
                  keyboardType: TextInputType.text,
                  controller: userViewModel.bodyController,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final newUser = UserModels(
                          userId: 1,
                          id: 1,
                          title: userViewModel.titleController.text,
                          body: userViewModel.bodyController.text,
                        );

                        await Provider.of<UserViewModel>(context, listen: false)
                            .updateUser(userModels: newUser);

                        // ignore: use_build_context_synchronously
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Data Form Put Request'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Title',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(userViewModel.titleController.text),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Body',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(userViewModel.bodyController.text),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text('Update Data'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        userViewModel.titleController.clear();
                        userViewModel.bodyController.clear();
                      },
                      child: const Text("Clear Data"),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
