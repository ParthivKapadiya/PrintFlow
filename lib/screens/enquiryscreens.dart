import 'package:flutter/material.dart';
import 'package:printflow/resources/colorsresource.dart';
import 'package:printflow/resources/textplaceholder.dart';
import 'package:printflow/widgets/commonwidgets.dart';

class EnquiryListScreen extends StatefulWidget {
  const EnquiryListScreen({super.key, required this.back, required this.next});

  final VoidCallback back;
  final VoidCallback next;

  @override
  State<EnquiryListScreen> createState() => _EnquiryListScreenState();
}

class _EnquiryListScreenState extends State<EnquiryListScreen> {
  List<int> qty = [100, 50, 30, 100];

  @override
  Widget build(BuildContext context) {
    final items = [
      [oversizedprinted, blackm, const Color(0xFF222222)],
      [poloshirt, blackl, const Color(0xFF333333)],
      [hoodie, whitexl, const Color(0xFF555555)],
      [roundneck, orangexxl, const Color(0xFF444444)],
    ];
    return Scaffold(
      backgroundColor: whitecolor,
      body: SafeArea(
        child: Column(
          children: [
            PageTop(enquirylist, widget.back),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: items.length,
                itemBuilder: (context, i) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(8),
                    color: cardgrey,
                    child: Row(
                      children: [
                        SizedBox(width: 70, child: ClothBox(items[i][2] as Color, height: 70)),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(items[i][0] as String, style: const TextStyle(fontWeight: FontWeight.w700)),
                              Text(items[i][1] as String, style: const TextStyle(color: hintcolor)),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (qty[i] > 1) qty[i]--;
                            });
                          },
                          icon: const Text("-", style: TextStyle(fontSize: 20)),
                        ),
                        Text("${qty[i]}"),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              qty[i]++;
                            });
                          },
                          icon: const Text("+", style: TextStyle(fontSize: 20)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(remarkssection, style: TextStyle(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 6),
                  const FieldBox(remarkshint),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(totalitems4),
                      const Spacer(),
                      SizedBox(width: 160, child: DarkButton(submitenquiry, widget.next)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubmitEnquiryScreen extends StatelessWidget {
  const SubmitEnquiryScreen({super.key, required this.back, required this.next});

  final VoidCallback back;
  final VoidCallback next;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            PageTop(submitenquiry, back),
            const FieldLabel(businessname),
            const FieldBox(businesshint),
            const FieldLabel(contactperson),
            const FieldBox(contacthint),
            const FieldLabel(mobilelabel),
            const FieldBox(mobilehint),
            const FieldLabel(emaillabel),
            const FieldBox(emailhint),
            const FieldLabel(requirementdate),
            const FieldBox(datehint, icon: Icons.calendar_today_outlined),
            const FieldLabel(additionalremarks),
            const FieldBox(remarkshint2, lines: 3),
            const SizedBox(height: 18),
            DarkButton(submitenquiry, next),
          ],
        ),
      ),
    );
  }
}

class MyEnquiriesScreen extends StatelessWidget {
  const MyEnquiriesScreen({super.key, required this.back});

  final VoidCallback back;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Column(
          children: [
            PageTop(myenquiries, back),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _Chip(alltab, true),
                  const SizedBox(width: 8),
                  _Chip(pendingtab, false),
                  const SizedBox(width: 8),
                  _Chip(approvedtab, false),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  _EnqCard(enq1003, date23july, pendingtext, items3, goldcolor),
                  _EnqCard(enq1002, date12may, pendingtext, items2, goldcolor),
                  _EnqCard(enq1001, date6may, approvedtext, items5, linkcolor),
                  _EnqCard(enq1000, date1may, completedtext, items4, greencolor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip(this.text, this.filled);

  final String text;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      color: filled ? navycolor : cardgrey,
      child: Text(text, style: TextStyle(color: filled ? whitecolor : textcolor)),
    );
  }
}

class _EnqCard extends StatelessWidget {
  const _EnqCard(this.id, this.date, this.status, this.items, this.color);

  final String id;
  final String date;
  final String status;
  final String items;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(id, style: const TextStyle(fontWeight: FontWeight.w700)),
              Text(date, style: const TextStyle(color: hintcolor)),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(status, style: TextStyle(color: color, fontWeight: FontWeight.w700)),
              Text(items),
            ],
          ),
        ],
      ),
    );
  }
}

class EnquiryDetailScreen extends StatelessWidget {
  const EnquiryDetailScreen({super.key, required this.back});

  final VoidCallback back;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            PageTop(enquirydetails, back),
            const Row(
              children: [
                Text(enq1003, style: TextStyle(fontWeight: FontWeight.w700)),
                Spacer(),
                Text(date23jul),
              ],
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(pendingtext, style: TextStyle(color: goldcolor, fontWeight: FontWeight.w700)),
            ),
            const SizedBox(height: 10),
            const Text(productshead, style: TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            const _DetailRow(Color(0xFF222222), oversizedprinted, blackm, qty100, price350),
            const _DetailRow(Color(0xFF333333), poloshirt, blackl, qty50, price320),
            const _DetailRow(Color(0xFF555555), hoodie, whitexl, qty30, price650),
            const SizedBox(height: 8),
            const Text(remarkshead, style: TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 6),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              color: fieldcolor,
              child: const Text(remarksbody, style: TextStyle(color: hintcolor)),
            ),
            const SizedBox(height: 12),
            const Text(totalitems3, style: TextStyle(fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow(this.color, this.name, this.varient, this.qty, this.price);

  final Color color;
  final String name;
  final String varient;
  final String qty;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      color: cardgrey,
      child: Row(
        children: [
          SizedBox(width: 64, child: ClothBox(color, height: 64)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.w700)),
                Text(varient, style: const TextStyle(color: hintcolor, fontSize: 12)),
                Text(qty, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
          Text(price, style: const TextStyle(fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key, required this.back});

  final VoidCallback back;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: SafeArea(
        child: Column(
          children: [
            PageTop(myfavorites, back),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  _FavRow(Color(0xFF222222), oversizedprinted, price350),
                  _FavRow(Color(0xFF333333), poloshirt, price320),
                  _FavRow(Color(0xFF555555), hoodie, price650),
                  _FavRow(Color(0xFF444444), roundneck, price280),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavRow extends StatelessWidget {
  const _FavRow(this.color, this.name, this.price);

  final Color color;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(8),
      color: cardgrey,
      child: Row(
        children: [
          SizedBox(width: 70, child: ClothBox(color, height: 70)),
          const SizedBox(width: 12),
          Expanded(child: Text(name, style: const TextStyle(fontWeight: FontWeight.w700))),
          Text(price, style: const TextStyle(fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
