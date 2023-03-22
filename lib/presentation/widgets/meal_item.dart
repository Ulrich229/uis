import 'package:flutter/material.dart';
import 'package:food/data/models/meal.dart';
import 'package:sizer/sizer.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final bool isLarge;
  const MealItem({
    Key? key,
    required this.meal,
    required this.isLarge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 43.w,
      padding: EdgeInsets.symmetric(horizontal: 1.w,),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              InkWell(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 12,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 1.h,
                    ),
                    height: isLarge ? 30.h : 20.h,
                    width: 43.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(meal.imagePath),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 3.w, top: 1.5.h),
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.favorite_border,
                    size: 10.sp,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            "Titre du produit",
            style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            "Le Lorem Ipsum est simplement du faux texte employé",
            style: TextStyle(
              fontSize: 10.sp,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            "Prix Fcfa",
            style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 3.h,
          ),
        ],
      ),
    );
  }
}
