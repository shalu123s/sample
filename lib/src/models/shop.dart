import 'dart:core';

class Shop{
   String? shopid;
   String? shopname;
   String? shopcategory;
   String? shopnumber;
   String? shopdescription;

   Shop({
        this.shopid,
        this.shopname,
        this.shopcategory,
        this.shopnumber,
        this.shopdescription,
    });

    Shop.fromMap(Map<String,dynamic>json){
      Shop(
        shopid:json['shopid'],
    shopname:json['shopname'],
    shopcategory:json['shopcategory'],
    shopnumber:json['shopnumber'],
    shopdescription:json['shopdescription'],
       );
    }

    Map<String,dynamic> toMap()=> {
   'shopid':shopid,
   'shopname':shopname,
   'shopcategory':shopcategory,
   'shopnumber':shopnumber,
   'shopdescription':shopdescription,
  };
}