// ignore_for_file: non_constant_identifier_names

// ignore: constant_identifier_names
const String Groups = "Groups";

class GMFields {
  static String id = "_id";
  static String Group_Name = "Group_Name";
  static String Group_Description = "Group_Description";
    static String Admin_num = "Admin_num";
    static String Admin_name = "Admin_name";
}
class GM{
  int? id;
  String? Group_Name,Group_Description,Admin_num,Admin_name;
  GM({required this.Group_Name,required this.Group_Description,required this.Admin_num,required this.Admin_name,});
   GM.convert(
      {required this.id,
        required this.Group_Name,

      required this.Group_Description,
      required this.Admin_num,
      required this.Admin_name,
      });
  Map<String, Object?> toJson() => {
      
        GMFields.Group_Name: Group_Name,
        GMFields.Group_Description: Group_Description,
        GMFields.Admin_num: Admin_num,
        GMFields.Admin_name: Admin_name,
        
      };
  static GM fromJson(Map<String, dynamic> json) => GM.convert(
      id: json[GMFields.id] as int,
      Group_Name: json[GMFields.Group_Name] as String,
      Group_Description: json[GMFields.Group_Description] as String,
      Admin_num: json[GMFields.Admin_num] as String ,
      Admin_name: json[GMFields.Admin_name] as String 
    
  );
}

