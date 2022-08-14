import 'package:bmnav_null_safety/bmnav_null_safety.dart' as bmnav;
import 'package:flutter/material.dart';
import 'package:tokofebri/app/module/home/view/home_view.dart';
import 'package:tokofebri/component/custom_bottom.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({Key? key}) : super(key: key);

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  int currentTab = 0;
  List screens = [
    const HomeView(),
    const HomeView(),
    const HomeView(),
    const HomeView(),
  ];
  Widget currentScreen = const HomeView();
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          controller: controller,
          onPageChanged: (page) {
            setState(() {
              currentTab = page;
            });
          },
          itemBuilder: (context, position) {
            return Center(
              child: screens[currentTab],
            );
          }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: bmnav.BottomNav(
          iconStyle: const bmnav.IconStyle(onSelectColor: Colors.indigo),
          color: Colors.white,
          index: currentTab,
          labelStyle: const bmnav.LabelStyle(
            visible: true,
            onSelectTextStyle: TextStyle(color: Colors.indigo),
          ),
          onTap: (i) {
            setState(() {
              currentTab = i;
              currentScreen = screens[i];
            });
          },
          items: const [
            bmnav.BottomNavItem(icon: Icons.home, label: 'Home'),
            bmnav.BottomNavItem(icon: Icons.paid, label: 'Transaksi'),
            bmnav.BottomNavItem(icon: Icons.mail, label: 'Inbox'),
            bmnav.BottomNavItem(icon: Icons.account_circle, label: 'Akun')
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.expand_less,
          color: Colors.indigo,
          size: 30,
        ),
        onPressed: () {
          expandBotton();
        },
      ),
    );
  }

  bottom() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 100,
            color: Colors.amber,
          );
        });
  }

  void expandBotton() {
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return CustomBottomSheet(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: const Text(
                  'Feature',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  children: [
                    IconButton(
                      color: Colors.amber,
                      onPressed: () {},
                      icon: const Icon(Icons.movie),
                    ),
                    IconButton(
                      color: Colors.red,
                      onPressed: () {},
                      icon: const Icon(Icons.access_time),
                    ),
                    IconButton(
                      color: Colors.green,
                      onPressed: () {},
                      icon: const Icon(Icons.radio_rounded),
                    ),
                    IconButton(
                      color: Colors.purple,
                      onPressed: () {},
                      icon: const Icon(Icons.add_call),
                    ),
                    IconButton(
                      color: Colors.blue,
                      onPressed: () {},
                      icon: const Icon(Icons.add_a_photo),
                    ),
                    IconButton(
                      color: Colors.grey,
                      onPressed: () {},
                      icon: const Icon(Icons.ac_unit),
                    ),
                    IconButton(
                      color: Colors.redAccent,
                      onPressed: () {},
                      icon: const Icon(Icons.add_comment),
                    ),
                    IconButton(
                      color: Colors.blueAccent,
                      onPressed: () {},
                      icon: const Icon(Icons.photo),
                    ),
                    IconButton(
                      color: Colors.blueGrey,
                      onPressed: () {},
                      icon: const Icon(Icons.local_shipping),
                    ),
                    IconButton(
                      color: Colors.orange,
                      onPressed: () {},
                      icon: const Icon(Icons.play_circle),
                    ),
                    IconButton(
                      color: Colors.greenAccent,
                      onPressed: () {},
                      icon: const Icon(Icons.golf_course),
                    ),
                    IconButton(
                      color: Colors.brown,
                      onPressed: () {},
                      icon: const Icon(Icons.store),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
