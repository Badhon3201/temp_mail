import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:temp_mail/feature/dashboard/view_model/message_list_view_model.dart';

class MessageDetailsScreen extends StatefulWidget {
  // final String id;
  // MessageDetailsScreen({required this.id});

  @override
  _MessageDetailsScreenState createState() => _MessageDetailsScreenState();
}

class _MessageDetailsScreenState extends State<MessageDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    // var messageDetailsVM =
    //     Provider.of<MessageListViewModel>(context, listen: false);
    // // messageDetailsModel
    // Future.delayed(Duration.zero, () async {
    //   await messageDetailsVM.getMessageDetailsData(widget.id);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var messageListVM =
        Provider.of<MessageListViewModel>(context, listen: true);
    return Scaffold(
        backgroundColor: const Color(0xff0F1827),
        appBar: AppBar(
          elevation: 0,
          title: const Text('Message'),
          backgroundColor: const Color(0xff0F1827),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            child: CircleAvatar(
                              radius: 25,
                              child: Text(
                                  '${messageListVM.messageDetailsModel?.from?.name![0]}${messageListVM.messageDetailsModel?.from?.name![1]}'),
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  '${messageListVM.messageDetailsModel?.from?.address}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.mail,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                      '${messageListVM.messageDetailsModel?.to?.first.address}',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        DateFormat("MMM dd")
                            .format(messageListVM.messageDetailsModel!.createdAt
                                as DateTime)
                            .toString(),
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: Text(
                          '${messageListVM.messageDetailsModel?.text}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
