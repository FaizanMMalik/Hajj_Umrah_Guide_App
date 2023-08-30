// ignore_for_file: non_constant_identifier_names

// ignore: constant_identifier_names
const String Contacts = "Contacts";

class CntFields {
  static String id = "_id";
  static String fname = "fname";
  static String lname = "lname";
  static String phoneno = "phoneno";
 static String fkgid="fkgid";
}
class Cnt{
  int? id,fkgid;
  String fname,lname,phoneno;
  Cnt({required this.fkgid,required this.fname,required this.lname,required this.phoneno});
   Cnt.convert(
      {required this.id,
      required this.fkgid,
        required this.fname,
        required this.lname,
        
      required this.phoneno,
      
      
      });


  Map<String, Object?> toJson() => {
        CntFields.id: id,
         CntFields.fkgid: fkgid,
        CntFields.fname: fname,
         CntFields.lname: lname,
        CntFields.phoneno: phoneno,
        
      };
  static Cnt fromJson(Map<String, dynamic> json) => Cnt.convert(
      id: json[CntFields.id] as int,
       fkgid: json[CntFields.fkgid] as int,
      fname: json[CntFields.fname] as String,
        lname: json[CntFields.lname] as String,
      phoneno: json[CntFields.phoneno] as String,
    
  );
}

