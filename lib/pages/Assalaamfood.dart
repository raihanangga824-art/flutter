import 'package:flutter/material.dart';

// =============================================================================
// HELPER ANIMATED BACKGROUND GRADIENT (BIRU & PUTIH BERGERAK)
// =============================================================================
class AnimatedGradientBackground extends StatefulWidget {
  final Widget child;
  const AnimatedGradientBackground({super.key, required this.child});

  @override
  State<AnimatedGradientBackground> createState() => _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _topAlignmentAnimation;
  late Animation<Alignment> _bottomAlignmentAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _topAlignmentAnimation = AlignmentTween(
      begin: Alignment.topLeft,
      end: Alignment.topRight,
    ).animate(_controller);

    _bottomAlignmentAnimation = AlignmentTween(
      begin: Alignment.bottomRight,
      end: Alignment.bottomLeft,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [
                Color(0xFFE0F2FE), // Biru Muda Segar
                Color(0xFF0284C7), // Biru Cerah Accent
                Colors.white,      // Putih
                Color(0xFFBAE6FD), // Soft Sky Blue
              ],
              begin: _topAlignmentAnimation.value,
              end: _bottomAlignmentAnimation.value,
            ),
          ),
          child: widget.child,
        );
      },
    );
  }
}

// =============================================================================
// HALAMAN 1: DAFTAR ITEMS KANTIN ASSALAAM (FOOD LIST PAGE)
// =============================================================================
class ItemListPage extends StatefulWidget {
  const ItemListPage({super.key});

  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  final List<Map<String, dynamic>> categories = [
    {'name': 'Semua', 'icon': Icons.restaurant_menu},
    {'name': 'Makanan', 'icon': Icons.lunch_dining},
    {'name': 'Minuman', 'icon': Icons.local_drink},
    {'name': 'Cemilan', 'icon': Icons.fastfood},
  ];

  final List<Map<String, dynamic>> items = [
    {
      'id': '1',
      'name': 'Ayam Geprek Komplit + Nasi',
      'category': 'Makanan',
      'price': 15000,
      'rating': 4.8,
      'kcal': '450 Pcs',
      'description': 'Ayam goreng tepung renyah yang digeprek dengan sambal bawang pedas khas kantin, disajikan dengan nasi hangat dan lalapan.',
      'image': 'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?w=400',
    },
    {
      'id': '2',
      'name': 'Nasi Goreng Telur',
      'category': 'Makanan',
      'price': 8000,
      'rating': 4.7,
      'kcal': '380 Pcs',
      'description': 'Nasi goreng racikan spesial dengan kecap manis, telur orak-arik, bakso, dan suwiran ayam.',
      'image': 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=400',
    },
    {
      'id': '3',
      'name': 'Es Teh Manis Jumbo',
      'category': 'Minuman',
      'price': 4000,
      'rating': 4.9,
      'kcal': '90 Pcs',
      'description': 'Es teh manis segar ukuran jumbo dengan es batu melimpah, sangat cocok menghilangkan dahaga.',
      'image': 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=400',
    },
    {
      'id': '4',
      'name': 'Indomie Goreng Spesial + Telur ',
      'category': 'Makanan',
      'price': 25000,
      'rating': 4.9,
      'kcal': '410 Pcs',
      'description': 'Indomie goreng spesial dengan tambahan telur mata sapi dan bakso, disajikan dengan taburan bawang goreng.',
      'image': 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=400',
    },
    {
      'id': '5',
      'name': 'Kentang Goreng',
      'category': 'Cemilan',
      'price': 8000,
      'rating': 4.8,
      'kcal': '220 Pcs',
      'description': 'Kentang goreng (dikenal secara global sebagai french fries) adalah hidangan yang dibuat dari potongan-potongan kentang yang digoreng di dalam minyak panas terendam (deep fried), dengan tekstur renyah di bagian luar dan lembut di bagian dalam.',
      'image': 'https://images.unsplash.com/photo-1541592106381-b31e9677c0e5?w=400',
    },
    {
      'id': '6',
      'name': 'Es Jeruk Peras',
      'category': 'Minuman',
      'price': 5000,
      'rating': 4.7,
      'kcal': '110 Pcs',
      'description': 'Minuman es jeruk peras murni kaya vitamin C, dibuat langsung dari jeruk segar.',
      'image': 'https://images.unsplash.com/photo-1613478223719-2ab802602423?w=400',
    },
  ];

  String selectedCategory = 'Semua';
  List<Map<String, dynamic>> cartItems = [];

  void addToCart(Map<String, dynamic> item) {
    setState(() {
      int index = cartItems.indexWhere((element) => element['id'] == item['id']);
      if (index >= 0) {
        cartItems[index]['quantity'] += 1;
      } else {
        cartItems.add({
          'id': item['id'],
          'name': item['name'],
          'price': item['price'],
          'image': item['image'],
          'quantity': 1,
        });
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item['name']} masuk keranjang'),
        duration: const Duration(milliseconds: 800),
        backgroundColor: Colors.deepOrange,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  int get totalCartCount {
    int total = 0;
    for (var item in cartItems) {
      total += (item['quantity'] as int);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredItems = selectedCategory == 'Semua'
        ? items
        : items.where((i) => i['category'] == selectedCategory).toList();

    return Scaffold(
      body: AnimatedGradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header & Icon Keranjang
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.location_on, color: Color(0xFF0284C7), size: 16),
                            SizedBox(width: 4),
                            Text('Kantin SMK Assalaam',
                                style: TextStyle(color: Colors.black54, fontSize: 13, fontWeight: FontWeight.w600)),
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Assalaam Food',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (cartItems.isNotEmpty) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailAndPaymentPage(
                                    cartItems: List.from(cartItems),
                                  ),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Pilih item terlebih dahulu')),
                              );
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(color: Colors.blue.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4)),
                              ],
                            ),
                            child: const Icon(Icons.shopping_bag_outlined, color: Color(0xFF0284C7)),
                          ),
                        ),
                        if (totalCartCount > 0)
                          Positioned(
                            right: 4,
                            top: 4,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(color: Color(0xFF0284C7), shape: BoxShape.circle),
                              child: Text(
                                '$totalCartCount',
                                style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),

                // Banner Promo
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF0284C7), Color(0xFF38BDF8)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(color: Colors.blue.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 6)),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('PROMO ISTIRAHAT 50%', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                            SizedBox(height: 8),
                            Text('Ayam Geprek Spesial', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 4),
                            Text('Hemat & Lezat di Kantin!', style: TextStyle(color: Colors.white70, fontSize: 12)),
                          ],
                        ),
                      ),
                      const Icon(Icons.lunch_dining, size: 60, color: Colors.white24),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                // Kategori Menu
                const Text('Kategori Menu', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                const SizedBox(height: 15),
                SizedBox(
                  height: 45,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      bool isSelected = selectedCategory == categories[index]['name'];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = categories[index]['name'];
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.only(right: 12),
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFF0284C7) : Colors.white.withOpacity(0.85),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              if (isSelected)
                                BoxShadow(color: Colors.blue.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4)),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(categories[index]['icon'], size: 18, color: isSelected ? Colors.white : Colors.grey[600]),
                              const SizedBox(width: 8),
                              Text(
                                categories[index]['name'],
                                style: TextStyle(color: isSelected ? Colors.white : Colors.grey[700], fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 25),

                // Items Grid
                const Text('Daftar Items', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                const SizedBox(height: 15),

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage(
                              item: item,
                              onAddToCart: (itemToAdd) => addToCart(itemToAdd),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.92),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(color: Colors.blue.withOpacity(0.08), blurRadius: 12, offset: const Offset(0, 4)),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  item['image'],
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (c, e, s) => Container(color: Colors.grey[200], child: const Icon(Icons.fastfood)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(item['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 1),
                            const SizedBox(height: 4),
                            Text(item['kcal'], style: const TextStyle(color: Colors.grey, fontSize: 11)),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Rp ${item['price']}', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0284C7))),
                                GestureDetector(
                                  onTap: () => addToCart(item),
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(color: const Color(0xFF0284C7), borderRadius: BorderRadius.circular(10)),
                                    child: const Icon(Icons.add, color: Colors.white, size: 18),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// HALAMAN TERPISAH: DETAIL PRODUK (SINGLE PRODUCT DETAIL PAGE)
// =============================================================================
class ProductDetailPage extends StatefulWidget {
  final Map<String, dynamic> item;
  final Function(Map<String, dynamic>) onAddToCart;

  const ProductDetailPage({
    super.key,
    required this.item,
    required this.onAddToCart,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String selectedSize = 'M';

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return Scaffold(
      body: AnimatedGradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              // Top Navigation Bar
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.arrow_back_ios_new, size: 18, color: Colors.black87),
                      ),
                    ),
                    const Text('Detail Produk', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.favorite_border, size: 18, color: Colors.red),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Gambar Produk Besar
                      Center(
                        child: Container(
                          height: 220,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(color: Colors.blue.withOpacity(0.15), blurRadius: 15, offset: const Offset(0, 8)),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.network(
                              item['image'],
                              fit: BoxFit.cover,
                              errorBuilder: (c, e, s) => Container(color: Colors.grey[200], child: const Icon(Icons.fastfood, size: 50)),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      // Title & Price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item['name'], style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 4),
                                Text(item['category'], style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                              ],
                            ),
                          ),
                          Text(
                            'Rp ${item['price']}',
                            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0284C7)),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),

                      // Info Bar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 18),
                              const SizedBox(width: 4),
                              Text('${item['rating']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.local_fire_department, color: Color(0xFF0284C7), size: 18),
                              const SizedBox(width: 4),
                              Text(item['kcal'], style: const TextStyle(color: Colors.grey)),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(Icons.timer_outlined, color: Colors.grey, size: 18),
                              SizedBox(width: 4),
                              Text('5-10 min', style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Size Selection
                      const Text('Porsi / Ukuran', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      const SizedBox(height: 10),
                      Row(
                        children: ['S', 'M', 'L'].map((size) {
                          bool isSelected = selectedSize == size;
                          return GestureDetector(
                            onTap: () => setState(() => selectedSize = size),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              margin: const EdgeInsets.only(right: 12),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                color: isSelected ? const Color(0xFF0284C7) : Colors.white.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  if (isSelected)
                                    BoxShadow(color: Colors.blue.withOpacity(0.3), blurRadius: 6, offset: const Offset(0, 3)),
                                ],
                              ),
                              child: Text(
                                size,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 20),

                      // Deskripsi Produk
                      const Text('Deskripsi Makanan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      const SizedBox(height: 8),
                      Text(
                        item['description'] ?? 'Makanan khas Kantin Assalaam yang diolah dengan bahan-bahan bersih, higienis, dan rasa yang dijamin lezat.',
                        style: TextStyle(color: Colors.grey[800], height: 1.5, fontSize: 13),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),

              // Bottom Add To Cart
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  boxShadow: [
                    BoxShadow(color: Colors.blue.withOpacity(0.08), blurRadius: 10, offset: const Offset(0, -4)),
                  ],
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0284C7),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    onPressed: () {
                      widget.onAddToCart(item);
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
                    label: const Text(
                      'Tambah Ke Keranjang',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// HALAMAN 2: DETAIL ITEMS & PAYMENT (MULTI ITEMS, CASH INPUT & QRIS)
// =============================================================================
class DetailAndPaymentPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const DetailAndPaymentPage({super.key, required this.cartItems});

  @override
  State<DetailAndPaymentPage> createState() => _DetailAndPaymentPageState();
}

class _DetailAndPaymentPageState extends State<DetailAndPaymentPage> {
  late List<Map<String, dynamic>> items;
  String paymentMethod = 'cash';
  final TextEditingController cashController = TextEditingController();
  int cashPaid = 0;

  @override
  void initState() {
    super.initState();
    items = widget.cartItems;
  }

  int get totalAmount {
    int sum = 0;
    for (var item in items) {
      sum += (item['price'] as int) * (item['quantity'] as int);
    }
    return sum;
  }

  void updateQuantity(int index, int change) {
    setState(() {
      items[index]['quantity'] += change;
      if (items[index]['quantity'] <= 0) {
        items.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int changeAmount = cashPaid - totalAmount;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Detail & Payment', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: AnimatedGradientBackground(
        child: items.isEmpty
            ? const Center(child: Text('Keranjang Belanja Kosong'))
            : SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Detail Multi Items', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(item['image'], width: 50, height: 50, fit: BoxFit.cover, errorBuilder: (c, e, s) => const Icon(Icons.fastfood)),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                                    Text('Rp ${item['price']}', style: const TextStyle(color: Color(0xFF0284C7))),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(onPressed: () => updateQuantity(index, -1), icon: const Icon(Icons.remove_circle_outline, size: 20)),
                                  Text('${item['quantity']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                  IconButton(onPressed: () => updateQuantity(index, 1), icon: const Icon(Icons.add_circle_outline, color: Color(0xFF0284C7), size: 20)),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),

                    // Opsi Payment Cash & QRIS
                    const Text('Metode Pembayaran', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: ChoiceChip(
                            label: const Center(child: Text('Cash Input')),
                            selected: paymentMethod == 'cash',
                            selectedColor: const Color(0xFF0284C7),
                            labelStyle: TextStyle(color: paymentMethod == 'cash' ? Colors.white : Colors.black),
                            onSelected: (val) => setState(() => paymentMethod = 'cash'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ChoiceChip(
                            label: const Center(child: Text('QRIS')),
                            selected: paymentMethod == 'qris',
                            selectedColor: const Color(0xFF0284C7),
                            labelStyle: TextStyle(color: paymentMethod == 'qris' ? Colors.white : Colors.black),
                            onSelected: (val) => setState(() => paymentMethod = 'qris'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    if (paymentMethod == 'cash') ...[
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Input Uang Cash', style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            TextField(
                              controller: cashController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(hintText: 'Masukkan Jumlah Uang (Rp)', border: OutlineInputBorder()),
                              onChanged: (v) => setState(() => cashPaid = int.tryParse(v) ?? 0),
                            ),
                            const SizedBox(height: 10),
                            Text('Kembalian: Rp ${changeAmount >= 0 ? changeAmount : 0}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                          ],
                        ),
                      )
                    ] else ...[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          children: const [
                            Icon(Icons.qr_code_2, size: 140, color: Colors.black87),
                            SizedBox(height: 8),
                            Text('Scan Kode QRIS Assalaam Food', style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      )
                    ],

                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), borderRadius: BorderRadius.circular(16)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total Pembayaran', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Text('Rp $totalAmount', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0284C7))),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0284C7)),
                        onPressed: () {
                          if (paymentMethod == 'cash' && cashPaid < totalAmount) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Uang cash kurang!'), backgroundColor: Colors.red),
                            );
                            return;
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReceiptPage(
                                cartItems: items,
                                totalAmount: totalAmount,
                                paymentMethod: paymentMethod,
                                cashPaid: cashPaid,
                                changeAmount: changeAmount,
                              ),
                            ),
                          );
                        },
                        child: const Text('Bayar & Lihat Struk', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

// =============================================================================
// HALAMAN 3: STRUK PEMBAYARAN (RECEIPT PAGE)
// =============================================================================
class ReceiptPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  final int totalAmount;
  final String paymentMethod;
  final int cashPaid;
  final int changeAmount;

  const ReceiptPage({
    super.key,
    required this.cartItems,
    required this.totalAmount,
    required this.paymentMethod,
    required this.cashPaid,
    required this.changeAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Struk Pembayaran', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: false,
      ),
      body: AnimatedGradientBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.95), borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    const Icon(Icons.check_circle, color: Colors.green, size: 50),
                    const SizedBox(height: 10),
                    const Text('TRANSAKSI BERHASIL', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const Text('Kantin Assalaam Food', style: TextStyle(color: Colors.grey, fontSize: 12)),
                    const Divider(height: 30),

                    ...cartItems.map((item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${item['name']} x${item['quantity']}'),
                          Text('Rp ${item['price'] * item['quantity']}'),
                        ],
                      ),
                    )).toList(),

                    const Divider(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Metode', style: TextStyle(color: Colors.grey)),
                        Text(paymentMethod == 'cash' ? 'Cash / Tunai' : 'QRIS', style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Rp $totalAmount', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0284C7))),
                      ],
                    ),
                    if (paymentMethod == 'cash') ...[
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Cash', style: TextStyle(color: Colors.grey)),
                          Text('Rp $cashPaid'),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Kembalian', style: TextStyle(color: Colors.grey)),
                          Text('Rp $changeAmount', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0284C7)),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const ItemListPage()),
                      (route) => false,
                    );
                  },
                  child: const Text('Kembali ke Home', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}