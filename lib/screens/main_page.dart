import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma_web/screens/catigory_page.dart';
import 'package:pharma_web/screens/home.dart';
import 'package:pharma_web/screens/medicin_form.dart';
import 'package:pharma_web/screens/orders_page.dart';
import 'package:pharma_web/screens/report_screen.dart';
import 'package:pharma_web/screens/request_report_page.dart';
import 'package:pharma_web/screens/search_screen.dart';

import '../data/category_list.dart';
import '../providers/auth_data_provider.dart';
import '../providers/user_provider.dart';
import '../services/auth_service.dart';
import '../services/get_categories_service.dart';
import 'expiration_screen.dart';
import 'login.dart';

class MainPage extends ConsumerStatefulWidget {
   MainPage({super.key, this.index});
  int? index;
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
  void _onLogOut(WidgetRef ref, BuildContext context) async{
    final tokenWatcher= ref.watch(tokenProvider);
    ref.watch(authProvider).deleteToken(tokenWatcher.toString());
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> homepage()));
  }
  @override
  Widget build(BuildContext context) {
    if(widget.index !=null) {
      sideMenu.addListener((index ) {

        pageController.jumpToPage(widget.index!);
      });
      sideMenu.changePage(widget.index!);

    }
    final tokenReader =ref.read(tokenProvider);
    _onAddSellected()async{
      var temp = await AllCategoryService().getAllCategory(tokenReader.toString());
      categoryList=temp;

      return temp;
    }

    return
       Scaffold(
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
                selectedColor: Color.fromARGB(255, 70, 201, 210),
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
                  title: 'Expiration ',
                  onTap: (index, _) async {
                    await _onAddSellected();
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(Icons.incomplete_circle),
                ),
                SideMenuItem(
                  title: 'Reports',
                  icon: Icon(Icons.auto_graph),
                  onTap: (index, _) async {
                    sideMenu.changePage(index);
                  },
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
                  title: 'Log Out',
                  icon: Icon(Icons.exit_to_app),
                  onTap: (index, _) async {
                    _onLogOut(ref, context);
                  },
                ),

              ],
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                children: [
                  //0
                  catigorypage(),
                  //1
                  SearchScreen(),
                  //2
                  OrdersPage(),

                  //3
                  MedicinFormScreen(),
                  Expiration(),
                  RequestReport(),
                  //4



                ],
              ),
            ),
          ],
        ),
      );
  }
}
