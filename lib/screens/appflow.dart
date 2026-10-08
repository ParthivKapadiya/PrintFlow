import 'package:flutter/material.dart';
import 'package:printflow/resources/colorsresource.dart';
import 'package:printflow/resources/textplaceholder.dart';
import 'package:printflow/screens/accountscreens.dart';
import 'package:printflow/screens/adminscreens.dart';
import 'package:printflow/screens/authscreens.dart';
import 'package:printflow/screens/enquiryscreens.dart';
import 'package:printflow/screens/homescreens.dart';

class AppFlow extends StatefulWidget {
  const AppFlow({super.key});

  @override
  State<AppFlow> createState() => _AppFlowState();
}

class _AppFlowState extends State<AppFlow> {
  int page = 0;

  void gonext() {
    if (page < 23) {
      setState(() {
        page++;
      });
    }
  }

  void goprev() {
    if (page > 0) {
      setState(() {
        page--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screens = <Widget>[
      const SplashScreen(),
      LoginScreen(next: gonext),
      RegisterScreen(next: gonext),
      ForgotScreen(next: gonext),
      HomeScreen(back: goprev),
      CatalogScreen(back: goprev),
      AllProductsScreen(back: goprev),
      ProductDetailScreen(back: goprev, next: gonext),
      FilterScreen(back: goprev, next: gonext),
      EnquiryListScreen(back: goprev, next: gonext),
      SubmitEnquiryScreen(back: goprev, next: gonext),
      MyEnquiriesScreen(back: goprev),
      EnquiryDetailScreen(back: goprev),
      FavoritesScreen(back: goprev),
      NotificationsScreen(back: goprev),
      ProfileScreen(back: goprev, next: gonext),
      SettingsScreen(back: goprev),
      HelpScreen(back: goprev, next: gonext),
      AdminDashboardScreen(back: goprev),
      ProductManageScreen(back: goprev, next: gonext),
      AddProductScreen(back: goprev, next: gonext),
      DealerManageScreen(back: goprev, next: gonext),
      ViewEnquiresScreen(back: goprev, next: gonext),
      DealerDetailScreen(back: goprev),
    ];

    return Scaffold(
      body: screens[page],
      bottomNavigationBar: Container(
        color: whitecolor,
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
        child: Row(
          children: [
            TextButton(
              onPressed: page == 0 ? null : goprev,
              child: const Text(prevtext),
            ),
            Expanded(
              child: Text(
                "${page + 1} / ${screens.length}",
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: navycolor,
                foregroundColor: whitecolor,
              ),
              onPressed: page == screens.length - 1 ? null : gonext,
              child: const Text(nexttext),
            ),
          ],
        ),
      ),
    );
  }
}
