import 'package:code_competence_1/models/contact_models.dart';
import 'package:code_competence_1/widgets/add_dialog_widgets.dart';
import 'package:code_competence_1/widgets/button_submit_widgets.dart';
import 'package:code_competence_1/widgets/listview_widgets.dart';
import 'package:code_competence_1/widgets/text_description_widgets.dart';
import 'package:code_competence_1/widgets/text_field_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  final ValueNotifier<int> _messageLength = ValueNotifier<int>(0);

  int indexContact = -1;
  List<Contact> contactList = [];

  @override
  void initState() {
    super.initState();
    _messageController.addListener(_updateMessage);
  }

  void _updateMessage() {
    _messageLength.value = _messageController.text.length;
  }

  void _customDialog({
    required String title,
    required Widget content,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: content,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Ok'),
            )
          ],
        );
      },
    );
  }

  void _addContact() {
    final firstName = _firstNameController.text;
    final lastName = _lastNameController.text;
    final email = _emailController.text;
    final message = _messageController.text;

    if (_validateName(firstName) &&
        _validateName(lastName) &&
        _validateEmail(email) &&
        _validateMessage(message)) {
      setState(() {
        contactList.add(Contact(
          firstName: firstName,
          lastName: lastName,
          email: email,
          message: message,
        ));
        _customDialog(
          title: 'Data berhasil ditambahkan',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AddDialogWidgets(textLabel: 'First Name:', textValue: firstName),
              AddDialogWidgets(textLabel: 'Last Name:', textValue: lastName),
              AddDialogWidgets(textLabel: 'Email:', textValue: email),
              AddDialogWidgets(textLabel: 'Message:', textValue: message),
            ],
          ),
        );
        print(
          'firstName: $firstName, lastName: $lastName, email: $email, message: $message',
        );
        _resetField();
      });
    }
  }

  void _updateContact() {
    final firstName = _firstNameController.text;
    final lastName = _lastNameController.text;
    final email = _emailController.text;
    final message = _messageController.text;

    if (_validateName(firstName) &&
        _validateName(lastName) &&
        _validateEmail(email) &&
        _validateMessage(message) &&
        indexContact != -1 &&
        firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        email.isNotEmpty &&
        message.isNotEmpty) {
      setState(() {
        contactList[indexContact] = Contact(
          firstName: firstName,
          lastName: lastName,
          email: email,
          message: message,
        );
      });
      _customDialog(
        title: 'Data berhasil diubah!!',
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AddDialogWidgets(textLabel: 'First Name:', textValue: firstName),
            AddDialogWidgets(textLabel: 'Last Name:', textValue: lastName),
            AddDialogWidgets(textLabel: 'Email:', textValue: email),
            AddDialogWidgets(textLabel: 'Message:', textValue: message),
          ],
        ),
      );
      _resetField();
    }
  }

  void _deleteContact(int index) {
    setState(() {
      contactList.removeAt(index);
    });
    _customDialog(
      title: 'Data berhasil dihapus',
      content: const Text('Kontak berhasil dihapus dari daftar kontak anda'),
    );
  }

  void editContact(int index) {
    final contact = contactList[index];
    setState(() {
      _firstNameController.text = contact.firstName;
      _lastNameController.text = contact.lastName;
      _emailController.text = contact.email;
      _messageController.text = contact.message;
      indexContact = index;
    });
  }

  bool _validateName(String name) {
    final namePattern = RegExp(r"[A-Z][a-zA-Z]+$");
    if (!namePattern.hasMatch(name)) {
      _customDialog(
        title: 'Invalid Name',
        content: const Text(
            'Nama harus diawali dengan huruf kapital di setiap katanya, tidak boleh terdapat angka ataupun simbol'),
      );
      return false;
    }
    return true;
  }

  bool _validateEmail(String email) {
    final emailPattern =
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9^`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailPattern.hasMatch(email)) {
      _customDialog(
        title: 'Invalid Email',
        content: const Text(
            'Data harus bertipe email dan tidak boleh terdapat simbol, contoh: kurama16@gmail.com'),
      );
      return false;
    }
    return true;
  }

  bool _validateMessage(String message) {
    final messagePattern = RegExp(r"[A-Z][a-zA-Z]");
    if (!messagePattern.hasMatch(message) || (message.length > 70)) {
      _customDialog(
        title: 'Invalid Message',
        content: const Text(
            'Data tidak boleh kosong, harus diawali dengan huruf kapital dan maksimal 70 karakter'),
      );
      return false;
    }
    return true;
  }

  void _resetField() {
    _firstNameController.clear();
    _lastNameController.clear();
    _emailController.clear();
    _messageController.clear();
    indexContact = -1;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact App',
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Image(
            image: AssetImage('assets/image/background.jpg'),
            fit: BoxFit.cover,
            opacity: AlwaysStoppedAnimation(0.8),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                SizedBox(
                    height: height,
                    width: width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/image/address-book-solid.svg',
                          height: 70,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Contact App',
                          style: GoogleFonts.poppins(
                            fontSize: 34,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )),
                const TextDescriptionWidgets(),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFieldWidget(
                        labelText: 'First Name',
                        hintText: 'First Name',
                        controller: _firstNameController,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: TextFieldWidget(
                        labelText: 'Last Name',
                        hintText: 'Last Name',
                        controller: _lastNameController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                TextFieldWidget(
                  labelText: 'Email',
                  hintText: 'Email Addres',
                  controller: _emailController,
                ),
                const SizedBox(height: 16.0),
                TextFieldWidget(
                  labelText: 'Message',
                  hintText: 'Your Message',
                  controller: _messageController,
                  maxLines: 3,
                  messageLength: _messageLength,
                ),
                const SizedBox(height: 16.0),
                ButtonSubmitWidget(
                    isEditing: indexContact != -1,
                    onSubmit: () {
                      if (indexContact == -1) {
                        _addContact();
                      } else {
                        _updateContact();
                      }
                      setState(() {});
                    },
                    onClear: () {
                      _resetField();
                      setState(() {});
                    }),
                const SizedBox(
                  height: 16,
                ),
                Column(
                  children: [
                    Text(
                      'List of Contacts',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListViewWidgets(
                      contactList: contactList,
                      onEditPressed: editContact,
                      onDeletePressed: _deleteContact,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
