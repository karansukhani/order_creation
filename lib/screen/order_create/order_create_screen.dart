import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:order_creation/model/customer_list_entity.dart';
import 'package:order_creation/model/product_list_entity.dart';
import 'package:order_creation/screen/order_create/logic/order_create_repository.dart';
import 'package:order_creation/screen/signature_pad/signature_pad_screen.dart';
import 'package:order_creation/shared_preferences/pref_key.dart';
import 'package:order_creation/shared_preferences/pref_value.dart';
import 'package:order_creation/shared_preferences/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/order_item.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key});

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  String? selectedCustomer;

  List<OrderItem> orderItems = [OrderItem()];
  String? signatureBase64;

  List<CustomerListGetCustomersResult> customersList = [];

  List<String> categoryList = [];
  List<ProductListGetProductsResult> productList = [];

  @override
  void initState() {
    super.initState();
    initData();
    loadSignature();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black87),
          onPressed: () {},
        ),
        title: const Text(
          'Add Order',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select Customer',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedCustomer,
                        hint: const Text('Choose a customer'),
                        isExpanded: true,
                        items: customersList.map((customer) {
                          return DropdownMenuItem(
                            value: customer.name,
                            child: Text(customer.name ?? ''),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCustomer = value;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Order Items',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ListView.builder(
                            itemCount: orderItems.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final item = orderItems[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: productRow(item, index),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: addOrderItem,
                      icon: const Icon(Icons.add, color: Colors.red),
                      label: const Text(
                        'Add Another Product',
                        style: TextStyle(color: Colors.red),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Signature',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: navigateToSignaturePad,
                    child: Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[50],
                      ),
                      child: signatureBase64 != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.memory(
                                //Decode the encoded png data
                                base64Decode(signatureBase64 ?? ''),
                                fit: BoxFit.contain,
                              ),
                            )
                          : const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.edit,
                                  size: 32,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Tap to add signature',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if ((selectedCustomer ?? '').isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please select Customer"),
                      backgroundColor: Colors.red,
                    ));
                  } else if (orderItems.any(
                      (item) => ((item.selectedProduct ?? '').isEmpty) || ((item.selectedCategory ?? '').isEmpty))) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please select product and category for all items"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    showConfirmDialog();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Confirm Order',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.check, size: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> initData() async {
    String categoryListStr = await SharedPref.getString(PrefKey.categoryList);
    String productListStr = await SharedPref.getString(PrefKey.productList);
    String customerListStr = await SharedPref.getString(PrefKey.customerList);

    if (customerListStr.isEmpty || productListStr.isEmpty || categoryListStr.isEmpty) {
      await OrderCreateRepository().callGetCustomersApi();
      await OrderCreateRepository().callGetProductsApi();
      await OrderCreateRepository().callGetCategoriesApi();
    }

    categoryList = await PrefValue().getCategoryList();
    productList = await PrefValue().getProductList();
    customersList = await PrefValue().getCustomerList();
    setState(() {
      categoryList;
      productList;
      customersList;
    });
  }

  Future<void> loadSignature() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      signatureBase64 = prefs.getString(PrefKey.orderSignature);
    });
  }

  Future<void> saveSignature(String signature) async {
    final prefs = await SharedPreferences.getInstance();
    //save the encoded signature png data to shared Pref
    await prefs.setString(PrefKey.orderSignature, signature);

    //Update the signature in the current screen after getting from signature pad screen
    setState(() {
      signatureBase64 = signature;
    });
  }

  void addOrderItem() {
    setState(() {
      for (OrderItem item in orderItems) {
        if ((item.selectedCategory ?? '').isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Please Select Category"),
              backgroundColor: Colors.red,
            ),
          );
          return;
        } else if ((item.selectedProduct ?? '').isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Please Select Product"),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }
        item.isExpanded = false;
      }
      orderItems.add(OrderItem(isExpanded: true));
    });
  }

  void removeOrderItem(int index) {
    if (orderItems.length > 1) {
      setState(() {
        orderItems.removeAt(index);
      });
    }
  }

  void navigateToSignaturePad() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignaturePadScreen(
          initialSignature: signatureBase64,
        ),
      ),
    ).then((value) async {
      if (value != null) {
        await saveSignature(value);
      }
    });
  }

  Widget productRow(OrderItem item, int index) {
    if (item.isExpanded) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: item.selectedCategory,
                      hint: const Text('Category', style: TextStyle(fontSize: 12)),
                      isExpanded: true,
                      items: categoryList.map((category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Text(category, style: const TextStyle(fontSize: 12)),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          item.selectedCategory = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: item.selectedProduct,
                      hint: const Text('Product', style: TextStyle(fontSize: 12)),
                      isExpanded: true,
                      items: productList.map((product) {
                        return DropdownMenuItem(
                          value: product.name,
                          child: Text(product.name ?? '', style: const TextStyle(fontSize: 12)),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          item.selectedProduct = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    if (item.quantity > 1) {
                      setState(() {
                        item.quantity--;
                      });
                    }
                  },
                  icon: const Icon(Icons.remove, color: Colors.white, size: 16),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 60,
                height: 32,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.center,
                child: TextField(
                  controller: TextEditingController(text: item.quantity.toString()),
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isCollapsed: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: const TextStyle(fontSize: 14, height: 1.2),
                  onChanged: (value) {
                    final qty = int.tryParse(value) ?? 1;
                    setState(() {
                      item.quantity = qty > 0 ? qty : 1;
                    });
                  },
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      item.quantity++;
                    });
                  },
                  icon: const Icon(Icons.add, color: Colors.white, size: 16),
                ),
              ),
              const Spacer(),
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => removeOrderItem(index),
                  icon: const Icon(Icons.delete_outline, color: Colors.white, size: 16),
                ),
              ),
            ],
          ),
          if (index < orderItems.length - 1)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Divider(height: 1),
            ),
        ],
      );
    } else {
      return InkWell(
        onTap: () {
          setState(() {
            orderItems[index].isExpanded = true;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.selectedProduct ?? '-',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.selectedCategory ?? '-',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              // Quantity
              Text(
                'Qty: ${item.quantity}',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  void showConfirmDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Order'),
        content: const Text('Are you sure you want to confirm this order?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              for (OrderItem item in orderItems) {
                item.isExpanded = false;
                setState(() {});
              }
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Order confirmed successfully!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Confirm', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
