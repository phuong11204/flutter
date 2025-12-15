import 'package:bt_drawer/model/product.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct>
    with SingleTickerProviderStateMixin {
  final List<Product> listProduct = [
    Product(
        id: 1,
        title: "Giày 1",
        price: 109000,
        description: "Giày thể thao năng động, thoáng khí.",
        category: "Giày nam",
        image: "assets/images/anh1.jpg"),
    Product(
        id: 2,
        title: "Giày 2",
        price: 220000,
        description: "Giày sneaker thời trang.",
        category: "Giày nữ",
        image: "assets/images/anh2.jpg"),
    Product(
        id: 3,
        title: "Giày 3",
        price: 200000,
        description: "Giày da nam sang trọng.",
        category: "Giày nam",
        image: "assets/images/anh3.jpg"),
    Product(
        id: 4,
        title: "Giày 4",
        price: 150000,
        description: "Giày cao gót nữ.",
        category: "Giày nữ",
        image: "assets/images/anh4.jpg"),
  ];

  final NumberFormat formatCurrency = NumberFormat("#,###", "vi_VN");
  final TextEditingController searchCtrl = TextEditingController();

  List<Product> filteredList = [];
  List<Map<String, dynamic>> cartList = [];

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    filteredList = listProduct;
    tabController = TabController(length: 3, vsync: this);
  }

  void searchProduct(String query) {
    setState(() {
      filteredList = listProduct
          .where(
              (p) => p.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  double getTotalPrice() {
    double total = 0;
    for (var item in cartList) {
      final Product p = item['product'];
      final int quantity = item['quantity'];
      total += p.price * quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Text("Cửa hàng bán giày"),
        centerTitle: true,
        backgroundColor: Colors.blue[300],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: searchCtrl,
              onChanged: searchProduct,
              decoration: InputDecoration(
                hintText: "Tìm sản phẩm...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.blue[300],
            child: TabBar(
              controller: tabController,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: const [
                Tab(text: "Trang chủ"),
                Tab(text: "Danh mục"),
                Tab(text: "Giỏ hàng"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                buildProductGrid(filteredList),
                buildProductGrid(filteredList),
                buildCartTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================= GRID =================
  Widget buildProductGrid(List<Product> products) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.65,
      ),
      itemBuilder: (_, index) => buildProductItem(products[index]),
    );
  }

  // ================= PRODUCT CARD =================
  Widget buildProductItem(Product p) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              p.image,
              height: 130,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              p.title,
              style:
                  const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "${formatCurrency.format(p.price)} đ",
              style: const TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        builder: (_) => buildProductDetail(p),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200),
                    child: const Text(
                      "Chi tiết",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        final index = cartList.indexWhere(
                            (item) => item['product'].id == p.id);
                        if (index >= 0) {
                          cartList[index]['quantity']++;
                        } else {
                          cartList.add({'product': p, 'quantity': 1});
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green),
                    child: const Text("Thêm"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================= DETAIL =================
  Widget buildProductDetail(Product p) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                p.image,
                height: 260,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              p.title,
              style:
                  const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "${formatCurrency.format(p.price)} đ",
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 4),
                Text("4.5 (200+ đánh giá)"),
              ],
            ),
            const SizedBox(height: 16),
            const Text("Mô tả",
                style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(p.description),
            const SizedBox(height: 12),
            Text("Danh mục: ${p.category}"),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.shopping_cart),
                label: const Text("Thêm vào giỏ"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                ),
                onPressed: () {
                  setState(() {
                    final index = cartList.indexWhere(
                        (item) => item['product'].id == p.id);
                    if (index >= 0) {
                      cartList[index]['quantity']++;
                    } else {
                      cartList.add({'product': p, 'quantity': 1});
                    }
                  });
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= CART =================
  Widget buildCartTab() {
    if (cartList.isEmpty) {
      return const Center(child: Text("Giỏ hàng trống"));
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: cartList.length,
            itemBuilder: (_, index) {
              final item = cartList[index];
              final Product p = item['product'];
              final int quantity = item['quantity'];

              return Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  leading: Image.asset(p.image, width: 60),
                  title: Text(p.title),
                  subtitle:
                      Text("${formatCurrency.format(p.price)} đ"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) {
                              item['quantity']--;
                            } else {
                              cartList.removeAt(index);
                            }
                          });
                        },
                      ),
                      Text(quantity.toString()),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            item['quantity']++;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Tổng tiền:",
                  style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(
                "${formatCurrency.format(getTotalPrice())} đ",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
