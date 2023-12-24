import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma_web/screens/catigory_page.dart';
import 'package:pharma_web/screens/medicin_form.dart';

import '../data/category_list.dart';
import '../providers/auth_data_provider.dart';
import '../providers/user_provider.dart';
import '../services/get_categories_service.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();


  @override
  void initState() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tokenReader =ref.read(tokenProvider);
    _onAddSellected()async{
      var temp = await AllCategoryService().getAllCategory(tokenReader.toString());
      categoryList=temp;

      return temp;
    }

    return Scaffold(
      appBar: AppBar(
        title:Text (ref.watch(userProvider)!.name!
             ),
        backgroundColor: const Color.fromARGB(255, 70, 201, 210),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: sideMenu,
            style: SideMenuStyle(
              // showTooltip: false,
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Colors.blue[100],
              selectedHoverColor: Colors.blue[100],
              selectedColor: Colors.lightBlue,
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.all(Radius.circular(10)),
              // ),
              // backgroundColor: Colors.blueGrey[700]
            ),
            title: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 200,
                    maxWidth: 250,
                  ),
                  child: Image.asset(
                    'assets/images/6-63015_icons-of-medical-computer-health-medicine-circle-clipart.png',
                  ),
                ),
                const Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ],
            ),

            items: [
              SideMenuItem(
                title: 'Categories',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.medical_information_outlined),
                badgeContent: const Text(
                  '3',
                  style: TextStyle(color: Colors.white),
                ),
                tooltipContent: "This is a tooltip for Dashboard item",
              ),
              SideMenuItem(
                title: 'Search',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.manage_search),
              ),
              SideMenuItem(
                title: 'Orders',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.file_copy_rounded),

              ),
              SideMenuItem(
                title: 'Add Item',
                onTap: (index, _) async {
                  await _onAddSellected();
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.add_circle_outline_outlined),
              ),
              SideMenuItem(
                builder: (context, displayMode) {
                  return const Divider(
                    endIndent: 8,
                    indent: 8,
                  );
                },
              ),
              SideMenuItem(
                title: 'Settings',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.settings),
              ),

              const SideMenuItem(
                title: 'Exit',
                icon: Icon(Icons.exit_to_app),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                catigorypage(),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Users',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Files',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                MedicinFormScreen(),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Settings',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Only Title',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
