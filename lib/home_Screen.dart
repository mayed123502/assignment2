import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> elementList = [
    "FIRST ELEMENT",
    "SECOND ELEMENT",
    "THIRD ELEMENT",
    "FORTH ELEMENT",
    "FIFTHE ELEMENT",
  ];

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation;
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      drawer:isPortrait == Orientation.portrait? Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Colors.white.withOpacity(.7)),
        child: Container(
          width: queryData.size.width / 1.36,
          child: Drawer(
            child: Padding(
              padding: const EdgeInsets.only(top: 115, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: elementList
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          e,
                          style: const TextStyle(fontSize: 22),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ):null,
      appBar: AppBarWidget(isPortrait: isPortrait),
      body: isPortrait == Orientation.portrait
          ? Container(
              color: const Color.fromRGBO(201, 81, 81, 1),
            )
          : Container(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, top: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: elementList
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Text(
                                      e,
                                      style: const TextStyle(fontSize: 22),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        )),
                  ),
                  Expanded(
                    child: Container(
                      color:const Color.fromRGBO(201, 81, 81, 1),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  AppBarWidget({
    required this.isPortrait,
  });

  final Orientation isPortrait;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: isPortrait == Orientation.portrait
          ? Builder(builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 50,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            })
          : null,
      title: const Text("SECOND ASIGNMENT"),
      backgroundColor: const Color.fromRGBO(181, 81, 234, 1),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
