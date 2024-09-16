import 'package:deneme1/components/fortunes/showallfortune_page.dart';
import 'package:deneme1/components/jetonupload/jetonyukleme_page.dart';
import 'package:flutter/material.dart';
import 'package:deneme1/components/camera/camera_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Color.fromARGB(255, 235, 83, 7),
                  Color.fromARGB(255, 239, 12, 12),
                ],
              ),
            ),
            child: ListView(
              children: const [
                HeaderSection(),
                WelcomeSection(),
                GridSection(),
              ],
            ),
          ),
          const Positioned(
            bottom: 30,
            left: 16,
            right: 16,
            child: ShowFortunesButton(),
          ),
        ],
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 290,
      color: Colors.transparent,
      child: const Padding(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            HeaderRow(),
            SizedBox(height: 70),
            WelcomeText(),
          ],
        ),
      ),
    );
  }
}

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      height: 30,
      child: const Padding(
        padding: EdgeInsets.only(left: 12),
        child: Text(
          '🔮 Hemen yeni bir fal baktır!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
            shadows: [
              Shadow(
                offset: Offset(1.5, 1.5),
                blurRadius: 4.0,
                color: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  const HeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 8,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '  Kısmet',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  offset: Offset(1.5, 1.5),
                  blurRadius: 4.0,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const JetonYuklemePage(),
                ),
              );
            },
            child: const Text(
              '💰30  ',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    offset: Offset(1.5, 1.5),
                    blurRadius: 4.0,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, right: 160),
          child: Text(
            '🎉 Hoş Geldin Emre!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  offset: Offset(1.5, 1.5),
                  blurRadius: 4.0,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 50),
          child: Text(
            'Bildiğim tek şey, hiç bir şey bilmediğimdir.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.white70,
              shadows: [
                Shadow(
                  offset: Offset(1.5, 1.5),
                  blurRadius: 4.0,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 260),
          child: Text(
            '-Sokrates',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.white,
              shadows: [
                Shadow(
                  offset: Offset(1.5, 1.5),
                  blurRadius: 4.0,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class GridSection extends StatelessWidget {
  const GridSection({super.key});

  final List<String> gridTexts = const [
    'El Falı',
    'Kahve Falı',
    'Tarot Falı',
    'Yıldızname',
    'Rüya Yorumu',
    'Burç Yorumu',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      height: 400,
      padding: const EdgeInsets.only(top: 30, bottom: 20),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 15.0,
        childAspectRatio: 0.8,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: List.generate(
          gridTexts.length,
          (index) => _buildGridItem(context, index),
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () async {
        String fortuneType = gridTexts[index];
        String? imagePath;

        // Update the logic based on the selected fortune type
        switch (fortuneType) {
          case 'Kahve Falı':
            imagePath = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CameraPage(fortuneType: 'Kahve Fincanı'),
              ),
            );
            break;
          case 'El Falı':
            imagePath = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CameraPage(fortuneType: 'El'),
              ),
            );
            break;
          case 'Tarot Falı':
            imagePath = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CameraPage(fortuneType: 'Tarot Kartı'),
              ),
            );
            break;
          case 'Yıldızname':
            imagePath = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CameraPage(fortuneType: 'Yıldızname'),
              ),
            );
            break;
          case 'Rüya Yorumu':
            imagePath = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CameraPage(fortuneType: 'Rüya'),
              ),
            );
            break;
          case 'Burç Yorumu':
            imagePath = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CameraPage(fortuneType: 'Burç'),
              ),
            );
            break;
        }

        if (imagePath != null) {
          print('$fortuneType için çekilen fotoğraf: $imagePath');
          // Burada fotoğrafı işleyebilir veya başka bir sayfaya yönlendirebilirsiniz
        }
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/elfali.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            gridTexts[index],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class ShowFortunesButton extends StatelessWidget {
  const ShowFortunesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ShowAllFortunesPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: const BorderSide(color: Colors.white, width: 1),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            child: const Text(
              "Show All Fortunes",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
