import 'package:flutter/material.dart';
import 'package:newsapp/dashboard/General/model/model.dart';

class NewDetails extends StatelessWidget {
  const NewDetails({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                category.image??   'https://png.pngtree.com/thumb_back/fh260/background/20210902/pngtree-news-interview-news-report-background-image_784557.jpg',
                height: 400,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16.0),
               Center(
                child: Text(
                  category.title??'',
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16.0),
               Center(
                child: Text(
                  category.Subtitle??'',
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
