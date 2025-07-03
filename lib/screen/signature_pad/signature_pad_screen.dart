import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SignaturePadScreen extends StatefulWidget {
  String? initialSignature;

  SignaturePadScreen({
    super.key,
    this.initialSignature,
  });

  @override
  State<SignaturePadScreen> createState() => SignaturePadScreenState();
}

class SignaturePadScreenState extends State<SignaturePadScreen> {
  final SignatureController signatureController = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  bool cleared = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialSignature != null) {
      try {
        base64Decode(widget.initialSignature!);
      } catch (e) {
        print("Error loading initial signature");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black87),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Add Signature',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          if (showInitialSignature() || signatureController.isNotEmpty)
            TextButton(
              onPressed: clearSignature,
              child: const Text(
                'Clear',
                style: TextStyle(color: Colors.red),
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: showInitialSignature()
                    ? Image.memory(
                        base64Decode(widget.initialSignature ?? ''),
                        fit: BoxFit.contain,
                        width: MediaQuery.of(context).size.width,
                      )
                    : Signature(
                        controller: signatureController,
                        backgroundColor: Colors.white,
                      ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: saveSignature,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Save Signature',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool showInitialSignature() {
    return widget.initialSignature != null && (widget.initialSignature ?? '').isNotEmpty;
  }

  void saveSignature() async {
    if (signatureController.isNotEmpty) {
      //This takes the data signatureController and stores it in raw png byte data
      final Uint8List? data = await signatureController.toPngBytes();
      if (data != null) {
        //This raw png data is encoded and sent to the previous screen
        final String base64String = base64Encode(data);
        Navigator.pop(context, base64String);
        return;
      }
    }

    //If no changes in the signature then pass the previous signature data back
    if (widget.initialSignature != null) {
      Navigator.pop(context, widget.initialSignature);
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please add a signature before saving'),
        backgroundColor: Colors.red,
      ),
    );
  }

  void clearSignature() {
    signatureController.clear();

    setState(() {
      widget.initialSignature = '';
    });
  }

  @override
  void dispose() {
    signatureController.dispose();
    super.dispose();
  }
}
