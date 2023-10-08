import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _bill = 0;
  int _tipPercentage = 0;
  int _numberOfPeople = 1;
  final TextEditingController _billAmountController = TextEditingController();
  final TextEditingController _tipPercentageController = TextEditingController();
  final TextEditingController _numberOfPeopleController = TextEditingController(text: '1');

  void _resetButtonAction() {
    setState(() {
      _bill = 0;
      _tipPercentage = 0;
      _numberOfPeople = 1;
      _billAmountController.clear();
      _tipPercentageController.clear();
      _numberOfPeopleController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip Calculator'),
        backgroundColor: const Color(0xFF00494D),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            billingInputInfo(),
            const SizedBox(height: 20),
            selectTipPercentageInfo(),
            const SizedBox(height: 20),
            numberOfPeopleInputInfo(),
            const SizedBox(height: 20),
            outputCardInfo(),
            const SizedBox(height: 20),
            resetButton(),
          ],
        ),
      ),
    );
  }

  Widget billingInputInfo() => inputCard("Bill", _billAmountController, Icons.attach_money_outlined);

  Widget numberOfPeopleInputInfo() => inputCard("Number of People", _numberOfPeopleController, Icons.group);

  Widget inputCard(String title, TextEditingController controller, IconData icon) {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text(title),
        leading: Icon(icon),
        subtitle: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10.0),
            hintText: 'Enter $title',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget selectTipPercentageInfo() {
    return TextField(
      controller: _tipPercentageController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10.0),
        hintText: 'Enter Tip Percentage',
        prefixText: '%',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }

  Widget outputCardInfo() {
    double tipAmount = _bill * _tipPercentage / 100;
    double totalAmount = _bill + tipAmount;
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text('Tip Amount: \$${tipAmount.toStringAsFixed(2)}'),
            const SizedBox(height: 10),
            Text('Total Amount: \$${totalAmount.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }

  Widget resetButton() {
    return ElevatedButton(
      onPressed: _resetButtonAction,
      child: const Text("Reset"),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF26c0ab)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
    );
  }
}
