import 'package:dio/dio.dart';

class APIService{
  // ودة يا شباب الwrapper اللى بيهندل كل حاجه ليها علاقه بال api service بتاعى بيهندل كل حاجه وبيحتفظ بكل  المعلومات
  // فحبدا بداخله انشا فيه متغير يسمى base url بتاع الapi ونوعه final وبحط جواة ال base url بتاعه وحجيبه من الapi وال base url هى الحاجه اللى بتتكرر معايا فى كل الrequests وطبعا انا معايا هنا فى الapi اللى شغال عليه request واحد بس فى الطبيعى ان الbaseurl بيبقى لحد v1 لان volumes دى ممكن تتغير لكن لحد v1 بتبقى ثابته فانا حاخد ال url لحد v1 ودة حيكون ال baseUrl بتاعى
  final _baseUrl='https://www.googleapis.com/books/v1/';
  // الافضل انك تخلى الbaseurl دة ثابت بالشكل دة عشان يكون شغال بشكل عام مع اى request حتعمله عشان بعدين لو حبيت تكبر من المشروع وتضيف requests تانيه يعمل scale معاك متتعبتش من التعديلات ودة الهدف من كتايه الكود احنا بنكتب الكود وفى دماغنا اننا ممكن اعمل تعديلات متحطش انك مش ممكن تعمل تعديلات وممكن تكبر من التطبيق عادى
// كدة انا انشات الbase url   تانى حاجه انى حنشا الdio package بقى
 final Dio _dio ;
  APIService(this._dio); //  انى حنشا  نسخه من  dio وححطه جوة ال constructor  بتاع ال  service
  // وكدة احنا عملنا نسخه او object من dio  نستخدمها
 // دلوقتى تعالى ننشا اول method حنحطها واول method حنحطها هى الget method ودى الmethod  اللى موجودة فى الapi_service دى فحقول انها future لان الrequest بياخد وقت علبان لما يرجعلى الdata فى الapp وبعد كدة ححدد الreturn tYpe بتاعى هنا وهنا ممكن الtype يرجعلى على هيئه <map<String,dynamic>وقولت ان نوعها <map<String,dynamic> لان دةة الطبيعى اللى بيرجعلك فى الاخر لان انت بتتعامل مع api فالطبيعى انه حيرجعلك الdata على هيئه map<String,dynamic> لان الطبيعى انها بتشتغل عشان ترجعلك المنظر دة
//وحسمى الmethod ب get method  وحنتكلم فى الarguments  اللى حتاخدها الmethod دى كمان شويه مش دلوقتى لما نحط الRequest بتاعنا
//  ححط ال request بتاعنا عن طريق انى حستخدم  dio واقوله .get()واحط الurl بتاعى فانا محتاج اقوله فى الget request عايز الurl فحقوله required String endpoint وقولتله end point لان هى عبارة عن الجزء اللى فاضل من الurl وكدة فاضل بس انك تستقبل البيانات فحتقوله  get method()async . await وطبعا انت محتاج تستقبل الresponse اللى جايلك من الapi  فحتقوله response  بالمنظر دة
 //دلوقتى انت حتعمل return لresponse.data
 // طب هو انت مش  المفروض  تعملها parse لا فى get انت مش محتاج تعملها parse ولا حاجه اللى هى jsonDecode يعنى لان الdata بترجعلك على هيئه map اساسا وطبعا انت ممكن تعمل return لل response بالكامل لو حابب ممكن تعمل return للresponse بس انا شايف اننا مش محتاجي نعمل return للresponse خالص انا حنعمل return لل data وهنا نقدر نhandle كل حاجه ليها علاقه بال response
 Future<Map<String,dynamic>>get({required String endPoint})async{
 var response= await _dio.get("$_baseUrl$endPoint");
 return response.data;
 }
 //  انت كدة عملت الget method او الget request ودى النقطه اللى حعملها access دايما فبالتالى اى تعديل فيها حيسمع فى كل الاماكن ودة شى ء لطيف جدااا يعنى لو نفترض حبيت اضيف print statement او log يحصلى لما اجى اعمل الrequest حلاقيه بيسمع معايا فى كل جزئيه حبيت اعمل شويه تعديلات حلاقيه يسمع معايا فى كل مكان حبيت اغير مثلا الdata اللى راجعه لقيت مثلا ان الmap<String,dynamic> دى سببت فى خطا عندى ساعتها بحتاج الresponse فعلا ساعتها اخلى ال return_type يكون response وكدة انت تقدر تعمل اللى انت عايزة وكدة يكون ال request خلاص
  // كدة تعالى نقول اننا عملنا wrapper حول الapi  اى create apiService ودة عبارة عن class بيكون هو نقطه التواصل بينى وبين الservice اللى فيها ال api وبيحتوى على كل الmethods اللى حيحتاجها الapi
// يبقى كدة احنا اتكلمنا عن الapi service  بتاعتنا وعملنا بالفعل class  عبارة عن  wraper حوالين الapi
  // ودة عشان نقدر نستعمله على طول لما نعمل اى request ةطبعا انت بتضيف على الrequest دة لحد لما يكتمل معاك يعنى هنا احنا حاطين الget بس لان انا حستخدم الget بس لكن انت ممكن تحط حاجات تانيه زى post لو احتجت انك تسجل data بداخل الserver
//  كدة احنا حنروح لhomerepoimplementatio وابتدى اعمل implementation لل method بتاعت الnewest books بالفعل فى الhomerepoimplementation
//   اول حاجه حعملها فى الhomerepo اصلا ان اكيد حستخدم الApiService وحعمل نسخه منها  وحعمل منها object

}