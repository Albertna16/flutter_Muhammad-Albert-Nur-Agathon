import 'package:flutter/material.dart';
import 'package:flutter_assets_dialog_and_navigation/themes/theme_color.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeTextStyle {
  TextStyle m3HeadLineSmall = GoogleFonts.mooli(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: ThemeColor().m3SysLightOnSurface,
  );

  TextStyle m3BodyLarge = GoogleFonts.mooli(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ThemeColor().m3SysLightOnSurfaceVariant,
  );

  TextStyle m3BodyMedium = GoogleFonts.mooli(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ThemeColor().m3SysLightOnSurfaceVariant,
  );

  TextStyle m3BodySmall = GoogleFonts.mooli(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ThemeColor().m3SysLightOnSurfaceVariant,
  );

  TextStyle m3LabelLarge = GoogleFonts.mooli(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: ThemeColor().m3SysLightOnPrimary,
  );

  TextStyle m3TitleLarge = GoogleFonts.mooli(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: ThemeColor().m3SysLightOnPrimaryContainer,
  );

  TextStyle m3TitleMedium = GoogleFonts.mooli(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: ThemeColor().m3SysLightOnPrimaryContainer,
  );
}