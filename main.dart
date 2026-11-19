import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const ShifraApp());
}

class ShifraApp extends StatelessWidget {
  const ShifraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'شيفرة',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0D1117),
        primaryColor: const Color(0xFFD4AF37),
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: GroupsScreen(),
      ),
    );
  }
}

class QuestionItem {
  final String q;
  final String a;
  final List<String> s;

  const QuestionItem({required this.q, required this.a, required this.s});
}

// قاعدة بيانات المجموعات والمراحل (10 مراحل في كل مجموعة، 3 أسئلة لكل مرحلة)
final List> gameGroups = [
  {
    'title': 'المجموعة الأولى: المعرفة العامة',
    'stages': [
      [
        const QuestionItem(q: 'العضو المسؤول عن ضخ الدم في الجسم', a: 'القلب', s: ['ال', 'قل', 'ب']),
        const QuestionItem(q: 'شركة سيارات يابانية تنتج سيارة كامري', a: 'تويوتا', s: ['تو', 'يو', 'تا']),
        const QuestionItem(q: 'لون النسر في وسط علم مصر', a: 'ذهبي', s: ['ذه', 'بي']),
      ],
      [
        const QuestionItem(q: 'أطول نهر في العالم', a: 'النيل', s: ['ال', 'ني', 'ل']),
        const QuestionItem(q: 'مخترع المصباح الكهربائي', a: 'أديسون', s: ['أدي', 'سو', 'ن']),
        const QuestionItem(q: 'الغاز الضروري لعملية التنفس', a: 'الأكسجين', s: ['الأك', 'س', 'جين']),
      ],
      [
        const QuestionItem(q: 'أسرع حيوان بري في العالم', a: 'الفهد', s: ['ال', 'فه', 'د']),
        const QuestionItem(q: 'عاصمة دولة اليابان', a: 'طوكيو', s: ['طو', 'كي', 'و']),
        const QuestionItem(q: 'أقرب كوكب إلى الشمس', a: 'عطارد', s: ['ع', 'طا', 'رد']),
      ],
      [
        const QuestionItem(q: 'مؤلف كتاب مقدمة ابن خلدون', a: 'ابن خلدون', s: ['ابن', 'خل', 'دون']),
        const QuestionItem(q: 'معدن سائل في درجة حرارة الغرفة', a: 'الزئبق', s: ['ال', 'زئ', 'بق']),
        const QuestionItem(q: 'أكبر قارات العالم مساحة', a: 'آسيا', s: ['آ', 'سي', 'ا']),
      ],
      [
        const QuestionItem(q: 'عدد دول الوطن العربي', a: 'اثنتان وعشرون', s: ['اثن', 'تان', 'وعش', 'رون']),
        const QuestionItem(q: 'الحيوان الملقب بسفينة الصحراء', a: 'الجمل', s: ['ال', 'ج', 'مل']),
        const QuestionItem(q: 'أعلى قمة جبلية في العالم', a: 'إيفرست', s: ['إي', 'فر', 'ست']),
      ],
      [
        const QuestionItem(q: 'العملة الرسمية للمملكة العربية السعودية', a: 'الريال', s: ['ال', 'ري', 'ال']),
        const QuestionItem(q: 'عدد ألوان قوس قزح', a: 'سبعة', s: ['سب', 'ع', 'ة']),
        const QuestionItem(q: 'أكبر محيط في العالم', a: 'الهادئ', s: ['ال', 'ها', 'دئ']),
      ],
      [
        const QuestionItem(q: 'عاصمة دولة الإمارات العربية المتحدة', a: 'أبوظبي', s: ['أبو', 'ظ', 'بي']),
        const QuestionItem(q: 'الكوكب الأحمر في المجموعة الشمسية', a: 'المريخ', s: ['ال', 'مر', 'يخ']),
        const QuestionItem(q: 'مكتشف الجاذبية الأرضية', a: 'نيوتن', s: ['نيو', 'ت', 'ن']),
      ],
      [
        const QuestionItem(q: 'أصغر دولة في العالم مساحة', a: 'الفاتيكان', s: ['الفا', 'تي', 'كان']),
        const QuestionItem(q: 'الفيتامين الذي نحصل عليه من الشمس', a: 'دال', s: ['دا', 'ل']),
        const QuestionItem(q: 'لغة أهل البرازيل الرسمية', a: 'البرتغالية', s: ['البر', 'تغا', 'لية']),
      ],
      [
        const QuestionItem(q: 'عدد قلوب الأخطبوط', a: 'ثلاثة', s: ['ثلا', 'ث', 'ة']),
        const QuestionItem(q: 'أقسى مادة طبيعية على وجه الأرض', a: 'الألماس', s: ['الأل', 'ما', 'س']),
        const QuestionItem(q: 'مخترع الهاتف', a: 'غراهام بيل', s: ['غرا', 'هام', 'بيل']),
      ],
      [
        const QuestionItem(q: 'أكبر عضو في جسم الإنسان', a: 'الجلد', s: ['ال', 'جل', 'د']),
        const QuestionItem(q: 'عاصمة فرنسا', a: 'باريس', s: ['با', 'ري', 'س']),
        const QuestionItem(q: 'أسرع طائر في العالم', a: 'الشاهين', s: ['الشا', 'هي', 'ن']),
      ],
    ]
  },
  {
    'title': 'المجموعة الثانية: التاريخ والحضارات',
    'stages': List.generate(
      10,
      (index) => [
        const QuestionItem(q: 'الحضارة التي بنت الأهرامات', a: 'الفرعونية', s: ['الفر', 'عو', 'نية']),
        const QuestionItem(q: 'فاتح بلاد الأندلس', a: 'طارق بن زياد', s: ['طارق', 'بن', 'زياد']),
        const QuestionItem(q: 'أول عاصمة للدولة الإسلامية', a: 'المدينة المنورة', s: ['المدي', 'نة', 'المنورة']),
      ],
    ),
  },
  {
    'title': 'المجموعة الثالثة: العلوم والفضاء',
    'stages': List.generate(
      10,
      (index) => [
        const QuestionItem(q: 'المجرة التي يقع فيها كوكب الأرض', a: 'درب التبانة', s: ['درب', 'الت', 'بانة']),
        const QuestionItem(q: 'وحدة قياس شدة التيار الكهربائي', a: 'الأمبير', s: ['الأم', 'بي', 'ر']),
        const QuestionItem(q: 'أقرب نجم إلى كوكب الأرض', a: 'الشمس', s: ['ال', 'شم', 'س']),
      ],
    ),
  },
];

// متغيرات حالة اللعبة العامة
int userCoins = 1000;
Map<String, bool> completedStages = {};

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({super.key});

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'شيفرة',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xFFD4AF37)),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF161B22),
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF21262D),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFD4AF37), width: 1),
            ),
            child: Row(
              children: [
                const Icon(Icons.monetization_on, color: Color(0xFFD4AF37), size: 18),
                const SizedBox(width: 6),
                Text(
                  '$userCoins',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: gameGroups.length,
        itemBuilder: (context, groupIndex) {
          final group = gameGroups[groupIndex];
          final stages = group['stages'] as List<List<QuestionItem>>;

          return Card(
            color: const Color(0xFF161B22),
            margin: const EdgeInsets.only(bottom: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: Color(0xFF30363D)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        group['title'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD4AF37),
                        ),
                      ),
                      const Text(
                        'مفتوحة',
                        style: TextStyle(color: Colors.greenAccent, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: List.generate(stages.length, (stageIndex) {
                      final stageKey = '$groupIndex-$stageIndex';
                      final isDone = completedStages[stageKey] ?? false;

                      return InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => Directionality(
                                textDirection: TextDirection.rtl,
                                child: StagePlayScreen(
                                  groupIndex: groupIndex,
                                  stageIndex: stageIndex,
                                  questions: stages[stageIndex],
                                ),
                              ),
                            ),
                          );
                          setState(() {});
                        },
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isDone ? const Color(0xFF1F6FEB) : const Color(0xFF21262D),
                            border: Border.all(
                              color: isDone ? Colors.greenAccent : const Color(0xFFD4AF37),
                              width: 2,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: isDone
                              ? const Icon(Icons.check, color: Colors.white, size: 22)
                              : Text(
                                  '${stageIndex + 1}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class StagePlayScreen extends StatefulWidget {
  final int groupIndex;
  final int stageIndex;
  final List<QuestionItem> questions;

  const StagePlayScreen({
    super.key,
    required this.groupIndex,
    required this.stageIndex,
    required this.questions,
  });

  @override
  State<StagePlayScreen> createState() => _StagePlayScreenState();
}

class _StagePlayScreenState extends State<StagePlayScreen> {
  int currentQuestionIdx = 0;
  List<String> selectedSegments = [];
  late List<String> shuffledPool;
  List<int> usedIndices = [];

  @override
  void initState() {
    super.initState();
    _loadQuestion();
  }

  void _loadQuestion() {
    final qItem = widget.questions[currentQuestionIdx];
    selectedSegments = [];
    usedIndices = [];
    shuffledPool = List<String>.from(qItem.s)..shuffle();
  }

  void _onSegmentTap(int poolIdx) {
    if (usedIndices.contains(poolIdx)) return;

    SystemSound.play(SystemSoundType.click);
    setState(() {
      usedIndices.add(poolIdx);
      selectedSegments.add(shuffledPool[poolIdx]);
    });

    final currentAnswer = selectedSegments.join('');
    final targetAnswer = widget.questions[currentQuestionIdx].a.replaceAll(' ', '');

    if (currentAnswer == targetAnswer) {
      Future.delayed(const Duration(milliseconds: 350), () {
        if (!mounted) return;
        if (currentQuestionIdx < widget.questions.length - 1) {
          setState(() {
            currentQuestionIdx++;
            _loadQuestion();
          });
        } else {
          final stageKey = '${widget.groupIndex}-${widget.stageIndex}';
          final alreadyCompleted = completedStages[stageKey] ?? false;
          if (!alreadyCompleted) {
            completedStages[stageKey] = true;
            userCoins += 1;
          }
          _showWinDialog();
        }
      });
    }
  }

  void _useHint() {
    if (userCoins < 25) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('لا يوجد رصيد كافٍ للتلميح (تحتاج 25 عملة)')),
      );
      return;
    }

    final targetSegments = widget.questions[currentQuestionIdx].s;
    if (selectedSegments.length >= targetSegments.length) return;

    setState(() {
      userCoins -= 25;
      // إعادة ضبط الإدخال الخاطئ إن وجد
      selectedSegments.clear();
      usedIndices.clear();
      final firstCorrect = targetSegments[0];
      final idxInPool = shuffledPool.indexOf(firstCorrect);
      if (idxInPool != -1) {
        usedIndices.add(idxInPool);
        selectedSegments.add(firstCorrect);
      }
    });
  }

  void _showWinDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          backgroundColor: const Color(0xFF161B22),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('أحسنت! اكتملت المرحلة', style: TextStyle(color: Color(0xFFD4AF37))),
          content: const Text('تم فك الشيفرة بنجاح وحصلت على +1 عملة ذهبية.'),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD4AF37)),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('متابعة', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final qItem = widget.questions[currentQuestionIdx];

    return Scaffold(
      appBar: AppBar(
        title: Text('المرحلة ${widget.stageIndex + 1}'),
        centerTitle: true,
        backgroundColor: const Color(0xFF161B22),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Icon(Icons.monetization_on, color: Color(0xFFD4AF37), size: 18),
                const SizedBox(width: 4),
                Text('$userCoins', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // مؤشر الأسئلة الثلاثة للمرحلة
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.questions.length, (idx) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  width: 32,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: idx <= currentQuestionIdx ? const Color(0xFFD4AF37) : const Color(0xFF30363D),
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),
            // بطاقة اللغز
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF161B22),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFF30363D)),
              ),
              child: Text(
                qItem.q,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold, height: 1.5),
              ),
            ),
            const SizedBox(height: 30),
            // مربع الإجابة في المنتصف
            Center(
              child: Container(
                constraints: const BoxConstraints(minWidth: 220, minHeight: 58),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFF21262D),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFD4AF37), width: 1.5),
                ),
                alignment: Alignment.center,
                child: Text(
                  selectedSegments.isEmpty ? 'كوّن الإجابة هنا' : selectedSegments.join(' '),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: selectedSegments.isEmpty ? Colors.grey : Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // أزرار المسح والتلميح
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      selectedSegments.clear();
                      usedIndices.clear();
                    });
                  },
                  icon: const Icon(Icons.refresh, color: Colors.redAccent),
                  label: const Text('مسح', style: TextStyle(color: Colors.redAccent)),
                ),
                const SizedBox(width: 20),
                TextButton.icon(
                  onPressed: _useHint,
                  icon: const Icon(Icons.lightbulb, color: Color(0xFFD4AF37)),
                  label: const Text('تلميح (25)', style: TextStyle(color: Color(0xFFD4AF37))),
                ),
              ],
            ),
            const Spacer(),
            // أزرار المقاطع الصوتية / الكلمات
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: List.generate(shuffledPool.length, (idx) {
                final isUsed = usedIndices.contains(idx);
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isUsed ? const Color(0xFF161B22) : const Color(0xFF21262D),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: isUsed ? Colors.transparent : const Color(0xFF58A6FF),
                      ),
                    ),
                  ),
                  onPressed: isUsed ? null : () => _onSegmentTap(idx),
                  child: Text(
                    shuffledPool[idx],
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
