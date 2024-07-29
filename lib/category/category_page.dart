import 'package:flutter/material.dart';
import 'package:flutter_widgets/category/category_list_item.dart';
import 'package:flutter_widgets/entity/category_item_entity.dart';

/// @author：yongfeng
/// @data：2024/7/25 10:33

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with AutomaticKeepAliveClientMixin<CategoryPage> {
  ///
  final List<CategoryItemEntity> categoryList = [];

  @override
  void initState() {
    super.initState();
    categoryList.add(CategoryItemEntity(text: 'NestedScrollView class测试'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('分类列表')),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return CategoryListItem(entity: categoryList[index]);
        },
        itemCount: categoryList.length,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
