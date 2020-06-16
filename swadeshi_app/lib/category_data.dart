import 'package:flutter/material.dart';
import './models/category.dart';
import 'models/category.dart';

List<Color> colors =[
 Color.fromRGBO(255, 255, 102, 1), //khaki
 Color.fromRGBO(255, 192, 203, 1), //pinkish
 Color.fromRGBO(255, 160, 122, 1), //orange
 Color.fromRGBO(253, 245, 230, 1), //khaki lite
 Color.fromRGBO(255, 228, 225, 1), //pink lite
 Color.fromRGBO(123, 104, 208, 1), //purple
 Color.fromRGBO(0, 191, 255, 1), //blue
 Color.fromRGBO(210, 105, 30, 1), //choclate
 Color.fromRGBO(127, 255, 212, 1), // Aquamarine
 Color.fromRGBO(173,255,47, 0.6),  //lime green
 Color.fromRGBO(205,69,0 , 1),  //orange red
 Color.fromRGBO(250,235,215, 1), //aqua white
 Color.fromRGBO(255,235,205, 1), //almond type
 Color.fromRGBO(250,240,230, 1), //linen
 Color.fromRGBO(255,228,181, 1), //navajo white
];


 List<Category> CATEGORIES = [
  Category(id: 'c1',title: 'Soap',imageLogo: Image.asset('assets/category_icons/soap.png',height: 80,width: 80,),cardColor: colors[0]),
  Category(id: 'c2',title: 'Toothpaste',imageLogo: Image.asset('assets/category_icons/toothpaste.png',height: 80,width: 80,),cardColor: colors[1]),
  Category(id: 'c3',title: 'Shampoo',imageLogo: Image.asset('assets/category_icons/shampoo.png',height: 80,width: 80,),cardColor: colors[2]),
  Category(id: 'c4',title: 'Face Wash',imageLogo: Image.asset('assets/category_icons/face_wash.png',height: 80,width: 80,),cardColor: colors[3]),
  Category(id: 'c5',title: 'Personal Care',imageLogo: Image.asset('assets/category_icons/personal_care.png',height: 80,width: 80,),cardColor: colors[4]),
//  Category(id: 'c6',title: 'Hair Oil',),
 Category(id: 'c7',title: 'Detergent',imageLogo: Image.asset('assets/category_icons/detergent.png',height: 80,width: 80,),cardColor: colors[5]),
  Category(id: 'c8',title: 'Shaving ',imageLogo: Image.asset('assets/category_icons/shaving.png',height: 80,width: 80,),cardColor: colors[6]),
//  Category(id: 'c9',title: 'Deo'),
//  Category(id: 'c10',title: 'Face Powder'),
  Category(id: 'c11',title: 'Chocolate',imageLogo: Image.asset('assets/category_icons/choclate.png',height: 80,width: 80,),cardColor: colors[7]),
  Category(id: 'c12',title: 'Noodles',imageLogo: Image.asset('assets/category_icons/noodles.png',height: 80,width: 80,),cardColor: colors[4]),
  Category(id: 'c13',title: 'Tea',imageLogo: Image.asset('assets/category_icons/tea.png',height: 80,width: 80,),cardColor: colors[9]),
  Category(id: 'c14',title: 'Coffee',imageLogo: Image.asset('assets/category_icons/coffee.png',height: 80,width: 80,),cardColor: colors[0]),
  Category(id: 'c15',title: 'Juice',imageLogo: Image.asset('assets/category_icons/juice.png',height: 80,width: 80,),cardColor: colors[12]),
  Category(id: 'c16',title: 'Chips',imageLogo: Image.asset('assets/category_icons/chips.png',height: 80,width: 80,),cardColor: colors[1]),
//  Category(id: 'c17',title: 'Instant Mix'),
  Category(id: 'c18',title: 'Instant Food',imageLogo: Image.asset('assets/category_icons/instant_food.png',height: 80,width: 80,),cardColor: colors[2]),
  Category(id: 'c19',title: 'Ice Creams',imageLogo: Image.asset('assets/category_icons/icecream.png',height: 80,width: 80,),cardColor: colors[8]),
  Category(id: 'c20',title: 'Jams',imageLogo: Image.asset('assets/category_icons/jam.png',height: 80,width: 80,),cardColor: colors[0]),
  Category(id: 'c21',title: 'Biscuits',imageLogo: Image.asset('assets/category_icons/biscuits.png',height: 80,width: 80,),cardColor: colors[14]),
//  Category(id: 'c22',title: 'Soap'),
  Category(id: 'c23',title: 'Dairy Products',imageLogo: Image.asset('assets/category_icons/dairy_products.png',height: 80,width: 80,),cardColor: colors[11]),
  Category(id: 'c24',title: 'Atta',imageLogo: Image.asset('assets/category_icons/flour.png',height: 80,width: 80,),cardColor: colors[12]),
  Category(id: 'c25',title: 'Honey',imageLogo: Image.asset('assets/category_icons/honey.png',height: 80,width: 80,),cardColor: colors[0]),
  Category(id: 'c26',title: 'Clothing',imageLogo: Image.asset('assets/category_icons/clothing.png',height: 80,width: 80,),cardColor: colors[14]),
  Category(id: 'c27',title: 'Cigarette',imageLogo: Image.asset('assets/category_icons/cigarette.png',height: 80,width: 80,),cardColor: colors[1]),
  Category(id: 'c28',title: 'Salt',imageLogo: Image.asset('assets/category_icons/salt.png',height: 80,width: 80,),cardColor: colors[6]),
  Category(id: 'c29',title: 'Bread',imageLogo: Image.asset('assets/category_icons/bread.png',height: 80,width: 80,),cardColor: colors[10]),
  Category(id: 'c30',title: 'Masala',imageLogo: Image.asset('assets/category_icons/spices.png',height: 80,width: 80,),cardColor: colors[9]),
];