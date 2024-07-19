import 'package:flutter/material.dart';
import '../../../core/shared/theming/text_style.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'سياسة الخصوصية',
          style: TextStyles.font16mainColorBold,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text('الحالة والحضور', style: TextStyles.font18BlackBold),
              SizedBox(
                height: 15,
              ),
              Text(
                  'هل تريد تعلم لغة جديدة أو اكتساب مهارة جديدة؟ تطبيقنا التعليمي يوفر لك كل ما تحتاجه! كورسات مصممة خصيصًا لك، وتفاعل مباشر مع خبراء المجال. وليس ذلك فحسب، بل يمكنك أيضًا شراء مشاريع جاهزة لمساعدتك على تطبيق ما تعلمته بشكل عملي والبدء في بناء محفظتك. ابدأ رحلتك التعليمية الآن!"',
                  style: TextStyles.font16BlackW500),
              SizedBox(
                height: 40,
              ),
              Text('الشروط والاستخدام', style: TextStyles.font18BlackBold),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  TextForTermsOfUse(title: 'التسجيل:',text: ' يجب عليك إنشاء حساب لتتمكن من استخدام التطبيق. يجب أن تكون المعلومات التي تقدمها أثناء التسجيل دقيقة وكاملة.',),

                  TextForTermsOfUse(title: 'حقوق الملكية:', text: 'جميع الحقوق المتعلقة بالمحتوى الموجود في التطبيق تعود إلينا. يحظر عليك نسخ أو توزيع أو تعديل أي جزء من المحتوى دون الحصول على إذن كتابي منا.'),
                  TextForTermsOfUse(title: 'السلوك:', text: ' يمنع استخدام التطبيق لأي غرض غير قانوني أو ضار. يحظر نشر أي محتوى مسيء أو عنيف أو يحرض على الكراهية.'),
                  TextForTermsOfUse(title: 'الخصوصية:', text: ' يرجى الاطلاع على سياسة الخصوصية الخاصة بنا لمعرفة كيفية جمعنا واستخدامنا لحمايتك لبياناتك الشخصية.'),
                  TextForTermsOfUse(title: 'التغييرات:', text: ' نحتفظ بالحق في تعديل هذه الشروط في أي وقت. سيتم إبلاغك بأي تغييرات جوهرية.'),
                  TextForTermsOfUse(title: 'إنهاء الخدمة:', text: ' نحتفظ بالحق في إنهاء حسابك أو الوصول إلى التطبيق في أي وقت دون إشعار مسبق.'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextForTermsOfUse extends StatelessWidget {
  final String title;
  final String text;
  const TextForTermsOfUse({
    super.key, required this.title, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: title,
                  style: TextStyles.font16BlackBold),
              TextSpan(
                  text: text, style: TextStyles.font16BlackW500),
            ],
          ),
        ),
        SizedBox(height: 5,),
      ],
    );
  }
}
