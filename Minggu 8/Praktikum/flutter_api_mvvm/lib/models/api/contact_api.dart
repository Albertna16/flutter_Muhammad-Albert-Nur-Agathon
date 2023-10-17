import 'package:dio/dio.dart';
import 'package:flutter_api_mvvm/models/contact_models.dart';

class ContactApi {
  static Future<List<ContactModels>> getContact() async {
    List<ContactModels> contactList = [];
    final response = await Dio().get(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts');

    List<dynamic> contactData = response.data;
    for (var element in contactData) {
      contactList.add(ContactModels.fromJson(element));
    }

    return contactList;
  }

  static Future<ContactModels> postContact(ContactModels newContact) async {
    final response = await Dio().post(
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
      data: newContact.toJson(),
    );
      return ContactModels.fromJson(response.data);
  }
}
