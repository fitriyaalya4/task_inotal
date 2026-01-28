import 'package:flutter/material.dart';

class InpatientCareScreen extends StatefulWidget {
  const InpatientCareScreen({super.key});

  @override
  State<InpatientCareScreen> createState() => _InpatientCareScreenState();
}

class _InpatientCareScreenState extends State<InpatientCareScreen> {

  bool onlyAvailable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {},
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.refresh, color: Colors.white),
              ),
            ),
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF3FA9F5), Color(0xFF2D7FEF)],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 16),
          _buildStatisticCard(),
          const SizedBox(height: 12),
          _buildFilter(),
          const SizedBox(height: 12),
          Expanded(child: _buildGrid()),
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
        children: [
          const SizedBox(height: 16),
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.bed,
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Ketersediaan Bed",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "Update: 19.03",
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              _StatItem(
                icon: Icons.bed,
                value: "30",
                label: "Total Bed",
                color: Colors.blue,
              ),
              _StatItem(
                icon: Icons.check_circle,
                value: "6",
                label: "Tersedia",
                color: Colors.green,
              ),
              _StatItem(
                icon: Icons.cancel,
                value: "24",
                label: "Penuh",
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.filter_list, color: Colors.blue),
                  SizedBox(width: 8),
                  Text("Filter", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                children: [
                  const Text("Hanya Tersedia"),
                  Switch(
                    value: onlyAvailable,
                    onChanged: (value) {
                      setState(() {
                        onlyAvailable = value;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildGrid() {
    final rooms = [
      Room("IGD", 6, 0.20),
      Room("VVIP", 2, 0.36),
      Room("VIP", 3, 0.80),
      Room("Kelas 1", 10, 0.73),
      Room("Kelas 2", 12, 0.73),
      Room("Kelas 3", 18, 0.73),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GridView.builder(
        itemCount: rooms.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.78,
        ),
        itemBuilder: (context, index) {
          return _RoomCard(room: rooms[index]);
        },
      ),
    );
  }
}

class Room {
  final String name;
  final int available;
  final double occupancy;

  Room(this.name, this.available, this.occupancy);
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.15),
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
class _RoomCard extends StatelessWidget {
  final Room room;

  const _RoomCard({required this.room});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(room.name,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const Text("Rawat Inap", style: TextStyle(color: Colors.grey)),
                  ],
                ),
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.green.shade100,
                  child: const Icon(Icons.bed, color: Colors.green),
                )
              ],
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                Text("${room.available}",
                    style: const TextStyle(fontSize: 24, color: Colors.green)),
                const SizedBox(width: 4),
                const Text("Bed"),
              ],
            ),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text("Tersedia", style: TextStyle(color: Colors.green)),
            ),

            const Text("Okupansi"),
            const SizedBox(height: 4),

            LinearProgressIndicator(
              value: room.occupancy,
              backgroundColor: Colors.grey.shade300,
              color: Colors.green,
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.attach_money, color: Colors.green),
                label: const Text("Lihat Harga",
                  style: TextStyle(color: Colors.green),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.green,
                    width: 1.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}