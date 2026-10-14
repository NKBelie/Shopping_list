
import 'package:flutter/material.dart';

class Item {
  Item(this.name);

  final String name;
  bool bought = false;
}

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
      ),
      home: const HomeScreen(title: 'Shopping List'),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Item> items = [
    Item('Milk'),
    Item('Bread'),
    Item('Rice'),
  ];

  final TextEditingController controller = TextEditingController();

  int get itemsLeft => items.where((item) => !item.bought).length;

  void addItem() {
    final text = controller.text.trim();

    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Type an item first')),
      );
      return;
    }

    if (items.any(
          (item) => item.name.toLowerCase() == text.toLowerCase(),
    )) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$text is already on the list')),
      );
      return;
    }

    setState(() {
      items.add(Item(text));
    });

    controller.clear();
  }

  void removeItem(int index) {
    final removedItem = items[index].name;

    setState(() {
      items.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$removedItem removed')),
    );
  }

  void clearBoughtItems() {
    final boughtCount = items.where((item) => item.bought).length;

    if (boughtCount == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No bought items to remove')),
      );
      return;
    }

    setState(() {
      items.removeWhere((item) => item.bought);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$boughtCount bought item${boughtCount == 1 ? '' : 's'} removed',
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title} ($itemsLeft left)'),
        actions: [
          IconButton(
            tooltip: 'Remove bought items',
            icon: const Icon(Icons.cleaning_services_outlined),
            onPressed: clearBoughtItems,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Add an item',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => addItem(),
                  ),
                ),
                const SizedBox(width: 12),
                FilledButton(
                  onPressed: addItem,
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: items.isEmpty
                ? const Center(
              child: Text(
                'Your list is empty',
                style: TextStyle(fontSize: 18),
              ),
            )
                : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];

                return ListTile(
                  leading: Icon(
                    item.bought
                        ? Icons.check_circle
                        : Icons.shopping_basket,
                    color: item.bought ? Colors.green : null,
                  ),
                  title: Text(
                    item.name,
                    style: TextStyle(
                      decoration: item.bought
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      item.bought = !item.bought;
                    });
                  },
                  trailing: IconButton(
                    tooltip: 'Delete ${item.name}',
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => removeItem(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
