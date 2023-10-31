import 'package:flutter/material.dart';

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            isExpanded = !isExpanded;
            setState(() {});
          },
          child: AnimatedContainer(
            curve: Curves.slowMiddle,
            duration: const Duration(seconds: 1),
            width: isExpanded ? 200 : 80.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: isExpanded ? Colors.green : Colors.blue,
              borderRadius: BorderRadius.circular(isExpanded ? 40 : 10.0),
            ),
            child: isExpanded
                ?const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       Icon(
                        Icons.done,
                        color: Colors.white,
                      ),
                       Text('Added to Cart')
                    ],
                  )
                : const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
          ),
        ),
      ),
    );
  }
}
