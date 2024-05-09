import 'package:fbclone/config/palette.dart';
import 'package:fbclone/models/user_model.dart';
import 'package:fbclone/widgets/profile_avatar.dart';
import 'package:fbclone/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;
  const Rooms({super.key, required this.onlineUsers});

  @override
  Widget build(BuildContext context) {
   final bool isDesktop=Responsive.isDesktop(context); 
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop?5.0:0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)) : null,
      child: Container(
        height: 60.0,
        color: Colors.white,
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),
            scrollDirection: Axis.horizontal,
            itemCount: 1 + onlineUsers.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: _CreateRoomButton(),
                );
              }
              final User user = onlineUsers[index - 1];
              // return Container(
              //   margin: const EdgeInsets.all(2.0),
              //   height: 20.0,
              //   width: 20.0,
              //   color: Colors.red,
              // );
              return Padding(
                padding: const EdgeInsets.all(3.0),
                child: ProfileAvatar(
                  imageUrl: user.imageUrl,
                  isActive: true,
                ),
              );
            }),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () => print('Create Room'),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(width: 3.0, color: Colors.blueAccent.shade100),
          ),
          foregroundColor:
              MaterialStateProperty.all<Color>(Palette.facebookBlue),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        child:const Row(
          children: [
            // ShaderMask(
            //     shaderCallback: (rect) =>
            //         Palette.createRoomGradient.createShader(rect),
            //     child: const Icon(
            //       Icons.video_call,
            //       size: 35.0,
            //       color: Colors.white,
            //     )),
            Icon(
                  Icons.video_call,
                  size: 35.0,
                  color: Color.fromARGB(255, 147, 71, 219),
                ),
             SizedBox(
              width: 4.0,
            ),
            Text('Create\nRoom')
          ],
        ));
  }
}
