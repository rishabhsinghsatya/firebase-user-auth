import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:user_auth/ui/auth/login_screen.dart';
import 'package:user_auth/ui/post/add_post.dart';
import 'package:user_auth/utils/utils.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut().then((value) {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()))
                      .onError((error, stackTrace) {
                    utils().toastMessage(error.toString());
                  });
                });
              },
              icon: Icon(Icons.logout)),
          SizedBox(
            width: 10,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddPostScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
