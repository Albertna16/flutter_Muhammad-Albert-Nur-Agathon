part of 'contact_bloc.dart';

sealed class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class AddContactEvent extends ContactEvent {
  final String name;
  final String number;
  final Color color;
  final DateTime date;
  final PlatformFile file;

  const AddContactEvent({
    required this.name,
    required this.number,
    required this.color,
    required this.date,
    required this.file,
  });

  @override
  List<Object> get props => [name, number, color, date, file];
}

class UpdateContactEvent extends ContactEvent {
  final int index;
  final String name;
  final String number;
  final Color color;
  final DateTime date;
  final PlatformFile file;

  const UpdateContactEvent({
    required this.index,
    required this.name,
    required this.number,
    required this.color,
    required this.date,
    required this.file,
  });

  @override
  List<Object> get props => [index, name, number, color, date, file];
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

class PickFileEvent extends ContactEvent {}

class OpenFileEvent extends ContactEvent {}

class ClearFileEvent extends ContactEvent {}
