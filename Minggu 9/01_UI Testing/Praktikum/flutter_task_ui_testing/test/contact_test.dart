import 'package:flutter/material.dart';
import 'package:flutter_task_ui_testing/screen/contact_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Contact Screen UI Testing', (tester) async {
    /// SCREEN
    await tester.pumpWidget(const MaterialApp(
      home: ContactScreen(),
    ));

    /// TEXT DESCRIPTION
    expect(find.text("Contacts"), findsOneWidget);
    expect(find.text("Create New Contacts"), findsOneWidget);
    expect(
        find.text(
            "Tambahkan teman baru ke daftar kontakmu sekarang! Bangun hubungan yang lebih erat dan nikmati percakapan yang menyenangkan. Yuk, tambah kontak sekarang!"),
        findsOneWidget);

    /// NAME CONTROLLER
    expect(find.text("Name"), findsOneWidget);
    expect(find.text("Insert Your Name"), findsOneWidget);

    final nameTextField = find.widgetWithText(TextField, 'Name');
    await tester.enterText(nameTextField, "Muh Albert");

    /// NUMBER CONTROLLER
    expect(find.text("Nomor"), findsOneWidget);
    expect(find.text("+62..."), findsOneWidget);

    final numberTextField = find.widgetWithText(TextField, 'Nomor');
    await tester.enterText(numberTextField, "0895366968783");

    /// DATE PICKER
    expect(find.text("Date"), findsOneWidget);
    expect(find.text("Select"), findsOneWidget);

    /// BUTTON SELECT DATE PICKER
    final dateButton = find.widgetWithText(ElevatedButton, "Select");
    await tester.tap(dateButton);
    await tester.pump();

    expect(find.text("CANCEL"), findsOneWidget);
    expect(find.text("OK"), findsOneWidget);

    final saveButtonDate = find.widgetWithText(TextButton, "OK");
    await tester.tap(saveButtonDate);
    await tester.pump();

    /// COLOR PICKER
    expect(find.text("Color"), findsOneWidget);
    expect(find.text("Pick Color"), findsOneWidget);

    /// BUTTON PICK COLOR
    final colorButton = find.widgetWithText(ElevatedButton, "Pick Color");
    await tester.tap(colorButton);
    await tester.pump();

    expect(find.text("Save"), findsOneWidget);

    final saveButtonColor = find.widgetWithText(TextButton, "Save");
    await tester.tap(saveButtonColor);
    await tester.pump();

    /// SCROLL
    final scroll = await tester.startGesture(const Offset(0, 300));
    await scroll.moveBy(const Offset(0, -300));
    await tester.pump();

    /// FILE PICKER
    expect(find.text("Files"), findsOneWidget);
    expect(find.text("Pick"), findsOneWidget);
    expect(find.text("Open"), findsOneWidget);
    expect(find.text("Clear"), findsOneWidget);
    expect(find.text("Nama file: Tidak terdapat file"), findsOneWidget);

    final submitButton = find.widgetWithText(ElevatedButton, "Submit Contact");
    await tester.press(submitButton, warnIfMissed: false);
    await tester.pump();

    /// ALERT DIALOG
    expect(find.text("Success!!!"), findsNothing);
    expect(
        find.text(
            "Kontak yang anda tambahkan telah berhasil dimasukkan ke dalam daftar kontak anda"),
        findsNothing);

    expect(find.text("Ok"), findsNothing);

    /// TEXT LIST OF CONTACTS
    expect(find.text("List of Contacts"), findsOneWidget);
  });
}
