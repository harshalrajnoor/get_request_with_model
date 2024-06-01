import 'package:flutter/material.dart';
import 'package:get_request/api_services.dart';
import 'package:get_request/single_post_model.dart';

class SinglePostPage extends StatefulWidget {
  const SinglePostPage({super.key});

  @override
  State<SinglePostPage> createState() => _SinglePostPageState();
}

class _SinglePostPageState extends State<SinglePostPage> {
  bool isReady = false;
  SinglePostModel singlePostModel = SinglePostModel();

  _getSinglePost() {
    ApiServices().getSinglePost().then((value) {
      setState(() {
        singlePostModel = value!;
        isReady = false;
      });
    }).onError((error, stackTrace) {
      print(error);
      setState(() {
        isReady = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _getSinglePost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Single Post Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: isReady
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    singlePostModel.id.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    singlePostModel.title.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    singlePostModel.body.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
    );
  }
}
