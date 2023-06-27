import 'package:flutter/material.dart';
import 'package:post_api/network_api.dart';
import 'package:post_api/post_model.dart';

class PostApiDemo extends StatefulWidget {
  const PostApiDemo({super.key});

  @override
  State<PostApiDemo> createState() => _PostApiDemoState();
}

class _PostApiDemoState extends State<PostApiDemo> {
  TextEditingController txtUserId = TextEditingController();
  TextEditingController txtBody = TextEditingController();
  TextEditingController txtTitle = TextEditingController();
  LogInResponse? loginResp;
  bool loading = false;
  List<LogInRequest> logInRequest = [];
  getData() async {
    loading = true;
    logInRequest = await NetworkApi.fetchData();
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: txtUserId),
              TextField(controller: txtTitle),
              TextField(controller: txtBody),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () async {
                  LogInRequest req = LogInRequest(
                    userId: int.parse(txtUserId.text),
                    title: txtTitle.text,
                    body: txtBody.text,
                  );
                  loginResp = await NetworkApi.sendData(req);
                  setState(() {});
                },
                color: Colors.blue,
                child: const Text('Submit'),
              ),
              const SizedBox(
                height: 100,
              ),
              loginResp == null
                  ? const Text('No Data')
                  : Expanded(
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (notification) {
                          notification.disallowIndicator();
                          return true;
                        },
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: logInRequest.length,
                          itemBuilder: (context, index) => Text(
                            logInRequest[index].title,
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
