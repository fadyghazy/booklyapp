import 'package:booklyappproject/core/errors/failures.dart';
import 'package:booklyappproject/core/utils/api_service.dart';
import 'package:booklyappproject/features/home/data/model/book_model/book_model.dart';
import 'package:booklyappproject/features/home/data/repository/homerepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {

  // implement ل fetch newest books method 
  // ال class دة حيimplement ال homerepo اللى انا انشاتها فبالتالى حيبقى مجبر ينفذ كل اللى methods انا عايزها
  // وزى ما انت شايف دى الmethods بتاعتنا والراجل مجبر انه هو يعمل اللى هو عايزة بالظبط
  // دلوقتى حبتدى احدد انا حشتغل على الrequest باستخدام ايه ؟ اما dio او https فانا طبعا بحب استخدم الdio اكتر لان الdio افضل فى رفع الملفات وفى كام نقطه اخرين فبالتالى حستخدم dio فى المحاضرة دى فحعمل add ل package dio
  // وتعالى نشوف ازاى حنعمل implement لل methods بتاعتنا
  // دلوقتى انا ممكن اروح اعمل wrapper حوالين الservices  بتاعتنا وwrapper هى عبارة عن نقطه تواصل بينى وبين ال services  بتاعتى يعنى انا بتعامل مع نقطه التواصل دى والنقطه دى هى اللى بتعامل معاها من كل الاماكن والنفطه دى هى اللى بتتعامل مع ال service بتاعتى فبالتالى انت وحدت النقطه اللى انت بتستخدمها فبالتالى اى تعديل اى حاجه بتسمع معاك فى كل مكان  عشان كدة لو قمت باستخدام اى service firebase service استخدمت اى service حتستخدمها فكر قبل ما تستخدمها  تعمل wrapper حوالين الservice دى ودة حيسهل عليك امور كتير جدا منها انك تعيد استخدامها فى اماكن تانيه وبعد كدة انت ممكن تاخد الwrapper اللى حوالين الfirebase service فى تطبيق جديد واستخدمه على طول
  //  فحروح فى الutils file وانشا الservice file وحيكون اسمه api_service
  final APIService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    // وهنا حقوله انا عايز استخدم الapiservice بتاعتى ومنها حaccess الget method وانا ممكن اخلى الdio فى الapiService تبقى private اى خاصه فقط بال ApiService فقط وحيطلب منى احط الendpoint بتاعتى وهو الجزء المتغير فى الurl الخاص بالapi فانا هنا المفروض ححط ال end point بتاعتى اللى حترجعلى newest books وعشان كدة محتاج اروح اخد ال end point من الapi الخاص بى
    //     دلوقتى انا لو دورت على الdocumentation بتاع الapi حتلاقى يوجد الsorting وتقدر من خلاله تجيب الnewest قبالفعل ممكن تستخدم الsorting  واديله الvalue اللى هى newest  عشان تجيب منها الnewest واستخدمنا الfiltering عشان عايز من الapi يرجعلى الكتب المجانيه وبعد كدة عندك الquery والquery خلى بالك لما تيجى تعمل search على الprogramming فهو حيجيبلك كل الكتب الrelated بال programming وانا مش عايز اعمل كدة الصراحه لانى مش بsearch على كتاب معين لان هو كدة تقريبا بيعمل search على اسم الكتاب فهو كدة بيجيبلك  كل الكتب اللى فيها اسم الprogramming لكن لو انا عايز اعمل search على الcategory اللى هى الproogramming فانا عشان اعمل كدا بروح على الquery value proogramming كدة واخدها كدة cut واكتب قبلها subject ان انا عايز اعمل search على الsubject الاول بالمنظر دة وبعد كدة : واحط الحاجه اللى انا عايزها اعمل search على الcategory بتاعها اللى هى الproogramming فى المثال بتاعنا  وتعالى نشوف لما نعمل send حنشوف الresponse حيرجعلنا ايه فكدة انا حاخد الrequest بتاع الapi كدة copy اللى بعد الBaseUrl وححطها فى الend point ودة كدة الrequest بتاعى وكدة تمام لانى انا بجيب الnewest books فحنروح نغير الاسم الmethod فى الHomeREPO  من bestSellerBooks الى  Newest Books
    //     احنا كدة جبنا الdata فالمفروض انى حستقبلها هنا فالمفروض ننشا متغير var data وبقوله انها بتساوى الdata اللى رجعالى من الresponse بتاالخاص بال api
    // حعمل هنا try&catch لان ممكن فى المكان  يترمى exception
    // فى حاله ان ال request اشتغل معايا ورجعلى response بشكل سليم يعنى الtry اشتغلت معايا والدنيا زى الفل فالمفروض عندى الdata دى فيها البيانات اللى انا محتاجها
    //  يعنى فيها الmap بتاعت  response بالكامل اللى راجعلى فانا المفروض حروح على  الitems واجيب منها list
    //وبعد كدة اعمل parse لكل item على حدة

    //   فتعالى نعمل كدة فعلا  حنشا list فاضيه List<BookModel> وحسميها books وبتساوى list فاضيه وبعد كدة حعمل for loop على كل item موجودةة فى الitems اللى عندى وحعملها access على طول من خلال الdata وادخل على الitems
    //   وبعد كدة حقوله بعد لما لفيت على كل item من الitems اللى عندى حقوله ضيف على books list اللى عندى  واقوله ضيف  كل item انا عديت عليه فى  list of items عن طريق bookmodel.fromjson واديله الitem اللى جايلى  بعد كدة حreturn ال list بتاعتى بس هو هنا حيعترض ليه حيعترض لان هنا بيرجعلى either failure او list of books model فهو هنا مش حيعرف يحدد هو دة الright side ولا الleft side فانت لازم تقوله انى حعمل return لل right side دلوقتى وال value اللى جواة حتبقى الbooks lissssssst بتاعتى  وانت هنا قايله كدة ياما حترجع failure او حترجع list of booksmodel
    //   فى حاله حصل exceptioooon ساعتها حعمل return ل failure وطبعا مش دايما حعمل return ل serverFailure وانا حتكلم المرة اللى جايه فى الfailures بقى يعنى انا حتكلم المرة اللى جايه ان شاء الله فى الfailures اللى بيرجعلنا بس اللى يهمنى اكتر اننا كتبنا الrequest بتاعنا زى ما انت شايف خلصناة بشكل كويس
// واحنا كدة عملنا implement لل fetch newest books وزى الفل اوى
    try {
      var data = await apiService.get(
          endPoint: 'volumes?q=computer science &Filtering=free_ebooks&Sorting=newest');
      List<BookModel>books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
      // يوجد خاصيه بداخل ال dio ان في حاله انه جالك status code غير 200 ساعتها بترميلك dio err على طول فانت المفروض حتعمل check هل ال exception اللى راجعلك دة dio error ولا لا ؟؟ فخلى بالك ال dio error دة بيحمل حاجات كتير جدا منها بيحمل الstatus code بتاع الrequest وبيحمل ال response اللى راجعلك اللى فيه ال message اللى حترجعلك فانت حتتعامل مع ال dio error عشان ترجع ال failure بشكل لطيف
    }
    // فى المحاضرة السابقه عملنا implement للmethod اللى قدامنا دى طبعا ممكن نعمل implement لل method التانيه جى كمان بس قبل ما ابتدى واعمل الجزئيه دى انا حابب اتكلم عن جزئيه مهمه وهى جزئيه الcatch بتاعت الexception لان انا ملاحظ ان النقطه دى بتتلخص فى كل الكورسات اللى بتفرج عليها وانا شخصيا قابلت المشكله دى فتعاملى مع النقطه دى مكنش دقيق يعنى او مكنتش فاهم ازاى اتعامل معاها بشكل صحيح وطبعا لما بدات اتعامل معاها تطبيقات سواء انا بنيها او سواء غيرى اللى بناها فلاحظت ان فيه بعض المشاكل بتجبر الuser انه يمسح التطبيق زى انك لو تفترض بتعمل request وبعد كدة كل لما بتعمل request بتلاقى ان الرد  فيه مشكله طب ايه المشكله انا ك user محتاج اعرف ايه المشكله عشان احلها لانك انت مقولتليش ايه المشكله فححلها ازاى ؟ انا راجل مش فاهم اساسا يعنى انا user عادى يدوب بستعمل الموبايل فمش حيعرف يحل المشكله فال user يبدا يسترخم  التطبيق فيمسحه دى نقطه بجانب ان فى بعض الاوقات اساسا بيقول ان فيه مشكله و بالتالى مبيبقاش فيه مشكله والطلب بيكمل عادى بس هو مش بيوضحلك الكلام دة ودى مشاكل بتقابلها فى تطبيقات كبيرة فعلا مشاكل زى دى  فاحنا مش عايزين نعمل المشاكل دى انا هنا بعمل try&catch ل exception زى الفل بس لما اجى اعمل return ل left side بتاعى اللى هو الserver failure دى مش ادق حاجه اعملها يا شباب ودة لان انا كدة محطتش اى message معبرة خالص فتعالى نقول فى الاول اننا عندنا كل failure فى الfailure class حنحط جواة final String errormessage ودى اللى حتظهر لل user وحنحطه جوة constructor الخاص بال failure abstract class وحنحط const لل constructor وبما ان الserverfailure بيextend من الabstract class failure فبالتالى محتاج استخدم super constructor عشان ابعتله الerror message وحلو اوى لحد كدة وطبعا حييجى فى ال return الخاص بال left side بتاع implementation بتاع  الfetchnewestbooks حيظهرلى error ويقولى انت مجبر تحطلى message فانا ممكن هنا اقوله ابعتله يا بنى الexception اللى حيرجعلى كmessage وهى e.toString() وكدة هو حيبعتله الexception بالكامل كerror message وطبعا دة شكل مش صح تماما لان حتظهر message شكلها غريب جدا للuser الى جانب انها ممكن متبقاش معبرة اصلا فبالتالى الحل دة مش حل لطيف فتعالى كدة معايا نشوف حل للمشكله دى فتعالى نروح على الpost man ونشوف شكل الresponse بيرجعلنا ايه لو لاحظت انا هنا عامل الresponse من غير ال q فحيجيبلى error فلو لاحظت لما كنت حاطط الq كان الresponse بتاعك الstatus code بتاعك ب 200 و200 دى معناها ان الrequest تم بشكل سليم واكيد عارف الكلام دة بما انك اتعاملت مع api,s قبل كدة ولو شيلت الq حتلاقى ان الresponse اللى راجعلك الstatus code بتاعه ب 400 وبيقولك قبلها انهها badrequest بس خلى بالك بقى من نقطه وهى انه قالك ان الstatus code بتاعك 400 وقالك كمان ان فيه رساله فيه رساله موجودة من الapi نفسه وانت بتعمل الrequest يعنى اسمها bad request fs بس كدة كدة الapi عندك بيرد عليك بresponse فيه رساله معبرة اسمها required parameter q وطبعا فى بعض الاوقات لو انت بتعمل authentication حتلاقى ان فيه message رجعتلك بتقولك ان الpassword is required ودة هنا عندك bad request ومعناها انك عملت request بشكل غير سليم فيه حاجات missing مش موجودة وعندك لو الstatus Code عبارة عن 401 يبفى unauthorized لو انت بتتعامل فى login او حاجه زى كدة ومبعتش الpassword فحيبعتلك فى الresponse message ان ال passwooord is required وعندك 403 ودى معناها forrbiden زى الunathorized شويه بس مش لازم نتكلم فى اختلافات يعنى بس نفس الكلام حيرد عليك بresponse يقولك ان فيه مشكله فطبعا زى ما انت شايف فى بعض الاوقات مع الstatus code اللى راجعلى بيرد عليا ب response فهمت الفكرة هنا فانا المفروض حبتدى واتعامل مع الresponse دة وال response دة بيبقى ثابت مع الapi بالكامل بالنسبه للapi دة فقط يعنى مش كل الapi.s حترجعلك الresponse بالمنظر دة فيه api,s تانيه بترجعلك الmessage على طول مش بترجعلك المنظر دة اللى هو error وبعد كدة جوة الerror ال message لا ممكن تلاقى من برة فيه الmessage وبعدين فيه الerror فانت ممكن تfetch  ال message على طول فانت المفروض بتبدا تhandle كل الcases دى انت فعلا المفروض بتhandle كل الcases دى مينفعش تسيب الدنيا عايمه فانت المفروض بما انك راجل developer ت handle الدنيا بشكل سليم فكدة مبدايا الموضوع كله معتمد على حاجه واحدة وهى الstatus code بعد كدة ابتدى وادور ايه اللى ممكن اعمله فانا فى المكان دة محتاج اعمل check على الstatus code بداخل الreturn ال left side بتاع الimplementation الخاص بالfetch newest book method وهنا الdio لطيفه جدا فحقوله ان لو جالك status code غير 200 بترميلك حاجه اسمها dio error على طول فعشان كدة انت فى الcatch error المفروض تت check اصلا تشوف ان فى حاله ان الe اللى جايالك كانت Dio Error دة مبدايا فلو انت اللى راجعلك dioerror فخلى بالك ان dio error دة بيحمل حاجات كتير جدا مبدايا بيحمل الstatus code بتاع الrequest وبيحمل كمان ال response اللى راجعلك دة لو راجعلك response لان فى ساعات ممكن ميرجعلكش response فعشان كدة انت ممكن تبتدى تتعامل مع الdio error عشان تبدا ترجع الserver failure بشكل لطيف فانت ممكن تيجى وتقوله ان فى حاله ان الexception اللى راجعلك هو عبارة عن dio error exception ساعتها رجعلى left side حيكون فيه server failure وابتدى جوة المكان دة ابدا اعمل check على الstatus codeee واشوف الresponse وطبعا لو انا عملتها هنا دة شى ء مش سليم خالص ليه لسببين اول حاجه انى حضطر اعملها كل مرة حعمل request ولما اجى فى الmethod التانيه حضطر اعمل نفس الحركه حشوف هنا فى الserver failure حشوف الstatus code وال response اللى ؤاجعل من الdio error تانى حاجه انك حتخلى الكود بتاعك مش clean لانك حتكتب كود كتير هنا عشان تعمل check على الcases دى فبالتالى اصلا ليه مروحش على الserver failure واستخدم الfactory constructor 


  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?q=subject:Programming&Filtering=free_ebooks');
      List<BookModel>books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
      // يوجد خاصيه بداخل ال dio ان في حاله انه جالك status code غير 200 ساعتها بترميلك dio err على طول فانت المفروض حتعمل check هل ال exception اللى راجعلك دة dio error ولا لا ؟؟ فخلى بالك ال dio error دة بيحمل حاجات كتير جدا منها بيحمل الstatus code بتاع الrequest وبيحمل ال response اللى راجعلك اللى فيه ال message اللى حترجعلك فانت حتتعامل مع ال dio error عشان ترجع ال failure بشكل لطيف
    }
    // فى المحاضرة السابقه عملنا implement للmethod اللى قدامنا دى طبعا ممكن نعمل implement لل method التانيه جى كمان بس قبل ما ابتدى واعمل الجزئيه دى انا حابب اتكلم عن جزئيه مهمه وهى جزئيه الcatch بتاعت الexception لان انا ملاحظ ان النقطه دى بتتلخص فى كل الكورسات اللى بتفرج عليها وانا شخصيا قابلت المشكله دى فتعاملى مع النقطه دى مكنش دقيق يعنى او مكنتش فاهم ازاى اتعامل معاها بشكل صحيح وطبعا لما بدات اتعامل معاها تطبيقات سواء انا بنيها او سواء غيرى اللى بناها فلاحظت ان فيه بعض المشاكل بتجبر الuser انه يمسح التطبيق زى انك لو تفترض بتعمل request وبعد كدة كل لما بتعمل request بتلاقى ان الرد  فيه مشكله طب ايه المشكله انا ك user محتاج اعرف ايه المشكله عشان احلها لانك انت مقولتليش ايه المشكله فححلها ازاى ؟ انا راجل مش فاهم اساسا يعنى انا user عادى يدوب بستعمل الموبايل فمش حيعرف يحل المشكله فال user يبدا يسترخم  التطبيق فيمسحه دى نقطه بجانب ان فى بعض الاوقات اساسا بيقول ان فيه مشكله و بالتالى مبيبقاش فيه مشكله والطلب بيكمل عادى بس هو مش بيوضحلك الكلام دة ودى مشاكل بتقابلها فى تطبيقات كبيرة فعلا مشاكل زى دى  فاحنا مش عايزين نعمل المشاكل دى انا هنا بعمل try&catch ل exception زى الفل بس لما اجى اعمل return ل left side بتاعى اللى هو الserver failure دى مش ادق حاجه اعملها يا شباب ودة لان انا كدة محطتش اى message معبرة خالص فتعالى نقول فى الاول اننا عندنا كل failure فى الfailure class حنحط جواة final String errormessage ودى اللى حتظهر لل user وحنحطه جوة constructor الخاص بال failure abstract class وحنحط const لل constructor وبما ان الserverfailure بيextend من الabstract class failure فبالتالى محتاج استخدم super constructor عشان ابعتله الerror message وحلو اوى لحد كدة وطبعا حييجى فى ال return الخاص بال left side بتاع implementation بتاع  الfetchnewestbooks حيظهرلى error ويقولى انت مجبر تحطلى message فانا ممكن هنا اقوله ابعتله يا بنى الexception اللى حيرجعلى كmessage وهى e.toString() وكدة هو حيبعتله الexception بالكامل كerror message وطبعا دة شكل مش صح تماما لان حتظهر message شكلها غريب جدا للuser الى جانب انها ممكن متبقاش معبرة اصلا فبالتالى الحل دة مش حل لطيف فتعالى كدة معايا نشوف حل للمشكله دى فتعالى نروح على الpost man ونشوف شكل الresponse بيرجعلنا ايه لو لاحظت انا هنا عامل الresponse من غير ال q فحيجيبلى error فلو لاحظت لما كنت حاطط الq كان الresponse بتاعك الstatus code بتاعك ب 200 و200 دى معناها ان الrequest تم بشكل سليم واكيد عارف الكلام دة بما انك اتعاملت مع api,s قبل كدة ولو شيلت الq حتلاقى ان الresponse اللى راجعلك الstatus code بتاعه ب 400 وبيقولك قبلها انهها badrequest بس خلى بالك بقى من نقطه وهى انه قالك ان الstatus code بتاعك 400 وقالك كمان ان فيه رساله فيه رساله موجودة من الapi نفسه وانت بتعمل الrequest يعنى اسمها bad request fs بس كدة كدة الapi عندك بيرد عليك بresponse فيه رساله معبرة اسمها required parameter q وطبعا فى بعض الاوقات لو انت بتعمل authentication حتلاقى ان فيه message رجعتلك بتقولك ان الpassword is required ودة هنا عندك bad request ومعناها انك عملت request بشكل غير سليم فيه حاجات missing مش موجودة وعندك لو الstatus Code عبارة عن 401 يبفى unauthorized لو انت بتتعامل فى login او حاجه زى كدة ومبعتش الpassword فحيبعتلك فى الresponse message ان ال passwooord is required وعندك 403 ودى معناها forrbiden زى الunathorized شويه بس مش لازم نتكلم فى اختلافات يعنى بس نفس الكلام حيرد عليك بresponse يقولك ان فيه مشكله فطبعا زى ما انت شايف فى بعض الاوقات مع الstatus code اللى راجعلى بيرد عليا ب response فهمت الفكرة هنا فانا المفروض حبتدى واتعامل مع الresponse دة وال response دة بيبقى ثابت مع الapi بالكامل بالنسبه للapi دة فقط يعنى مش كل الapi.s حترجعلك الresponse بالمنظر دة فيه api,s تانيه بترجعلك الmessage على طول مش بترجعلك المنظر دة اللى هو error وبعد كدة جوة الerror ال message لا ممكن تلاقى من برة فيه الmessage وبعدين فيه الerror فانت ممكن تfetch  ال message على طول فانت المفروض بتبدا تhandle كل الcases دى انت فعلا المفروض بتhandle كل الcases دى مينفعش تسيب الدنيا عايمه فانت المفروض بما انك راجل developer ت handle الدنيا بشكل سليم فكدة مبدايا الموضوع كله معتمد على حاجه واحدة وهى الstatus code بعد كدة ابتدى وادور ايه اللى ممكن اعمله فانا فى المكان دة محتاج اعمل check على الstatus code بداخل الreturn ال left side بتاع الimplementation الخاص بالfetch newest book method وهنا الdio لطيفه جدا فحقوله ان لو جالك status code غير 200 بترميلك حاجه اسمها dio error على طول فعشان كدة انت فى الcatch error المفروض تت check اصلا تشوف ان فى حاله ان الe اللى جايالك كانت Dio Error دة مبدايا فلو انت اللى راجعلك dioerror فخلى بالك ان dio error دة بيحمل حاجات كتير جدا مبدايا بيحمل الstatus code بتاع الrequest وبيحمل كمان ال response اللى راجعلك دة لو راجعلك response لان فى ساعات ممكن ميرجعلكش response فعشان كدة انت ممكن تبتدى تتعامل مع الdio error عشان تبدا ترجع الserver failure بشكل لطيف فانت ممكن تيجى وتقوله ان فى حاله ان الexception اللى راجعلك هو عبارة عن dio error exception ساعتها رجعلى left side حيكون فيه server failure وابتدى جوة المكان دة ابدا اعمل check على الstatus codeee واشوف الresponse وطبعا لو انا عملتها هنا دة شى ء مش سليم خالص ليه لسببين اول حاجه انى حضطر اعملها كل مرة حعمل request ولما اجى فى الmethod التانيه حضطر اعمل نفس الحركه حشوف هنا فى الserver failure حشوف الstatus code وال response اللى ؤاجعل من الdio error تانى حاجه انك حتخلى الكود بتاعك مش clean لانك حتكتب كود كتير هنا عشان تعمل check على الcases دى فبالتالى اصلا ليه مروحش على الserver failure واستخدم الfactory constructor
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async{
    // TODO: implement fetchSimilarBooks
    // كدة احنا خلصنا الrequest دة
    try {
      var data = await apiService.get(
          endPoint: 'volumes?q=subject:Programming&Filtering=free_ebooks&Sorting=relevance');
      List<BookModel>books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}