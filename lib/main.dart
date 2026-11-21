import 'package:flutter/material.dart';

void main() {
  runApp(const ZozoApp());
}

class ZozoApp extends StatelessWidget {
  const ZozoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZOZO',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF0878D1),
        scaffoldBackgroundColor: const Color(0xFFF4F8FC),
      ),
      home: const ZozoHome(),
    );
  }
}

class ZozoHome extends StatefulWidget {
  const ZozoHome({super.key});

  @override
  State<ZozoHome> createState() => _ZozoHomeState();
}

class _ZozoHomeState extends State<ZozoHome> {
  bool hebrew = false;

  String tr(String ar, String he) => hebrew ? he : ar;

  void message(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: hebrew ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0878D1),
          foregroundColor: Colors.white,
          title: const Text(
            'ZOZO',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () => setState(() => hebrew = !hebrew),
              child: Text(
                hebrew ? 'عربي' : 'עברית',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0878D1), Color(0xFF063B78)],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.ac_unit,
                    color: Colors.white,
                    size: 65,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    tr('أهلاً وسهلاً في زوزو', 'ברוכים הבאים ל-ZOZO'),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    tr(
                      'خدمات التكييف والتبريد باحتراف',
                      'שירותי מיזוג וקירור מקצועיים',
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    tr('رهط والمناطق المجاورة', 'רהט והסביבה'),
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Text(
              tr('خدماتنا', 'השירותים שלנו'),
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 14),
            serviceCard(
              Icons.ac_unit,
              tr('تركيب مكيفات', 'התקנת מזגנים'),
              tr('تركيب وتجهيز المكيفات', 'התקנה והכנת מזגנים'),
            ),
            serviceCard(
              Icons.build,
              tr('تصليح وصيانة', 'תיקון ותחזוקה'),
              tr('فحص وإصلاح الأعطال', 'בדיקה ותיקון תקלות'),
            ),
            serviceCard(
              Icons.cleaning_services,
              tr('تنظيف المكيفات', 'ניקוי מזגנים'),
              tr('تنظيف وفحص دوري', 'ניקוי ובדיקה תקופתית'),
            ),
            const SizedBox(height: 22),
            SizedBox(
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () => message(
                  tr('قريباً: خدمة حجز المواعيد', 'בקרוב: הזמנת תורים'),
                ),
                icon: const Icon(Icons.calendar_month),
                label: Text(
                  tr('احجز موعداً', 'קבע תור'),
                  style: const TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0878D1),
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 14),
            SizedBox(
              height: 55,
              child: OutlinedButton.icon(
                onPressed: () => message('0504427111'),
                icon: const Icon(Icons.phone),
                label: Text(
                  tr('اتصل بنا: 0504427111', 'התקשרו: 0504427111'),
                  style: const TextStyle(fontSize: 17),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Center(
              child: Text(
                tr('زوزو - راحتك تبدأ من هنا', 'ZOZO - הנוחות שלך מתחילה כאן'),
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget serviceCard(IconData icon, String title, String subtitle) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 12),
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          radius: 27,
          backgroundColor: const Color(0xFFE4F2FF),
          child: Icon(icon, color: const Color(0xFF0878D1), size: 29),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 17),
        onTap: () => message(title),
      ),
    );
  }
}