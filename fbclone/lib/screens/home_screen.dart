import 'package:fbclone/config/palette.dart';
import 'package:fbclone/data/data.dart';
import 'package:fbclone/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:fbclone/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

final TrackingScrollController _trackingScrollController=TrackingScrollController();
@override
  void dispose() {
    // TODO: implement dispose
    _trackingScrollController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child:  Scaffold(
        body: Responsive(
          mobile:_HomeScreenMobile(scrollController: _trackingScrollController,),
          desktop: _HomeScreenDesktop(scrollController: _trackingScrollController),
          
      ),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController scrollController;

  const _HomeScreenMobile({super.key,  required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                title: const Text(
                  'facebook',
                  style: TextStyle(
                    color: Palette.facebookBlue,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.2,
                  ),
                ),
                centerTitle: false,
                systemOverlayStyle: SystemUiOverlayStyle.light,
                floating: true,
                actions: [
                  CircleButton(
                    icon: Icons.search,
                    iconSize: 30.0,
                    onPressed: () {},
                  ),
                  CircleButton(
                    icon: MdiIcons.facebookMessenger,
                    iconSize: 30.0,
                    onPressed: () {},
                  ),
                ],
              ),
              SliverToBoxAdapter(
                // child: Container(
                //   height: 100.0,
                //   color: Colors.red,
                child: CreatePostContainer(currentUser: currentUser),
              ),
              // SliverPadding
              // sliverList
              // sliverGrid
              SliverPadding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                  sliver: SliverToBoxAdapter(
                    child: Rooms(onlineUsers: onlineUsers),
                  )),
              SliverPadding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                  sliver: SliverToBoxAdapter(
                    child: Stories(currentUser: currentUser, stories: stories),
                  )),
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                final Post post = posts[index];
                return PostContainer(post: post);
              }, childCount: posts.length))
            ],
          );
        
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;
  const _HomeScreenDesktop({super.key, required this.scrollController});@override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
          child: Padding(padding: EdgeInsets.all(12.0),
          child: MoreOptionList(currentUser:currentUser),),
        ),
        ),
        const Spacer(),
        Container(
          width: 600.0,
         child: CustomScrollView(
           controller: scrollController,
            slivers: [
              // SliverAppBar(
              //   backgroundColor: Colors.white,
              //   title: const Text(
              //     'facebook',
              //     style: TextStyle(
              //       color: Palette.facebookBlue,
              //       fontSize: 28.0,
              //       fontWeight: FontWeight.bold,
              //       letterSpacing: -1.2,
              //     ),
              //   ),
              //   centerTitle: false,
              //   systemOverlayStyle: SystemUiOverlayStyle.light,
              //   floating: true,
              //   actions: [
              //     CircleButton(
              //       icon: Icons.search,
              //       iconSize: 30.0,
              //       onPressed: () {},
              //     ),
              //     CircleButton(
              //       icon: MdiIcons.facebookMessenger,
              //       iconSize: 30.0,
              //       onPressed: () {},
              //     ),
              //   ],
              // ),
              SliverPadding(
                  padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                  sliver: SliverToBoxAdapter(
                    child: Stories(currentUser: currentUser, stories: stories),
                  )),

              SliverToBoxAdapter(
                // child: Container(
                //   height: 100.0,
                //   color: Colors.red,
                child: CreatePostContainer(currentUser: currentUser),
              ),
              // SliverPadding
              // sliverList
              // sliverGrid
              SliverPadding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                  sliver: SliverToBoxAdapter(
                    child: Rooms(onlineUsers: onlineUsers),
                  )),
             
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                final Post post = posts[index];
                return PostContainer(post: post);
              }, childCount: posts.length))
            ],
          ),
        ),
        const Spacer(),
       Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
          child: Padding(padding: EdgeInsets.all(12.0),
          child: ContactList(users:onlineUsers),),
        ),
        ),
      ],
    );
  }
}

