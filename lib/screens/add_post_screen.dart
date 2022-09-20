import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text('Post to'),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'data',
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png"),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Write a caption... ',
                    border: InputBorder.none,
                  ),
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 45.0,
                width: 45.0,
                child: AspectRatio(
                  aspectRatio: 487 / 451,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            alignment: FractionalOffset.topCenter,
                            //image: MemoryImage(_file!),
                            image: NetworkImage(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Cuesta_del_obispo_01.jpg/640px-Cuesta_del_obispo_01.jpg'))),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
