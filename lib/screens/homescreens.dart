import 'package:flutter/material.dart';
import 'package:printflow/resources/colorsresource.dart';
import 'package:printflow/resources/textplaceholder.dart';
import 'package:printflow/widgets/commonwidgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.back});

  final VoidCallback back;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: Column(
        children: [
          Container(
            color: homecolor,
            padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            helloname,
                            style: TextStyle(
                              color: whitecolor,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(welcometext, style: TextStyle(color: whitecolor)),
                        ],
                      ),
                    ),
                    const Icon(Icons.notifications, color: whitecolor),
                    const SizedBox(width: 10),
                    CircleAvatar(
                      backgroundColor: bluecolor,
                      child: IconButton(
                        onPressed: back,
                        icon: const Icon(Icons.shopping_cart, color: whitecolor, size: 18),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: whitecolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: hintcolor),
                      SizedBox(width: 8),
                      Text(searchhint, style: TextStyle(color: hintcolor)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B82F6),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        newcollection,
                        style: TextStyle(
                          color: whitecolor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        summertext,
                        style: TextStyle(
                          color: whitecolor,
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 8),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: bluecolor,
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          child: Text(explorenow, style: TextStyle(color: whitecolor)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    Text(categories, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                    Spacer(),
                    Text(viewall, style: TextStyle(color: linkcolor)),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _CateDot(Colors.red, oversized),
                    _CateDot(Colors.green, "Polo"),
                    _CateDot(Colors.amber, "Royal Neck"),
                    _CateDot(Colors.lightBlue, "Hoodies"),
                    _CateDot(Colors.indigo, "Jerseys"),
                  ],
                ),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    Text(newarrivals, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                    Spacer(),
                    Text(viewall, style: TextStyle(color: linkcolor)),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Expanded(child: ClothBox(Color(0xFF2B2B2B), height: 110)),
                    SizedBox(width: 8),
                    Expanded(child: ClothBox(Color(0xFF111111), height: 110)),
                    SizedBox(width: 8),
                    Expanded(child: ClothBox(Color(0xFF3A3A3A), height: 110)),
                  ],
                ),
              ],
            ),
          ),
          const _BottomTabs(),
        ],
      ),
    );
  }
}

class _CateDot extends StatelessWidget {
  const _CateDot(this.color, this.name);

  final Color color;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(backgroundColor: color, radius: 18, child: const Icon(Icons.checkroom, color: whitecolor, size: 16)),
        const SizedBox(height: 4),
        Text(name, style: const TextStyle(fontSize: 10)),
      ],
    );
  }
}

class _BottomTabs extends StatelessWidget {
  const _BottomTabs();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _Tab(Icons.home, hometab, true),
          _Tab(Icons.grid_view, catetab, false),
          _Tab(Icons.receipt_long, orderstab, false),
          _Tab(Icons.palette_outlined, designstab, false),
          _Tab(Icons.person_outline, profiletab, false),
        ],
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab(this.icon, this.name, this.active);

  final IconData icon;
  final String name;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final color = active ? bluecolor : hintcolor;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 20),
        Text(name, style: TextStyle(color: color, fontSize: 11)),
      ],
    );
  }
}

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key, required this.back});

  final VoidCallback back;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: SafeArea(
        child: Column(
          children: [
            PageTop(cateloges, back),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(16),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.78,
                children: const [
                  _CatalogItem(Color(0xFF8EA08A), oversized),
                  _CatalogItem(Color(0xFF6B3FA0), shirts),
                  _CatalogItem(Color(0xFFC4A574), roundneck),
                  _CatalogItem(Color(0xFF6E8B62), polotext),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Row(
                children: [
                  Container(
                    width: 90,
                    height: 70,
                    color: cardgrey,
                    child: const Icon(Icons.face),
                  ),
                  Expanded(
                    child: Container(
                      height: 70,
                      color: const Color(0xFFD9D9D9),
                      alignment: Alignment.center,
                      child: const Text(
                        capsmore,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
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

class _CatalogItem extends StatelessWidget {
  const _CatalogItem(this.color, this.name);

  final Color color;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: ClothBox(color)),
        const SizedBox(height: 8),
        Text(name),
      ],
    );
  }
}

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key, required this.back});

  final VoidCallback back;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: SafeArea(
        child: Column(
          children: [
            PageTop(allproducts, back),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(filtertext, style: TextStyle(fontWeight: FontWeight.w600)),
                  Spacer(),
                  Text(sorttext, style: TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(16),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.72,
                children: const [
                  _PriceItem(Color(0xFF8EA08A), oversized, price350),
                  _PriceItem(Color(0xFF7BA3C9), shirts, price399),
                  _PriceItem(Color(0xFFE7E0D4), roundneck, price499),
                  _PriceItem(Color(0xFF6E8B62), polotext, price449),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PriceItem extends StatelessWidget {
  const _PriceItem(this.color, this.name, this.price);

  final Color color;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: ClothBox(color)),
        const SizedBox(height: 8),
        Text(name),
        Text(price, style: const TextStyle(fontWeight: FontWeight.w700)),
      ],
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.back, required this.next});

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
            PageTop(allproducts, back),
            const ClothBox(Color(0xFF8EA08A), height: 220),
            const SizedBox(height: 16),
            const Text(oversizedtee, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 6),
            const Row(
              children: [
                Text(pricepiece, style: TextStyle(fontWeight: FontWeight.w700)),
                Spacer(),
                Text(moqtext),
              ],
            ),
            const SizedBox(height: 16),
            const Text(fabricline),
            const Text(gsmline),
            const Text(sizeline),
            const SizedBox(height: 8),
            const Row(
              children: [
                Text(colorsline),
                SizedBox(width: 8),
                _Dot(Colors.black),
                _Dot(Colors.green),
                _Dot(Colors.red),
                _Dot(Colors.yellow),
              ],
            ),
            const SizedBox(height: 10),
            const Text("→  $productnote"),
            const SizedBox(height: 16),
            DarkButton(addenquiry, next),
          ],
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot(this.color);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      width: 16,
      height: 16,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key, required this.back, required this.next});

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
            PageTop(filterstitle, back),
            const FieldBox(searchhint, icon: Icons.search),
            const FieldLabel(categorylabel),
            const FieldBox(allcategory, icon: Icons.keyboard_arrow_down),
            const FieldLabel(colorlabel),
            const Row(
              children: [
                _Dot(Colors.red),
                _Dot(Colors.yellow),
                _Dot(Colors.green),
                _Dot(Colors.blue),
                _Dot(Colors.purple),
              ],
            ),
            const FieldLabel(fabriclabel),
            const FieldBox(allfabrics, icon: Icons.keyboard_arrow_down),
            const FieldLabel(gsmlabel),
            const FieldBox(allgsm, icon: Icons.keyboard_arrow_down),
            const FieldLabel(pricerange),
            const FieldBox(pricehint, icon: Icons.keyboard_arrow_down),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 46,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: cardgrey, foregroundColor: textcolor),
                      onPressed: () {},
                      child: const Text(resettext),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(child: DarkButton(applytext, next)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
