import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/business_logic/cubit/categories/categories_cubit.dart';
import 'package:food/presentation/screens/home/home_screen.dart';

onGenerateRoute(RouteSettings settings) {
  WidgetBuilder builder;
  switch (settings.name) {
    case '/':
      builder = (BuildContext _) => BlocProvider(
            create: (context) => CategoriesCubit(),
            child: const HomeScreen(),
          );
      break;
    default:
      throw Exception('Invalid route: ${settings.name}');
  }
  return MaterialPageRoute(builder: builder, settings: settings);
}
