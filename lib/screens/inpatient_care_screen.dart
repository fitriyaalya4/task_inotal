import 'package:flutter/material.dart';

class InpatientCareScreen extends StatefulWidget {
  const InpatientCareScreen({super.key});

  @override
  State<InpatientCareScreen> createState() => _InpatientCareScreenState();
}

class _InpatientCareScreenState extends State<InpatientCareScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () {},
          )
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF3FA9F5), Color(0xFF2D7FEF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text("Konten Halaman"),
      ),
    );
  }
}