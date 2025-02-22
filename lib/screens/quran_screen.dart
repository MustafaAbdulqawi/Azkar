import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  late PageController pageController;
  late ScrollController scrollController;
  int selectedSuraIndex = 0;
  int? savedPage;

  final List<Map<String, dynamic>> suraIndex = [
    {'name': 'الفاتحة', 'page': 0},
    {'name': 'البقرة', 'page': 1},
    {'name': 'آل عمران', 'page': 49},
    {'name': 'النساء', 'page': 76},
    {'name': 'المائدة', 'page': 105},
    {'name': 'الأنعام', 'page': 127},
    {'name': 'الأعراف', 'page': 150},
    {'name': 'الأنفال', 'page': 176},
    {'name': 'التوبة', 'page': 186},
    {'name': 'يونس', 'page': 207},
    {'name': 'هود', 'page': 220},
    {'name': 'يوسف', 'page': 234},
    {'name': 'الرعد', 'page': 248},
    {'name': 'إبراهيم', 'page': 254},
    {'name': 'الحجر', 'page': 261},
    {'name': 'النحل', 'page': 266},
    {'name': 'الإسراء', 'page': 281},
    {'name': 'الكهف', 'page': 292},
    {'name': 'مريم', 'page': 304},
    {'name': 'طه', 'page': 311},
    {'name': 'الأنبياء', 'page': 221},
    {'name': 'الحج', 'page': 331},
    {'name': 'المؤمنون', 'page': 341},
    {'name': 'النور', 'page': 349},
    {'name': 'الفرقان', 'page': 358},
    {'name': 'الشعراء', 'page': 366},
    {'name': 'النمل', 'page': 376},
    {'name': 'القصص', 'page': 384},
    {'name': 'العنكبوت', 'page': 395},
    {'name': 'الروم', 'page': 403},
    {'name': 'لقمان', 'page': 410},
    {'name': 'السجدة', 'page': 414},
    {'name': 'الأحزاب', 'page': 417},
    {'name': 'سبأ', 'page': 427},
    {'name': 'فاطر', 'page': 433},
    {'name': 'يس', 'page': 439},
    {'name': 'الصافات', 'page': 445},
    {'name': 'ص', 'page': 452},
    {'name': 'الزمر', 'page': 457},
    {'name': 'غافر', 'page': 466},
    {'name': 'فصلت', 'page': 476},
    {'name': 'الشورى', 'page': 482},
    {'name': 'الزخرف', 'page': 488},
    {'name': 'الدخان', 'page': 495},
    {'name': 'الجاثية', 'page': 498},
    {'name': 'الأحقاف', 'page': 501},
    {'name': 'محمد', 'page': 506},
    {'name': 'الفتح', 'page': 510},
    {'name': 'الحجرات', 'page': 514},
    {'name': 'ق', 'page': 517},
    {'name': 'الذاريات', 'page': 519},
    {'name': 'الطور', 'page': 522},
    {'name': 'النجم', 'page': 525},
    {'name': 'القمر', 'page': 527},
    {'name': 'الرحمن', 'page': 530},
    {'name': 'الواقعة', 'page': 533},
    {'name': 'الحديد', 'page': 536},
    {'name': 'المجادلة', 'page': 541},
    {'name': 'الحشر', 'page': 544},
    {'name': 'الممتحنة', 'page': 548},
    {'name': 'الصف', 'page': 550},
    {'name': 'الجمعة', 'page': 552},
    {'name': 'المنافقون', 'page': 553},
    {'name': 'التغابن', 'page': 555},
    {'name': 'الطلاق', 'page': 557},
    {'name': 'التحريم', 'page': 559},
    {'name': 'الملك', 'page': 561},
    {'name': 'القلم', 'page': 563},
    {'name': 'الحاقة', 'page': 565},
    {'name': 'المعارج', 'page': 567},
    {'name': 'نوح', 'page': 569},
    {'name': 'الجن', 'page': 571},
    {'name': 'المزمل', 'page': 573},
    {'name': 'المدثر', 'page': 574},
    {'name': 'القيامة', 'page': 576},
    {'name': 'الإنسان', 'page': 577},
    {'name': 'المرسلات', 'page': 579},
    {'name': 'النبأ', 'page': 581},
    {'name': 'النازعات', 'page': 582},
    {'name': 'عبس', 'page': 584},
    {'name': 'التكوير', 'page': 585},
    {'name': 'الانفطار', 'page': 586},
    {'name': 'المطففين', 'page': 586},
    {'name': 'الانشقاق', 'page': 588},
    {'name': 'البروج', 'page': 589},
    {'name': 'الطارق', 'page': 590},
    {'name': 'الأعلى', 'page': 590},
    {'name': 'الغاشية', 'page': 591},
    {'name': 'الفجر', 'page': 592},
    {'name': 'البلد', 'page': 593},
    {'name': 'الشمس', 'page': 594},
    {'name': 'الليل', 'page': 594},
    {'name': 'الضحى', 'page': 595},
    {'name': 'الشرح', 'page': 595},
    {'name': 'التين', 'page': 596},
    {'name': 'العلق', 'page': 596},
    {'name': 'القدر', 'page': 597},
    {'name': 'البينة', 'page': 597},
    {'name': 'الزلزلة', 'page': 598},
    {'name': 'العاديات', 'page': 598},
    {'name': 'القارعة', 'page': 599},
    {'name': 'التكاثر', 'page': 599},
    {'name': 'العصر', 'page': 600},
    {'name': 'الهمزة', 'page': 600},
    {'name': 'الفيل', 'page': 600},
    {'name': 'قريش', 'page': 601},
    {'name': 'الماعون', 'page': 601},
    {'name': 'الكوثر', 'page': 601},
    {'name': 'الكافرون', 'page': 602},
    {'name': 'النصر', 'page': 602},
    {'name': 'المسد', 'page': 602},
    {'name': 'الإخلاص', 'page': 603},
    {'name': 'الفلق', 'page': 603},
    {'name': 'الناس', 'page': 603}
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    scrollController = ScrollController();
    _loadSavedPage();
  }


  Future<void> _loadSavedPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      savedPage = prefs.getInt('savedPage');
    });
  }


  Future<void> _savePage(int page) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('savedPage', page);
    setState(() {
      savedPage = page;
    });
  }


  void _showSuraIndex() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.builder(
          controller: scrollController,
          itemCount: suraIndex.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(suraIndex[index]['name']),
              trailing: selectedSuraIndex == index
                  ? const Icon(Icons.check, color: Colors.green)
                  : null,
              onTap: () {
                setState(() {
                  selectedSuraIndex = index;
                });
                int pageIndex = suraIndex[index]['page'];
                pageController.animateToPage(
                  pageIndex,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
                Navigator.pop(context);
              },
            );
          },
        );
      },
    ).whenComplete(() {
      scrollController.jumpTo(selectedSuraIndex * 50.0);
    });
  }


  void _goToSavedPage() {
    if (savedPage != null) {
      pageController.animateToPage(
        savedPage!,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('لا توجد علامة محفوظة')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0XFFfefff8),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('القرآن الكريم'),
        centerTitle: true,
        backgroundColor: const Color(0XFFfefff8),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_book),
            onPressed: _showSuraIndex,
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'save') {
                int currentPage = pageController.page?.round() ?? 0;
                _savePage(currentPage);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تم حفظ العلامة')),
                );
              } else if (value == 'goto') {
                _goToSavedPage();
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'save',
                child: Text('حفظ العلامة'),
              ),
              const PopupMenuItem(
                value: 'goto',
                child: Text('الذهاب إلى العلامة'),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: screenHeight * 0.02),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: PageView.builder(
            controller: pageController,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: quraanImage.length,
            itemBuilder: (context, index) {
              double scale = 1.0;
              return StatefulBuilder(
                builder: (context, setState) {
                  return GestureDetector(
                    onDoubleTap: () {
                      setState(() {
                        scale = (scale == 1.0) ? 2.0 : 1.0;
                      });
                    },
                    child: InteractiveViewer(
                      panEnabled: true,
                      boundaryMargin: const EdgeInsets.all(20),
                      minScale: 1.0,
                      maxScale: 5.0,
                      scaleEnabled: false,
                      child: Transform.scale(
                        scale: scale,
                        child: Image.asset(
                          quraanImage[index],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
