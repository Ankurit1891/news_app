import 'package:news_app/models/category_model.dart';

List<CategoryModel> getCateogries()
{
  List<CategoryModel>  category=[];
  CategoryModel  categoryModel=new CategoryModel();

  categoryModel.categoryName='Business';
  categoryModel.imageUrl= 'https://images.unsplash.com/photo-1491336477066-31156b5e4f35?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80';
  category.add(categoryModel);


  categoryModel=new CategoryModel();
  categoryModel.categoryName='Entertainment';
  categoryModel.imageUrl= 'https://images.unsplash.com/photo-1603190287605-e6ade32fa852?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80';
  category.add(categoryModel);


  categoryModel=new CategoryModel();
  categoryModel.categoryName='General';
  categoryModel.imageUrl= 'https://images.unsplash.com/photo-1602288637781-5ca78e8af9d4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80';
  category.add(categoryModel);


  categoryModel=new CategoryModel();
  categoryModel.categoryName='Health';
  categoryModel.imageUrl= 'https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1489&q=80';
  category.add(categoryModel);

  categoryModel=new CategoryModel();
  categoryModel.categoryName='Science';
  categoryModel.imageUrl= 'https://images.unsplash.com/photo-1532094349884-543bc11b234d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80';
  category.add(categoryModel);


  categoryModel=new CategoryModel();
  categoryModel.categoryName='Sports';
  categoryModel.imageUrl= 'https://images.unsplash.com/photo-1461896836934-ffe607ba8211?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80';
  category.add(categoryModel);


  categoryModel=new CategoryModel();
  categoryModel.categoryName='Technology';
  categoryModel.imageUrl= 'https://images.unsplash.com/photo-1518770660439-4636190af475?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80';
  category.add(categoryModel);

  return category;
}