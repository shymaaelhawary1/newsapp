import 'package:flutter/material.dart';
import 'package:newsapp/dashboard/General/model/model.dart';
import 'package:newsapp/dashboard/General/veiw/each%20categoryPage.dart';
import 'package:newsapp/dashboard/newDetails.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewDetails(
              category: this.category,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              category.image ?? 'https://png.pngtree.com/thumb_back/fh260/background/20210902/pngtree-news-interview-news-report-background-image_784557.jpg',
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8.0),
            Text(
              category.title ?? '',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4.0),
            Text(
              category.Subtitle ?? '',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Spacer(),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewDetails(category: this.category,),
                        ),
                      );
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
    );
  }
}
