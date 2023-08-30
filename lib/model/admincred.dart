// ignore_for_file: non_constant_identifier_names

// ignore: constant_identifier_names
const String AdminTable = "AdminTable";

class AMFields {
  static String id = "_id";
  static String aname = "aname";
  static String anum = "anum";
}
    class AM{
  int? id;
  String? aname,anum;
  AM({required this.aname,required this.anum,});
   AM.convert(
      {required this.id,
        required this.aname,

      required this.anum,
     
      });
  Map<String, Object?> toJson() => {
      
        AMFields.aname: aname,
        AMFields.anum: anum,
      
        
      };
  static AM fromJson(Map<String, dynamic> json) => AM.convert(
      id: json[AMFields.id] as int,
      aname: json[AMFields.aname] as String,
      anum: json[AMFields.anum] as String,
     
    
  );
}

