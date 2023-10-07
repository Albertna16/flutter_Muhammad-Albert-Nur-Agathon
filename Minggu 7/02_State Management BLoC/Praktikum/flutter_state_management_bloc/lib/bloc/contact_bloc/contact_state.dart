// ignore_for_file: must_be_immutable

part of 'contact_bloc.dart';

sealed class ContactState extends Equatable {
  late TextEditingController nameController;
  late TextEditingController numberController;
  late int indexContact;

  ContactState(
    this.nameController,
    this.numberController,
    this.indexContact,
  );

  @override
  List<Object> get props => [
        nameController,
        numberController,
        indexContact
      ];
}

final class ContactInitial extends ContactState {
  ContactInitial()
      : super(
          TextEditingController(),
          TextEditingController(),
          -1,
        );
}