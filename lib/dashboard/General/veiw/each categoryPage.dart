import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/dashboard/Categoreis/controller/cubit/category_cubit.dart';
import 'package:newsapp/dashboard/General/veiw/categoryCard.dart';
import 'package:newsapp/dashboard/General/model/model.dart';

class General extends StatelessWidget {
  const General({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: BlocBuilder<DashboardCubit, CategoryState>(
        builder: (context, state) {
          if (state is GetNewsLoading) {
          
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetNewsSuccess) {
          
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return ArticleCard(category: state.data[index]);
              },
            );
          } else if (state is GetNewsError) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}


