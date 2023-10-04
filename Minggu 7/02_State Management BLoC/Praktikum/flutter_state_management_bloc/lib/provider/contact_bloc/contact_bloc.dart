import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_management_bloc/models/contact_models.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as path;

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial()) {
    on<AddContactEvent>(_addContactEvent);
    on<UpdateContactEvent>(_updateContactEvent);
    on<DeleteContactEvent>(_deleteContactEvent);
    on<EditContactEvent>(_editContactEvent);
    on<ClearContactEvent>(_clearContactEvent);
    on<PickFileEvent>(_pickFileEvent);
    on<OpenFileEvent>(_openFileEvent);
    on<ClearFileEvent>(_clearFileEvent);
  }

  void _addContactEvent(AddContactEvent event, Emitter<ContactState> emit) {
    contactList.add(
      ContactModels(
        name: event.name,
        number: event.number,
        color: event.color,
        date: event.date,
        file: event.file,
      ),
    );
    print(
      "Name: ${event.name}, Number: ${event.number}, Color: ${event.color}, Date: ${DateFormat('EEEE, dd-MM-yyyy').format(event.date)}, File: ${path.basename((event.file.path).toString())}",
    );
    emit(ContactInitial());
  }

  void _updateContactEvent(
      UpdateContactEvent event, Emitter<ContactState> emit) {
    final name = event.name;
    final number = event.number;
    contactList[event.index] = ContactModels(
      name: name,
      number: number,
      color: event.color,
      date: event.date,
      file: event.file,
    );
    print(
      "Name: $name, Number: $number, Color: ${event.color}, Date: ${DateFormat('EEEE, dd-MM-yyyy').format(event.date)}, File: ${path.basename((event.file.path).toString())}",
    );
    emit(ContactInitial());
  }

  void _deleteContactEvent(
      DeleteContactEvent event, Emitter<ContactState> emit) {
    contactList.removeAt(event.index);
    emit(ContactInitial());
  }

  void _editContactEvent(EditContactEvent event, Emitter<ContactState> emit) {
    final contact = contactList[event.index];
    final currentState = state as ContactInitial;
    currentState.nameController.text = contact.name;
    currentState.numberController.text = contact.number;
    currentState.currentColor = contact.color;
    currentState.currentDate = contact.date;
    currentState.selectedFile = contact.file;
    currentState.indexContact = event.index;
    emit(currentState);
  }

  void _clearContactEvent(ClearContactEvent event, Emitter<ContactState> emit) {
    final currentState = state as ContactInitial;
    currentState.nameController.clear();
    currentState.numberController.clear();
    currentState.currentColor = Colors.green;
    currentState.currentDate = DateTime.now();
    currentState.selectedFile = PlatformFile(name: '', path: '', size: 0);
    currentState.indexContact = -1;
    emit(currentState);
  }

  void _pickFileEvent(PickFileEvent event, Emitter<ContactState> emit) async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) {
      return;
    }
    final file = result.files.first;
    final currentState = state as ContactInitial;
    currentState.selectedFile = file;
    emit(currentState);
  }

  void _openFileEvent(OpenFileEvent event, Emitter<ContactState> emit) {
    final currentState = state as ContactInitial;
    OpenFile.open(currentState.selectedFile.path);
    emit(currentState);
  }

  void _clearFileEvent(ClearFileEvent event, Emitter<ContactState> emit) {
    
  }
}
