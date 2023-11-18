import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/components/my_button.dart';
import 'package:minimal_ecommerce_app/models/product.dart';
import 'package:minimal_ecommerce_app/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void payButtonPressd(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content:
            Text("User wants to pay! Connect this app to your payment backend"),
      ),
    );
  }

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Remove this item from your cart?"),
        actions: [
          //No
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),

          //Yes
          MaterialButton(
            onPressed: () {
              //pop dialog
              Navigator.pop(context);

              // add to cart
              context.read<Shop>().removeFromCart(product);
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get access to the cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cart Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // Cart list
          Expanded(
            child: cart.isEmpty
                ? const Center(child: Text("Yout cart is empty."))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      //get individual item in cart
                      final item = cart[index];

                      return ListTile(
                        leading: Image.asset(item.imagePath),
                        title: Text(item.name),
                        subtitle: Text(item.price.toStringAsFixed(2)),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => removeItemFromCart(context, item),
                        ),
                      );
                    },
                  ),
          ),

          //Pay
          Padding(
            padding: const EdgeInsets.all(50),
            child: MyButton(
                onTap: () => payButtonPressd(context),
                child: const Text("PAY NOW")),
          )
        ],
      ),
    );
  }
}
