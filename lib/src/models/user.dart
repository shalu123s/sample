class User {
    String? userid;
    String? usrname;
    String? usrpass;

    User({
        this.userid,
        this.usrname,
        this.usrpass,
    });
 User.fromMap(Map<String,dynamic>json){
  User(
    userid:json['userid'],
    usrname:json['usrname'],
    usrpass:json['usrpass'],
  );
 }

  Map<String,dynamic> toMap()=> {
   'userid':userid,
   'usrname':usrname,
   'usrpassv':usrpass,
  };
}
