import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/business_logic/cubit/categories/categories_cubit.dart';
import 'package:food/data/models/meal.dart';
import 'package:food/presentation/screens/home/widgets/category_item.dart';
import 'package:food/presentation/widgets/meal_item.dart';
import 'package:food/utils/color_manager.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _page;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    _page = 0;
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    const FlutterLogo(),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Les meilleurs condiments",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "Le Lorem Ipsum est simplement du faux texte employé dans la composition.",
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 8,
                          child: Container(
                            height: 5.h,
                            padding: EdgeInsets.only(left: 3.w),
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorManager.grey),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                hintText: "rechercher un article"
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 5.h,
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorManager.grey),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    BlocBuilder<CategoriesCubit, CategoriesState>(
                      builder: (context, state) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: state.categories
                                .map(
                                  (category) => CategoryItem(
                                    isSelected:
                                        state.categories.indexOf(category) ==
                                            state.selectedCategoryIndex,
                                    onTap: () {
                                      BlocProvider.of<CategoriesCubit>(context)
                                          .selectCategory(
                                        state.categories.indexOf(category),
                                      );
                                    },
                                    category: category,
                                    index: state.categories.indexOf(category),
                                  ),
                                )
                                .toList(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Wrap(
                      children: dummyMeals
                          .map(
                            (meal) => RepaintBoundary(
                              child: MealItem(
                                meal: meal,
                                isLarge: dummyMeals.indexOf(meal) % 4 == 2 ||
                                    dummyMeals.indexOf(meal) % 4 == 1,
                              ),
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(),
          Container(),
          Container(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 12,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 0,
        backgroundColor: Colors.pink,
        selectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: "cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'favorite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "profile"),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}
