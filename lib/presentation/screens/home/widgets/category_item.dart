import 'package:flutter/material.dart';
import 'package:food/utils/color_manager.dart';
import 'package:sizer/sizer.dart';

class CategoryItem extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String category;
  final int index;
  const CategoryItem({
    Key? key,
    required this.isSelected,
    required this.onTap,
    required this.category,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: LabeledGlobalKey(category),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 1.3.h,
            horizontal: 5.w,
          ),
          margin:  EdgeInsets.symmetric(
            horizontal: 2.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.w),
            color: isSelected ? Colors.pink : null,
            border: isSelected? Border.all(color: Colors.pink,) : Border.all(color: ColorManager.grey,)
          ),
          child: Text(
            category,
            style: TextStyle(
              color: isSelected ? Colors.white : ColorManager.grey,
              fontSize: 14.sp,
            ),
          ),
        ),
      )
    );
  }
}
