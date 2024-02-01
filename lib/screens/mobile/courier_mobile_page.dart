import 'package:flutter/material.dart';

const List<Icon> list = <Icon>[
  Icon(Icons.agriculture),
  Icon(Icons.fire_truck),
  Icon(Icons.accessible_forward_sharp)
];

class CourierMobilePage extends StatefulWidget {
  const CourierMobilePage({super.key});

  @override
  State<CourierMobilePage> createState() => _CourierMobilePageState();
}

class _CourierMobilePageState extends State<CourierMobilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      appBar: AppBar(
          leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      )),
      body: const Center(
        child: Text('текст'),
      ),
    );
  }
}

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        UserAccountsDrawerHeader(
          accountName: const Text(
            'name',
            style:
                TextStyle(fontFamily: 'Comfortaa', fontWeight: FontWeight.w500),
          ),
          accountEmail: const Text(
            'number',
            style:
                TextStyle(fontFamily: 'Comfortaa', fontWeight: FontWeight.w500),
          ),
          currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.grey[100],
              radius: 50,
              child: const Icon(Icons.account_circle_rounded,
                  color: Colors.black, size: 50)),
          decoration: BoxDecoration(color: Colors.blueGrey[100]),
        ),
        const ListTile(
          title: Row(children: [
            Text('Вид транспорта',
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w500,
                )),
            ListBox(),
          ]),
        )
      ],
    ));
  }
}

class ListBox extends StatefulWidget {
  const ListBox({super.key});

  @override
  State<ListBox> createState() => _ListBoxState();
}

class _ListBoxState extends State<ListBox> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  ValueNotifier<Icon> _selectedIcon = ValueNotifier<Icon>(list.first);
  @override
  Widget build(BuildContext context) {
    return DropdownButton<Icon>(
      key: _scaffoldKey,
      value: _selectedIcon.value,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(),
      items: list.map<DropdownMenuItem<Icon>>((Icon value) {
        return DropdownMenuItem<Icon>(value: value, child: value);
      }).toList(),
      onChanged: (newIcon) {
        setState(() {
          _selectedIcon.value = newIcon!;
        });
      },
    );
  }
}
