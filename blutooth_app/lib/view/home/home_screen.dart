import 'package:blutooth_app/styles/colors.dart';
import 'package:blutooth_app/styles/text_styles.dart';
import 'package:blutooth_app/view/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../search/search_person.dart';

class HomeScreen extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(name: 'John Doe', message: 'Available', time: '', unreadCount: 0),
    Contact(name: 'Jane Smith', message: 'Available', time: '', unreadCount: 0),
    Contact(name: 'Sam Wilson', message: 'Available', time: '', unreadCount: 0),
    // Add more contacts here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome', style: const TextStyle().s22.bold.dark),
                  Text('Hira Raza',
                      style: const TextStyle().s16.meduim.primary),
                ],
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.primary.withOpacity(.5)),
              child: Icon(
                Icons.edit,
                size: 14,
                color: AppColors.white,
              ),
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.primary.withOpacity(.3),
                  child: Text(contact.name[0]),
                ),
                title: Text(contact.name),
                subtitle: Text(contact.message),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(contact.time),
                    if (contact.unreadCount > 0)
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${contact.unreadCount}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatScreen()),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Divider(height: 3),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchBluetoothDevices()),
            );
          },
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.chat)),
    );
  }
}

class Contact {
  final String name;
  final String message;
  final String time;
  final int unreadCount;

  Contact(
      {required this.name,
      required this.message,
      required this.time,
      required this.unreadCount});
}
