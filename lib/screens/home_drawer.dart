import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          createDrawerBodyItem(
              icon: Icons.home,
              text: 'Home',
              onTap: () => {Scaffold.of(context).openEndDrawer()}),
          createDrawerBodyItem(
              icon: Icons.account_circle,
              text: 'Profile',
              onTap: () => {Scaffold.of(context).openEndDrawer()}),
          createDrawerBodyItem(
              icon: Icons.event_note,
              text: 'Events',
              onTap: () => {Scaffold.of(context).openEndDrawer()}),
          Divider(),
          createDrawerBodyItem(
              icon: Icons.notifications_active,
              text: 'Notifications',
              onTap: () => {Scaffold.of(context).openEndDrawer()}),
          ListTile(
            title: Text('App version 1.0.0'),
            onTap: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ],
      ),
    );
  }

  Widget createDrawerHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/icon_list.png'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Welcome to Flutter",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget createDrawerBodyItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
