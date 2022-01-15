import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temp_mail/feature/auth/view_model/sign_in_view_model.dart';
import 'package:temp_mail/feature/dashboard/view_model/account_view_model.dart';
import 'package:temp_mail/feature/dashboard/view_model/message_list_view_model.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    var asignVm = Provider.of<SignInViewModel>(context, listen: true);
    var messageListVM =
        Provider.of<MessageListViewModel>(context, listen: true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        Container(
          color: Color(0xff0F1827),
          height: 150,
          child: ListTile(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios, color: Colors.white)),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(4.0),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: ClipRRect(
                          child: CircleAvatar(
                            radius: 50,
                            child: Text(
                                "${messageListVM.messageListModel?.first.to?.first.address![0].toUpperCase()}${messageListVM.messageListModel?.first.to?.first.address![1].toUpperCase()}"),
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    Text(
                      "${messageListVM.messageListModel?.first.to?.first.address}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ///Inbox

                DrawerListWidget(
                  label: "Inbox",
                  icon: Icons.inbox,
                  color: const Color(0xff0F1827),
                  isSelected: true,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                DrawerListWidget(
                  label: "Refresh",
                  icon: Icons.refresh,
                  color: const Color(0xff0F1827),
                  isSelected: false,
                  onTap: () async {
                    Navigator.pop(context);
                    // await Future.wait([messageListVM.getMessageData()]);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// App Drawer item widget
class DrawerListWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final Function onTap;
  final Color? color;
  final Key? key;

  DrawerListWidget({
    required this.icon,
    required this.label,
    this.color,
    this.isSelected = false,
    required this.onTap,
    this.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected
          ? Theme.of(context).scaffoldBackgroundColor
          : Colors.transparent,
      child: Row(
        children: <Widget>[
          Container(
            color: isSelected
                ? Color(0xff0F1827)
                : Theme.of(context).scaffoldBackgroundColor,
            width: 4,
            height: AppBar().preferredSize.height,
          ),
          Expanded(
            child: ListTile(
              onTap: onTap as void Function()?,
              leading: Icon(
                icon,
                color: color ??
                    (isSelected
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).iconTheme.color),
              ),
              title: Text(
                label,
                style: TextStyle(
                    fontSize: 17, fontWeight: FontWeight.bold, color: color),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
