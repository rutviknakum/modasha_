import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String? selectedState;
  String? selectedCity;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Personal Details'),
            _buildTextField('Full Name', 'Enter your name'),
            _buildTextField('Email Address', 'Enter your email'),
            _buildTextField('Phone number', 'Enter your phone number'),
            _buildTextField('Street Address', 'Enter your address'),
            Row(
              children: [
                Expanded(
                  child: _buildDropdown('State', [
                    'Bangladesh',
                    'India',
                  ], (value) => setState(() => selectedState = value)),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _buildDropdown('City', [
                    'Sylhet',
                    'Dhaka',
                  ], (value) => setState(() => selectedCity = value)),
                ),
              ],
            ),
            _buildTextField('Postal Code', 'Enter postal code'),
            _buildSectionTitle('Product Details'),
            _buildProductCard(),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {},
              child: Center(
                child: Text(
                  'Proceed to Payment',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    List<String> items,
    Function(String?) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(border: OutlineInputBorder()),
          items:
              items
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildProductCard() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Image.asset(
              'assets/Quiz.png',
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'F.U Lose Small Kit',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '₹ 4900',
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed:
                            () => setState(
                              () =>
                                  quantity = (quantity > 1) ? quantity - 1 : 1,
                            ),
                      ),
                      Text('$quantity', style: TextStyle(fontSize: 16)),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => setState(() => quantity++),
                      ),
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
