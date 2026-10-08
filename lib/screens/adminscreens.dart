import 'package:flutter/material.dart';
import 'package:printflow/resources/colorsresource.dart';
import 'package:printflow/resources/textplaceholder.dart';
import 'package:printflow/widgets/commonwidgets.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key, required this.back});

  final VoidCallback back;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              children: [
                IconButton(onPressed: back, icon: const Icon(Icons.arrow_back)),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(admintitle, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                      Text(adminwelcome, style: TextStyle(color: hintcolor, fontSize: 12)),
                    ],
                  ),
                ),
                const CircleAvatar(backgroundColor: Color(0xFFD9C7F5), child: Icon(Icons.person, color: whitecolor)),
              ],
            ),
            const Row(
              children: [
                Expanded(child: _Stat(totalproducts, totalproductsvalue, viewproducts, null)),
                SizedBox(width: 10),
                Expanded(child: _Stat(dealerstitle, dealersvalue, viewdealers, Icons.person_outline)),
              ],
            ),
            const Row(
              children: [
                Expanded(child: _Stat(enquirestitle, enquiresvalue, viewenquires, Icons.chat_bubble_outline)),
                SizedBox(width: 10),
                Expanded(child: _Stat(pendingorders, pendingvalue, viewpending, null)),
              ],
            ),
            const SizedBox(height: 8),
            const Text(quickactions, style: TextStyle(fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            const Row(
              children: [
                Expanded(child: _Action(Icons.add, addproducts, addnewproduct)),
                SizedBox(width: 10),
                Expanded(child: _Action(Icons.person_outline, managedealers, addnewdealer)),
              ],
            ),
            const Row(
              children: [
                Expanded(child: _Action(Icons.chat_bubble_outline, viewenquires2, checkenquiry)),
                SizedBox(width: 10),
                Expanded(child: _Action(Icons.storage, reports, viewreports)),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              decoration: BoxDecoration(color: cardgrey, borderRadius: BorderRadius.circular(10)),
              child: const Row(
                children: [
                  Text(recentenquires, style: TextStyle(fontWeight: FontWeight.w700)),
                  Spacer(),
                  Text(viewtext, style: TextStyle(color: linkcolor, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat(this.title, this.value, this.link, this.icon);

  final String title;
  final String value;
  final String link;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) Icon(icon, size: 18),
          Text(title, style: const TextStyle(fontSize: 13)),
          Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
          Text(link, style: const TextStyle(color: hintcolor, fontSize: 11)),
        ],
      ),
    );
  }
}

class _Action extends StatelessWidget {
  const _Action(this.icon, this.title, this.sub);

  final IconData icon;
  final String title;
  final String sub;

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
          Text(sub, style: const TextStyle(color: hintcolor, fontSize: 12)),
        ],
      ),
    );
  }
}

class ProductManageScreen extends StatelessWidget {
  const ProductManageScreen({super.key, required this.back, required this.next});

  final VoidCallback back;
  final VoidCallback next;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: bluecolor,
        foregroundColor: whitecolor,
        onPressed: next,
        icon: const Icon(Icons.add),
        label: const Text(addproductsbtn),
      ),
      body: SafeArea(
        child: Column(
          children: [
            PageTop(productmgmt, back),
            const Text(manageproducts, style: TextStyle(color: hintcolor)),
            const Padding(
              padding: EdgeInsets.all(16),
              child: FieldBox(searchproducts, icon: Icons.search),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  _ProductRow(Color(0xFF1E3A8A), product1, stock120),
                  _ProductRow(Color(0xFF67E8F9), product2, stock12),
                  _ProductRow(Color(0xFF312E81), product3, stock20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductRow extends StatelessWidget {
  const _ProductRow(this.color, this.name, this.stock);

  final Color color;
  final String name;
  final String stock;

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      child: Row(
        children: [
          SizedBox(width: 64, child: ClothBox(color, height: 64)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.w700)),
                const Text(dollar35, style: TextStyle(color: linkcolor, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          Text(stock, style: const TextStyle(color: greencolor, fontSize: 12)),
          const Icon(Icons.edit, color: linkcolor, size: 18),
          const SizedBox(width: 8),
          const Icon(Icons.delete, color: redcolor, size: 18),
        ],
      ),
    );
  }
}

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key, required this.back, required this.next});

  final VoidCallback back;
  final VoidCallback next;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            PageTop(addedit, back),
            WhiteCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(productimage, style: TextStyle(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const SizedBox(width: 80, child: ClothBox(Color(0xFF1E3A8A), height: 80)),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: bluecolor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Column(
                          children: [
                            Icon(Icons.photo_camera_outlined, color: bluecolor),
                            Text(changeimage, style: TextStyle(color: bluecolor, fontSize: 12)),
                            Text(imagehint, style: TextStyle(fontSize: 10, color: hintcolor)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const FieldLabel(namelabel),
                  const FieldBox(blacktshirt),
                  const FieldLabel(pricelabel),
                  const FieldBox(price399num),
                  const FieldLabel(stocklabel),
                  const FieldBox(stock120num),
                  const FieldLabel(descriptionlabel),
                  const FieldBox(descriptionbody, lines: 2),
                ],
              ),
            ),
            BlueButton(saveproduct, next, icon: Icons.save_outlined),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.delete, color: redcolor),
              label: const Text(deleteproduct, style: TextStyle(color: redcolor)),
            ),
          ],
        ),
      ),
    );
  }
}

class DealerManageScreen extends StatelessWidget {
  const DealerManageScreen({super.key, required this.back, required this.next});

  final VoidCallback back;
  final VoidCallback next;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Column(
          children: [
            PageTop(dealermgmt, back),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(child: _Count(totaldealers, totaldealersvalue)),
                  SizedBox(width: 12),
                  Expanded(child: _Count(activedealers, activedealersvalue)),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: const [
                  _Dealer(dealer1, phone1),
                  _Dealer(dealer2, phone2),
                  _Dealer(dealer3, phone3),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: BlueButton(addnewdealerbtn, next),
            ),
          ],
        ),
      ),
    );
  }
}

class _Count extends StatelessWidget {
  const _Count(this.title, this.value);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: textcolor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(title),
          Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }
}

class _Dealer extends StatelessWidget {
  const _Dealer(this.name, this.phone);

  final String name;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      child: Row(
        children: [
          const Icon(Icons.person_outline),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.w700)),
                Text(phone, style: const TextStyle(color: hintcolor, fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.edit, color: linkcolor, size: 18),
          const SizedBox(width: 8),
          const Icon(Icons.delete, color: redcolor, size: 18),
        ],
      ),
    );
  }
}

class ViewEnquiresScreen extends StatelessWidget {
  const ViewEnquiresScreen({super.key, required this.back, required this.next});

  final VoidCallback back;
  final VoidCallback next;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Column(
          children: [
            PageTop(viewenquirestitle, back),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: FieldBox(searchenquires, icon: Icons.search),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _Enq(dealer1b, next),
                  _Enq(dealer2, next),
                  _Enq(dealer3, next),
                  _Enq(dealer4, next),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Enq extends StatelessWidget {
  const _Enq(this.name, this.next);

  final String name;
  final VoidCallback next;

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      child: Row(
        children: [
          const Icon(Icons.person_outline),
          const SizedBox(width: 6),
          const Icon(Icons.checkroom, size: 28),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                const Text(blacktshirt, style: TextStyle(fontSize: 12)),
                const Text(qtyline, style: TextStyle(fontSize: 12)),
                const Text(priceline, style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
          OutlinedButton(onPressed: next, child: const Text(viewdetails, style: TextStyle(fontSize: 11))),
        ],
      ),
    );
  }
}

class DealerDetailScreen extends StatelessWidget {
  const DealerDetailScreen({super.key, required this.back});

  final VoidCallback back;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            PageTop(dealerdetails, back),
            const WhiteCard(
              child: Row(
                children: [
                  Icon(Icons.person_outline, size: 32),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(dealer1, style: TextStyle(fontWeight: FontWeight.w800)),
                      Text(phone1, style: TextStyle(color: hintcolor)),
                    ],
                  ),
                ],
              ),
            ),
            const WhiteCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person_outline, color: linkcolor),
                      SizedBox(width: 6),
                      Text(dealerinfo, style: TextStyle(color: linkcolor, fontWeight: FontWeight.w700)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("$dealernamelabel     $dealer1b"),
                  SizedBox(height: 6),
                  Text("$contactedlabel     $contactedname"),
                  SizedBox(height: 6),
                  Text("$contactnumber     $contactvalue"),
                ],
              ),
            ),
            BlueButton(editdealer, () {}),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {},
              child: const Text(deletedealer, style: TextStyle(color: redcolor, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
