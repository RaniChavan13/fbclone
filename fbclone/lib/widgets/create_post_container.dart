import 'package:fbclone/models/user_model.dart';
import 'package:fbclone/widgets/widgets.dart';
import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;
  const CreatePostContainer({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop=Responsive.isDesktop(context); 
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop?5.0:0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)) : null,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        color: Colors.white,
        child: Column(children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // CircleAvatar(
              //   radius: 20.0,
              //   backgroundColor: Colors.grey[200],
              //   backgroundImage: CachedNetworkImageProvider(currentUser.imageUrl),
              // ),
              ProfileAvatar(imageUrl: currentUser.imageUrl),
              const SizedBox(
                width: 10.0,
              ),
              const Expanded(
                  child: TextField(
                decoration:
                    InputDecoration.collapsed(hintText: 'what\'s on your mind ?'),
              ))
            ],
          ),
          const Divider(
            height: 10.0,
            thickness: 0.5,
          ),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () => print('Live'),
                  icon: const Icon(Icons.videocam, color: Colors.red,),
                  label: const Text('Live'),
                ),
                const VerticalDivider(width: 8.0,),
                TextButton.icon(
                  onPressed: () => print('photo'),
                  icon: const Icon(Icons.photo_library, color: Colors.green,),
                  label:const Text('Photo'),
                ),
                const VerticalDivider(width: 8.0,),
                TextButton.icon(
                  onPressed: () => print('Room'),
                  icon:const Icon(Icons.video_call, color: Colors.purple,),
                  label:const Text('Room'),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
