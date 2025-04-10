import 'package:flutter/material.dart';
import 'CartScreen.dart';
import 'Product.dart';
import 'ProductDetailsScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Product> products = [
    Product(
      id: '1',
      name: 'T-Shirt',
      price: '\$300',
      rating: 55,
      description: 'cotton T-Shirt with modern design.',
      images: ['assets/images/tshirt1.jpg'],
    ),
    Product(
      id: '2',
      name: 'Jacket',
      price: '\$100',
      rating: 96,
      description: 'jacket for all seasons.',
      images: ['assets/images/jacket.jpg'],
    ),
    Product(
      id: '3',
      name: 'T-Shirt',
      price: '\$50',
      rating: 80,
      description: 'Cool cap to complement your style.',
      images: ['assets/images/tshirt2.jpg'],
    ),
    Product(
      id: '4',
      name: 'Bag',
      price: '\$150',
      rating: 90,
      description: 'Bag simple.',
      images: ['assets/images/bag1.jpg'],
    ),
    Product(
      id: '5',
      name: 'T-Shirt',
      price: '\$400',
      rating: 75,
      description: ' cotton T-Shirt with modern design',
      images: ['assets/images/tshirt3.jpg'],
    ),
  ];

  List<Widget> _pages() {
    return [
      _buildHomeContent(),
      const CartScreen(),
      const QrCodePage(),
      const FavoritePage(),
      const ProfilePage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: Colors.red),
                      SizedBox(width: 8),
                      Text("Find Your Product", style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.red),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 140,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFF9A9E), Color(0xFFFAD0C4)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "YOU PICK WE DELIVER",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Delivering Happiness",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildProductSection(context, "Featured Products", products),
          const SizedBox(height: 20),
          _buildNewestProductsSection(context, "Newest Products", products.reversed.toList()),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildNewestProductsSection(BuildContext context, String title, List<Product> productsList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.7,
          ),
          itemCount: productsList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: productsList[index]),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        productsList[index].images.first,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(Icons.error),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      productsList[index].name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        Text(
                          "(${productsList[index].rating})",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Text(
                      productsList[index].price,
                      style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildProductSection(BuildContext context, String title, List<Product> productsList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productsList.length,
            itemBuilder: (context, index) {
              return Container(
                width: 160,
                margin: const EdgeInsets.only(right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  ProductDetailScreen (product: productsList[index]),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              height: 180,
                              width: 160,
                              color: Colors.grey[200],
                              child: Image.asset(
                                productsList[index].images.first,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => const Icon(Icons.error),
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 8,
                            right: 8,
                            child: Icon(Icons.favorite_border, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      productsList[index].name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        Text(
                          "(${productsList[index].rating})",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Text(
                      productsList[index].price,
                      style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = _pages();
    return Scaffold(
      backgroundColor: const Color(0xFFFDEFF3),
      body: SafeArea(child: pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'QR'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
