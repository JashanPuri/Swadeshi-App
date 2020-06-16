import 'package:flutter/material.dart';
class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Image imageLogo;
  final Color color;

  CategoryItem(this.id,this.title,this.imageLogo,this.color);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: (){},
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          //height: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color,
                color.withOpacity(0.6)
              ]
          ),
          ),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 60,
                  backgroundColor: Colors.white,
                  child: imageLogo
              ),
              //SizedBox(height: 5,),
              Text(
                title,
                style: Theme.of(context).textTheme.title,
              )
            ],
          )
          ),
        ),
    );
  }
}
