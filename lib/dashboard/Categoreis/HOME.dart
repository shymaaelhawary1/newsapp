import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/dashboard/Categoreis/bannerCustom.dart';
import 'package:newsapp/dashboard/Categoreis/controller/cubit/category_cubit.dart';
import 'package:newsapp/dashboard/Categoreis/generalCategories.dart';

class CategoryNews extends StatefulWidget {
  const CategoryNews({super.key});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<String> generalCategoryImages = [
    'assets/business.PNG',
    'assets/Culture.PNG',
    'assets/entertainment.PNG',
    'assets/heath.PNG',
    'assets/lifestyle.PNG',
    'assets/science.PNG',
    'assets/sports (1).jpg',
    'assets/technology.PNG',
  ];
  List<String> generalCategorynames = [
    'Business',
    'Culture',
    'Entertainment',
    'Heath',
    'Lifestyle',
    'Science',
    'Sports',
    'Technology',
  ];
  List<String> generalCategoryURL = [
    'business',
    'culture',
    'entertainment',
    'health',
    'lifestyle',
    'science',
    'sports',
    'technology',
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewsNow'),
        backgroundColor: const Color.fromARGB(255, 218, 218, 218),
        actions: const [
          Icon(Icons.notifications),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyBanner().showBanner(),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 218, 218, 218),
              ),
              height: 70,
              width: double.infinity,
              child: const Center(
                child: Text(
                  'Provided Categories',
                  style: TextStyle(
                      fontSize: 25, color: Color.fromARGB(255, 10, 10, 10)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: generalCategoryImages.length,
              itemBuilder: (context, index) {
                return GeneralCategories(
                  generalImages: generalCategoryImages[index],
                  category: generalCategorynames[index],
                  categoryurl: generalCategoryURL[index],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 218, 218, 218),
        fixedColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        
      ),
    );
  }
}
