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
        body: Column(
          children: [
            _buildHeader(),
            const Expanded(
              child: Center(
                child: Text("Konten Halaman"),
              ),
            ),
          ],
        ),
      );
    }

    Widget _buildHeader() {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.only(bottom: 24),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3FA9F5), Color(0xFF2D7FEF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: const [
            SizedBox(height: 16),
            Icon(Icons.bed, color: Colors.white, size: 48),
            SizedBox(height: 8),
            Text(
              "Ketersediaan Bed",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Update: 15.02",
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      );
    }
}