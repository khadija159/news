import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/categories/category_item.dart';
import 'package:news/models/category_model.dart';

class CategoriesGrid extends StatelessWidget{
  CategoriesGrid({required this.onCategorySelected});
  void Function(CategoryModel) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
          id: 'sports',
          name: 'Sports',
          imageName: 'ball',
          color: AppTheme.red),
      CategoryModel(
          id: 'technology',
          name: 'Technology',
          imageName: 'Politics',
          color: AppTheme.darkBlue),
      CategoryModel(
          id: 'health',
          name: 'Health',
          imageName: 'health',
          color: AppTheme.pink),
      CategoryModel(
          id: 'business',
          name: 'Business',
          imageName: 'bussines',
          color: AppTheme.brown),
      CategoryModel(
          id: 'general',
          name: 'General',
          imageName: 'environment',
          color: AppTheme.blue,),
      CategoryModel(
          id: 'science',
          name: 'Science',
          imageName: 'science',
          color: AppTheme.yellow),
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(
                  'Pick your category of interest',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: AppTheme.navy),
              ),
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 24,
                  ),
                itemBuilder: (_, index) => GestureDetector(
                  onTap: (){
                    onCategorySelected(categories[index]);
                  },
                    child: CategoryItem(category: categories[index], index: index,)),
                itemCount: categories.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}