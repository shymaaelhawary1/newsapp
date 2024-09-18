import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/dashboard/Categoreis/controller/cubit/category_cubit.dart';
import 'package:newsapp/dashboard/General/veiw/each%20categoryPage.dart';

class GeneralCategories extends StatelessWidget {
  const GeneralCategories({
    required this.generalImages,
    required this.category,
    required this.categoryurl,
  });

  final String generalImages;
  final String category;
  final String categoryurl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          
          BlocProvider.of<DashboardCubit>(context).getNews(category: categoryurl);

          
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => General(categoryName: categoryurl,),
            ),
          );
        },
        child: Container(
          height: 150,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              image: AssetImage(generalImages),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              category,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
