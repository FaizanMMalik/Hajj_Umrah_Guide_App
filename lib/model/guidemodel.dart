// ignore_for_file: non_constant_identifier_names, camel_case_types

// ignore: constant_identifier_names
const String Guide = "Guide";

class guideFields {
  static String id = "_id";
  static String Title = "Title";
  static String Dua = "Dua";
  static String Audiopath = "Audiopath";
  static String Step="Step";
}
class guide{
  int? id;
  String Title,Dua,Audiopath,Step;
  guide({required this.Title,required this.Dua,required this.Audiopath,required this.Step});
   guide.convert(
      {required this.id,
        required this.Title,
        required this.Dua,

      required this.Audiopath,
      required this.Step,
      });
  Map<String, Object?> toJson() => {
        guideFields.id: id,
        guideFields.Title: Title,
         guideFields.Dua: Dua,
        guideFields.Audiopath: Audiopath,
        guideFields.Step: Step,
        
      };
  static guide fromJson(Map<String, dynamic> json) => guide.convert(
      id: json[guideFields.id] as int,
      Title: json[guideFields.Title] as String,
        Dua: json[guideFields.Dua] as String,
      Audiopath: json[guideFields.Audiopath] as String,
        Step: json[guideFields.Step] as String,
    
  );
}

