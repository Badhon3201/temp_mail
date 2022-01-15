import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:temp_mail/feature/auth/view_model/access_token_view_model.dart';
import 'package:temp_mail/feature/dashboard/repository/message_repository.dart';

import 'package:temp_mail/feature/dashboard/view/message_details_screen.dart';
import 'package:temp_mail/feature/dashboard/view/widgets/drawer.dart';
import 'package:temp_mail/feature/dashboard/view_model/message_list_view_model.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    var messageListVM =
        Provider.of<MessageListViewModel>(context, listen: false);
    Future.delayed(Duration.zero, () async {
      await Provider.of<AccessTokenProvider>(context, listen: false).getToken();
      await messageListVM.getMessageData();
    });

    super.initState();
  }
  // Future initState() async {
  //   // TODO: implement initState
  //   Future.delayed(Duration.zero, () async {
  //     await Provider.of<AccessTokenProvider>(context, listen: false).getToken();
  //     await MessageListRepositories().fetchMessages();
  //   });
  //
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    var messageListVM =
        Provider.of<MessageListViewModel>(context, listen: true);
    print("legth${messageListVM.messageListModel?.length}");
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color(0xff0F1827),
        drawer: SizedBox(
          width: width / 1.5,
          child: Drawer(
            child: AppDrawer(),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 55,
          title: const Center(child: Text('Inbox')),
          backgroundColor: const Color(0xff0F1827),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).backgroundColor, width: 2),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: ClipRRect(
                  child: const CircleAvatar(
                    child: Text('AK'),
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ],
        ),
        body: messageListVM.messageListModel == null
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 10, bottom: 25),
                    child: Text(
                      'Important',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: messageListVM.messageListModel?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              // print(
                              //     'aaaaa ${messageListVM.messageListModel?.hydraMember?.length}');
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => MessageDetailsScreen()));
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          ClipRRect(
                                            child: const CircleAvatar(
                                              radius: 25,
                                              child: Text('AK'),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text('Azosro',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text('Title of mail',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      letterSpacing: 1,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(
                                                  'Description of the description',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      letterSpacing: 1)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Text('Jan 12',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: 10,
                                    ),
                                    child: Divider(
                                      color: Colors.white,
                                      thickness: 0.5,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ));
  }
}
