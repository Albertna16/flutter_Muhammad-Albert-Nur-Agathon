import 'package:flutter/material.dart';
import 'package:flutter_task_storage/themes/theme_color.dart';
import 'package:flutter_task_storage/themes/theme_text_style.dart';

class TextDescription extends StatelessWidget {
  const TextDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 16,
              top: 25,
            ),
            child: Icon(
              Icons.phone_android,
              color: ThemeColor().m3SysLightSecondary,
            ),
          ),
          Text(
            "Create New Contacts",
            style: ThemeTextStyle().m3HeadLineSmall,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 17,
            ),
            child: Text(
              "Tambahkan teman baru ke daftar kontakmu sekarang! Bangun hubungan yang lebih erat dan nikmati percakapan yang menyenangkan. Yuk, tambah kontak sekarang!",
              style: ThemeTextStyle().m3BodyMedium,
              textAlign: TextAlign.justify,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 7),
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
