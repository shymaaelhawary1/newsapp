import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/dashboard/APIServices/API.dart';
import 'package:newsapp/dashboard/Categoreis/HOME.dart';
import 'package:device_preview/device_preview.dart';
import 'package:newsapp/dashboard/Categoreis/controller/cubit/category_cubit.dart';
import 'package:newsapp/dashboard/General/veiw/each%20categoryPage.dart';
import 'package:newsapp/dashboard/newDetails.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),    
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        home: CategoryNews(),
      ),
    );
  }
}
