import 'package:flutter/material.dart';

class ShowAllFortunesPage extends StatelessWidget {
  const ShowAllFortunesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Bu liste normalde bir veritabanından veya API'den gelecektir
    final List<Fortune> fortunes = [
      Fortune(
          type: 'Kahve Falı',
          date: '10 Mayıs 2023',
          description: 'Yakında güzel bir haber alacaksınız.'),
      Fortune(
          type: 'Tarot Falı',
          date: '15 Mayıs 2023',
          description: 'Kariyerinizde yeni fırsatlar görünüyor.'),
      Fortune(
          type: 'El Falı',
          date: '20 Mayıs 2023',
          description: 'Uzun ve sağlıklı bir ömür çizginiz var.'),
      // Daha fazla fal eklenebilir
    ];

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 235, 83, 7),
              Color.fromARGB(255, 239, 12, 12),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Geçmiş Fallarınız",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Daha önce baktırdığınız fallar",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: ListView.builder(
                    itemCount: fortunes.length,
                    itemBuilder: (context, index) {
                      return FortuneCard(fortune: fortunes[index]);
                    },
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

class Fortune {
  final String type;
  final String date;
  final String description;

  Fortune({required this.type, required this.date, required this.description});
}

class FortuneCard extends StatelessWidget {
  final Fortune fortune;

  const FortuneCard({Key? key, required this.fortune}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  fortune.type,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  fortune.date,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(fortune.description),
          ],
        ),
      ),
    );
  }
}
