import 'package:fbclone/models/user_model.dart';
import 'package:fbclone/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final List<User> users;
  const ContactList({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280.0),
      child: Column(children: [
        Row(
          children: [
            Expanded(child: Text('Contacts', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),),),
            Icon(Icons.search,
            color: Colors.grey.shade600,),
            const SizedBox(width: 8.0,),
            Icon(Icons.more_horiz,
            color: Colors.grey.shade600,),
          ],),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index){
                final User user=users[index];
                return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: UserCard(user:user),);
              }),
          )
      ]),
    );
  }
}