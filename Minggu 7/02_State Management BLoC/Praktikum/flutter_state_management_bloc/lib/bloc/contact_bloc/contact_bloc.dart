import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_management_bloc/models/contact_models.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial()) {
    on<AddContactEvent>(_addContactEvent);
    on<UpdateContactEvent>(_updateContactEvent);
    on<DeleteContactEvent>(_deleteContactEvent);
    on<EditContactEvent>(_editContactEvent);
    on<ClearContactEvent>(_clearContactEvent);
  }

  void _addContactEvent(AddContactEvent event, Emitter<ContactState> emit) {
    contactList.add(
      ContactModels(
        name: event.name,
        number: event.number,
      ),
    );
    print(
      "Name: ${event.name}, Number: ${event.number})}",
    );
    emit(ContactInitial());
  }

  void _updateContactEvent(
      UpdateContactEvent event, Emitter<ContactState> emit) {
    contactList[event.index] = ContactModels(
      name: event.name,
      number: event.number,
    );
    print(
      "Name: ${event.name}, Number: ${event.number})}",
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
    currentState.indexContact = event.index;
    emit(currentState);
  }

  void _clearContactEvent(ClearContactEvent event, Emitter<ContactState> emit) {
    final currentState = state as ContactInitial;
    currentState.nameController.clear();
    currentState.numberController.clear();
    currentState.indexContact = -1;
    emit(currentState);
  }
}
