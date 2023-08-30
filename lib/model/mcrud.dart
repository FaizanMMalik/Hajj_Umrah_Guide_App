
// ignore_for_file: camel_case_types

class crudFields {
 static String hugi = 'insert';
static String hugr = 'select';
static String hugu = 'update';
static String hugd = 'delete';
}
class crud{

 String hugi,hugr,hugu,hugd ;

  crud({required this.hugi,required this.hugr,required this.hugu,required this.hugd});
   crud.convert(
      {required this.hugi,
      required this.hugr,
        required this.hugu,
        required this.hugd,    
      });
  Map<String, Object?> toJson() => {
        crudFields.hugi: hugi,
         crudFields.hugr: hugr,
        crudFields.hugu: hugu,
         crudFields.hugd: hugd,
       
        
      };
  static crud fromJson(Map<String, dynamic> json) => crud.convert(
     
       hugi: json[crudFields.hugi] as String,
      hugr: json[crudFields.hugr] as String,
        hugu: json[crudFields.hugu] as String,
      hugd: json[crudFields.hugd] as String,
    
  );
}

