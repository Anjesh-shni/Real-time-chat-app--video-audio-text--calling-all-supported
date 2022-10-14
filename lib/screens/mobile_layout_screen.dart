import 'package:flutter/material.dart';
import 'package:video_chat/features/select_contact/screen/select_contact_screen.dart';
import '../widgets/contacts_list.dart';

class MobileLayoutScreen extends StatelessWidget {
  const MobileLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.blueGrey.shade500,
        centerTitle: false,
        shadowColor: Colors.black,
        title: const Text(
          'Chats',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.amber),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.amber),
            onPressed: () {},
          ),
        ],
      ),
      body: const ContactsList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            SelectContactScreen.routeName,
          );
        },
        backgroundColor: Colors.amber,
        child: const Icon(
          Icons.comment,
          color: Colors.black,
        ),
      ),
    );
  }
}
