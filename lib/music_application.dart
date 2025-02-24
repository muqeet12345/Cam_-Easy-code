import 'package:flutter/material.dart';

class EasyPaisaScreen extends StatefulWidget {
  @override
  EasyPaisaWidget createState() => EasyPaisaWidget();
}

class EasyPaisaWidget extends State<EasyPaisaScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('DigitalBank'),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Available Balance Section
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Colors.white,
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/easypaisa.jpg", height: 50, width: 100),
                        Row(
                          children: [
                            Icon(Icons.card_giftcard, color: Colors.green),
                            SizedBox(width: 5),
                            Text("Rewards", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text('Available Balance', style: TextStyle(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('Rs 5000', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
                            SizedBox(width: 8),
                            Icon(Icons.visibility_off, color: Colors.green),
                          ],
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.add, size: 18),
                          label: Text('Add Money'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25),

            // Quick Actions
            Text("Quick Actions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _quickActionButton(Icons.send, "Send Money"),
                _quickActionButton(Icons.phone_android, "Mobile Packages"),
                _quickActionButton(Icons.payment, "Bill Payment"),
              ],
            ),
            SizedBox(height: 25),

            // More Actions with 2 rows
            Text("More Actions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
            SizedBox(height: 15),
            Wrap(
              spacing: 40,
              runSpacing: 15,
              children: [
                _quickActionButton(Icons.qr_code_scanner, "Scan & Pay"),
                _quickActionButton(Icons.account_balance, "Bank Transfer"),
                _quickActionButton(Icons.shopping_cart, "Shopping"),
                _quickActionButton(Icons.card_membership, "Insurance"),
                _quickActionButton(Icons.attach_money, "Loan"),
                _quickActionButton(Icons.savings, "Saving"),
              ],
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: "Wallet"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Profile"),
        ],
      ),
    );
  }

  // Widget for Quick & More Actions
  Widget _quickActionButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.green.shade100,
          child: Icon(icon, color: Colors.green, size: 30),
        ),
        SizedBox(height: 6),
        Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      ],
    );
  }
}