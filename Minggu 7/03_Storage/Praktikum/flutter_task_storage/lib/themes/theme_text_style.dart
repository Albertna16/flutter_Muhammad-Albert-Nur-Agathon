import 'package:flutter/material.dart';
import 'package:flutter_task_storage/themes/theme_color.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeTextStyle {
  TextStyle m3HeadLineSmall = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: ThemeColor().m3SysLightOnSurface,
  );

  TextStyle m3BodyLarge = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ThemeColor().m3SysLightOnSurfaceVariant,
  );

  TextStyle m3BodyMedium = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ThemeColor().m3SysLightOnSurfaceVariant,
  );

  TextStyle m3BodySmall = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ThemeColor().m3SysLightOnSurfaceVariant,
  );

  TextStyle m3LabelLarge = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: ThemeColor().m3SysLightOnPrimary,
  );

  TextStyle m3TitleLarge = GoogleFonts.roboto(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: ThemeColor().m3SysLightOnPrimaryContainer,
  );

  TextStyle m3TitleMedium = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: ThemeColor().m3SysLightOnPrimaryContainer,
  );
}