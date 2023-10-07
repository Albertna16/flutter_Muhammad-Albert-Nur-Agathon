part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class AddContactEvent extends ContactEvent {
  final String name;
  final String number;

  const AddContactEvent({
    required this.name,
    required this.number,
  });

  @override
  List<Object> get props => [name, number];
}

class UpdateContactEvent extends ContactEvent {
  final int index;
  final String name;
  final String number;

  const UpdateContactEvent({
    required this.index,
    required this.name,
    required this.number,
  });

  @override
  List<Object> get props => [index, name, number];
}

class DeleteContactEvent extends ContactEvent {
  final int index;

  const DeleteContactEvent({required this.index});

  @override
  List<Object> get props => [index];
}

class EditContactEvent extends ContactEvent {
  final int index;

  const EditContactEvent({required this.index});

  @override
  List<Object> get props => [index];
}

class ClearContactEvent extends ContactEvent {}