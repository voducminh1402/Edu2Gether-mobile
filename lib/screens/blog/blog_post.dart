import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'blog_post_body.dart';

class BlogPostPage extends StatefulWidget {
  const BlogPostPage({Key? key}) : super(key: key);

  @override
  State<BlogPostPage> createState() => _BlogPostPageState();
}

class _BlogPostPageState extends State<BlogPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //show header
        children: [
          Container(
            margin: EdgeInsets.only(top: 24, bottom: 12, left: 24, right: 24),
            padding: EdgeInsets.only(top: 9.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(right: 10),
                        child: Icon(Icons.arrow_back, color: Colors.black, size: 30,),
                      ),
                    ),
                  ],
                ),
                Container(
                    width: 40,
                    height: 40,
                    child: Icon(Icons.more_horiz_outlined, color: Colors.black, size: 30,)
                ),
              ],
            ),
          ),
          //show body
          Expanded(child: SingleChildScrollView(
            child: BlogPostBody(),
          )
          ),
        ],
      ),
    );
  }
}
