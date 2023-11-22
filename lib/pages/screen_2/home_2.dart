import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Home2Screen extends StatefulWidget {
  const Home2Screen({super.key});

  @override
  State<Home2Screen> createState() => _Home2ScreenState();
}

class _Home2ScreenState extends State<Home2Screen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  _buildBody() => PageView.builder(
        controller: _pageController,
        itemCount: 4,
        itemBuilder: (context, index) {
          final page = index + 1;
          return _buildPageView('assets/images/image_$page.jpg', page);
        },
      );

  _buildPageView(String image, int page) => Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                stops: const [0.2, 0.9],
                colors: [
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.1),
                ],
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Text.rich(
              TextSpan(
                style: const TextStyle(color: Colors.white),
                children: [
                  TextSpan(
                    text: page.toString(),
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text: '/4',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0, left: 0, right: 0, child: _buildContentArea(page)),
        ],
      );

  _buildContentArea(int page) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title $page \nDescription',
              style: const TextStyle(fontSize: 40, color: Colors.white),
            ),
            const SizedBox(height: 30),
            _buildRatingBarSection(),
            const SizedBox(height: 10),
            const Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting\n industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
              style: TextStyle(fontSize: 18, color: Colors.white70),
              maxLines: 5,
            ),
            const SizedBox(height: 10),
            const Text(
              'READ MORE',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      );

  _buildRatingBarSection() => Row(
        children: [
          RatingBarIndicator(
            rating: 3,
            unratedColor: Colors.white38,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: 24.0,
            direction: Axis.horizontal,
          ),
          const SizedBox(width: 10),
          const Text(
            '3.0',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          const Text(
            '(2610)',
            style: TextStyle(fontSize: 18, color: Colors.white54),
          )
        ],
      );
}
