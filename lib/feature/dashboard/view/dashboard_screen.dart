import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:temp_mail/feature/auth/view_model/access_token_view_model.dart';
import 'package:temp_mail/feature/auth/view_model/sign_in_view_model.dart';
import 'package:temp_mail/feature/dashboard/repository/message_repository.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:temp_mail/feature/dashboard/view/message_details_screen.dart';
import 'package:temp_mail/feature/dashboard/view/widgets/drawer.dart';
import 'package:temp_mail/feature/dashboard/view_model/account_view_model.dart';
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
    var accountViewModel =
        Provider.of<AccountViewModel>(context, listen: false);
    var asignVm = Provider.of<SignInViewModel>(context, listen: false);
    // messageDetailsModel
    Future.delayed(Duration.zero, () async {
      await Provider.of<AccessTokenProvider>(context, listen: false).getToken();
      await messageListVM.getMessageData();
      await accountViewModel.getData(id: asignVm.groupName);
    });

    super.initState();
  }

  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var asignVm = Provider.of<SignInViewModel>(context, listen: true);
    var messageListVM =
        Provider.of<MessageListViewModel>(context, listen: true);
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
                  child: CircleAvatar(
                    child: Text(
                        '${messageListVM.messageListModel?.first.to?.first.address![0].toUpperCase()}${messageListVM.messageListModel?.first.to?.first.address![1].toUpperCase()}'),
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
                              var messageDetailsVM =
                                  Provider.of<MessageListViewModel>(context,
                                      listen: false);
                              Future.delayed(Duration.zero, () async {
                                await messageDetailsVM
                                    .getMessageDetailsData(
                                        id: messageListVM
                                            .messageListModel![index].id)
                                    .then((value) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MessageDetailsScreen()));
                                });
                              });
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
                                            child: CircleAvatar(
                                              radius: 25,
                                              child: Text(
                                                  '${messageListVM.messageListModel![index].from!.name![0]}${messageListVM.messageListModel![index].from!.name![1]}'),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.55,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    '${messageListVM.messageListModel![index].from!.name}',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(
                                                    '${messageListVM.messageListModel![index].subject}',
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontSize: 14,
                                                        letterSpacing: 1,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(
                                                    '${messageListVM.messageListModel![index].intro}',
                                                    style: const TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        color: Colors.white,
                                                        letterSpacing: 1)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          DateFormat("dd-mm")
                                                      .format(messageListVM
                                                              .messageListModel![
                                                                  index]
                                                              .createdAt
                                                          as DateTime)
                                                      .toString() ==
                                                  DateFormat("dd-mm")
                                                      .format(now)
                                                      .toString()
                                              ? Text(
                                                  '${DateFormat("HH:mm").format(now)}',
                                                  style: const TextStyle(
                                                      color: Colors.white))
                                              : Text(
                                                  '${DateFormat("MMM dd").format(messageListVM.messageListModel![index].createdAt as DateTime).toString()}',
                                                  style: const TextStyle(
                                                      color: Colors.white)),
                                          IconButton(
                                              onPressed: () {
                                                _showSignInDialog(messageListVM
                                                    .messageListModel![index]
                                                    .id);
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Colors.white,
                                                size: 20,
                                              ))
                                        ],
                                      ),
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

  _showSignInDialog(String? id) {
    var messageListVM =
        Provider.of<MessageListViewModel>(context, listen: false);
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              height: 180,
              width: 300,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8, top: 15, bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Delete Email",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          decoration: TextDecoration.none,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Do you want to Delete ?",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          decoration: TextDecoration.none),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            // color: Color(0XFFFE5C45),
                            color: Colors.black,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "No",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            // color: Color(0XFFFE5C45),
                            color: Colors.black,
                            onPressed: () async {
                              await MessageListRepositories()
                                  .deleteMessages(id: id);
                              Future.wait([messageListVM.getMessageData()]);
                              Navigator.pop(context);
                              BotToast.showText(text: 'Deleted Successful');
                              // Provider.of<MessageListViewModel>(context,
                              //         listen: false)
                              //     .messageListModel;
                            },
                            child: const Text(
                              "Yes",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
