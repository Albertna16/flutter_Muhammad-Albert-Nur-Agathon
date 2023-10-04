part of 'contact_bloc.dart';

sealed class ContactState extends Equatable {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  Color currentColor = Colors.green;
  DateTime currentDate = DateTime.now();
  PlatformFile selectedFile = PlatformFile(name: '', path: '', size: 0);
  int indexContact = -1;

  ContactState({
    required this.nameController,
    required this.numberController,
    required this.currentColor,
    required this.currentDate,
    required this.selectedFile,
    required this.indexContact,
  });

  @override
  List<Object> get props => [
        nameController,
        numberController,
        currentColor,
        currentDate,
        selectedFile,
        indexContact
      ];
}

final class ContactInitial extends ContactState {
  ContactInitial()
      : super(
          nameController: TextEditingController(),
          numberController: TextEditingController(),
          currentColor: Colors.green,
          currentDate: DateTime.now(),
          selectedFile: PlatformFile(name: '', path: '', size: 0),
          indexContact: -1,
        );
}
