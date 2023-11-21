import 'package:flutter/material.dart';

class Home1Screen extends StatelessWidget {
  const Home1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  _buildAppBar() => AppBar(
        backgroundColor: Colors.redAccent,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            )),
      );

  _buildBody(BuildContext context) => Container(
        color: Colors.white,
        child: Column(
          children: [
            _buildSearchSection(),
            _buildImageSection(context),
          ],
        ),
      );

  _buildSearchSection() {
    final searchTextBorder = OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(20));
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text.rich(
              TextSpan(
                style: TextStyle(color: Colors.white),
                children: [
                  TextSpan(text: 'Find Your', style: TextStyle(fontSize: 18)),
                  TextSpan(
                    text: '\nInspiration',
                    style: TextStyle(
                      height: 1,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                enabledBorder: searchTextBorder,
                focusedBorder: searchTextBorder,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  _buildImageSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Promo today',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildLayoutImageRow('assets/images/image_1.jpg'),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildLayoutImageRow('assets/images/image_2.jpg'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _buildLayoutSingleImage('assets/images/image_3.jpg'),
        ],
      ),
    );
  }

  _buildLayoutImageRow(
    String image,
  ) =>
      _buildLayoutImage(image: image, ratio: 3 / 4);

  _buildLayoutSingleImage(String image) =>
      _buildLayoutImage(image: image, ratio: 16 / 9);

  _buildLayoutImage({
    required String image,
    required double ratio,
  }) =>
      AspectRatio(
        aspectRatio: ratio,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                stops: const [0.2, 0.9],
                colors: [
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.1),
                ],
              ),
            ),
            child: const Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Title',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      );
}
