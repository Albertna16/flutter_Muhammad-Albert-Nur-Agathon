import 'package:code_competence_2/models/contact_models.dart';
import 'package:code_competence_2/models/tourismplace_models.dart';
import 'package:code_competence_2/widgets/add_dialog_widgets.dart';
import 'package:code_competence_2/widgets/button_submit_widgets.dart';
import 'package:code_competence_2/widgets/text_description_widgets.dart';
import 'package:code_competence_2/widgets/text_field_widgets.dart';
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
      });
    }
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
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      endDrawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Menu App',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Contact Us',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'About Us',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Login',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                        ),
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
                  hintText: 'Email Address',
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
                  onSubmit: () {
                    _addContact();
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'About Us',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tourismPlaceList.length,
                    itemBuilder: (context, index) {
                      TourismPlace place = tourismPlaceList[index];
                      return Container(
                        width: 200,
                        margin: const EdgeInsets.only(right: 10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                                child: Image.network(
                                  "${place.imageAsset}",
                                  height: 100,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${place.name}"),
                                    Text("${place.location}"),
                                    Text("${place.openDays}"),
                                    Text("${place.openTime}"),
                                    Text("${place.ticketPrice}"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Pesan'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
