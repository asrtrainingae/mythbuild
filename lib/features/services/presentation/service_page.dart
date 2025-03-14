import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myth/generated/l10n.dart';
import 'package:myth/widgets/app_bars.dart';

class ServicePage extends StatefulWidget {
  final String serviceName;

  ServicePage({required this.serviceName});

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  // Current selected index to manage active button and description
  int selectedIndex = 0;

  // Descriptions corresponding to each button
  final List<String> descriptions_ar = [
    "اهداف قصيرة الدى\nيواجه كثير من الأطفال المصابين بتعذر الأداء النطقي لدى الأطفال صعوبة في تحريك الفك والشفتين واللسان إلى المواضع الصحيحة لإصدار أحد الأصوات. وقد يواجهون أيضًا صعوبة في الانتقال بسلاسة إلى الصوت التالي. يواجه الأطفال المصابون بتعذر الأداء النطقي لدى الأطفال مشكلات في اللغة أيضًا، مثل قلة حصيلة المفردات أو صعوبة ترتيب الكلمات. قد تكون بعض الأعراض مقتصرة على الأطفال الذين لديهم تعذر الأداء النطقي لدى الأطفال، ما يساعد على إجراء التشخيص. ومع ذلك، فإن بعض أعراض تعذر الأداء النطقي لدى الأطفال هي نفسها أعراض أنواع أخرى أيضًا من اضطرابات النطق أو اللغة. ولذلك يصعُب تشخيص تعذر الأداء النطقي لدى الأطفال  إذا كانت لدى الطفل أعراض مشتركة بين حالة تعذر الأداء النطقي لدى الأطفال وبين أنواع أخرى من الاضطرابات.....",
    "اهداف طويلة الدى\nيواجه كثير من الأطفال المصابين بتعذر الأداء النطقي لدى الأطفال صعوبة في تحريك الفك والشفتين واللسان إلى المواضع الصحيحة لإصدار أحد الأصوات. وقد يواجهون أيضًا صعوبة في الانتقال بسلاسة إلى الصوت التالي. يواجه الأطفال المصابون بتعذر الأداء النطقي لدى الأطفال مشكلات في اللغة أيضًا، مثل قلة حصيلة المفردات أو صعوبة ترتيب الكلمات. قد تكون بعض الأعراض مقتصرة على الأطفال الذين لديهم تعذر الأداء النطقي لدى الأطفال، ما يساعد على إجراء التشخيص. ومع ذلك، فإن بعض أعراض تعذر الأداء النطقي لدى الأطفال هي نفسها أعراض أنواع أخرى أيضًا من اضطرابات النطق أو اللغة. ولذلك يصعُب تشخيص تعذر الأداء النطقي لدى الأطفال إذا كانت لدى الطفل أعراض مشتركة بين حالة تعذر الأداء      النطقي لدى الأطفال وبين أنواع أخرى من الاضطرابات.....",
    "خطة العلاج\nيواجه كثير من الأطفال المصابين بتعذر الأداء النطقي لدى الأطفال صعوبة في تحريك الفك والشفتين واللسان إلى المواضع الصحيحة لإصدار أحد الأصوات. وقد يواجهون أيضًا صعوبة في الانتقال بسلاسة إلى الصوت التالي. يواجه الأطفال المصابون بتعذر الأداء النطقي لدى الأطفال مشكلات في اللغة أيضًا، مثل قلة حصيلة المفردات أو صعوبة ترتيب الكلمات. قد تكون بعض الأعراض مقتصرة على الأطفال الذين لديهم تعذر الأداء النطقي لدى الأطفال، ما يساعد على إجراء التشخيص. ومع ذلك، فإن بعض أعراض تعذر الأداء النطقي لدى الأطفال هي نفسها أعراض أنواع أخرى أيضًا من اضطرابات النطق أو اللغة. ولذلك يصعُب تشخيص تعذر الأداء النطقي لدى الأطفال إذا كانت لدى الطفل أعراض مشتركة بين حالة تعذر    الأداء النطقي لدى الأطفال وبين أنواع أخرى من الاضطرابات.....",
  ];
  final List<String> descriptions_en = [
    "Short gloals\n Many children with Childhood Apraxia of speech face Difficulty moving the jaw, lips and tongue to the    correct positions To make one of the sounds. They may also have difficulty moving smoothly To the next sound. Children with apraxia of speech are faced with Children also have language problems, such as a lack of vocabulary or difficulty Word order. Some symptoms may be limited to children who They have speech apraxia in children, which helps to make a diagnosis. However, some of the symptoms of apraxia of speech in children are The same symptoms are also other types of speech or language disorders. Therefore It is difficult to diagnose apraxia of speech in children if the child has Common symptoms....",
    "Long goals\n Many children with Childhood Apraxia of speech face Difficulty moving the jaw,     lips and tongue to the correct positions To make one of the sounds. They may also have difficulty moving smoothly To the next sound. Children with apraxia of speech are faced with Children also have language problems, such as a lack of vocabulary or difficulty Word order. Some symptoms may be limited to children who They have speech apraxia in children, which helps to make a diagnosis. However, some of the symptoms of apraxia of speech in children are The same symptoms are also other types of speech or language disorders. Therefore It is difficult to diagnose apraxia of speech in children if the child has Common symptoms....",
    "Treatment Plan \n Many children with Childhood    Apraxia of speech face Difficulty moving the jaw, lips and tongue to the correct positions To make one of the sounds. They may also have difficulty moving smoothly To the next sound. Children with apraxia of speech are faced with Children also have language problems, such as a lack of vocabulary or difficulty Word order. Some symptoms may be limited to children who They have speech apraxia in children, which helps to make a diagnosis. However, some of the symptoms of apraxia of speech in children are The same symptoms are also other types of speech or language disorders. Therefore It is difficult to diagnose apraxia of speech in children if the child has Common symptoms....",
  ];
  List<String> descriptions = [];

  // Buttons Text
  List<String> buttonLabels = [];

@override
  void initState() {
    // TODO: implement initState
    super.initState();
     descriptions= Intl.getCurrentLocale() =="en" ? descriptions_en :descriptions_ar;
  }
  @override
  Widget build(BuildContext context) {
    buttonLabels = [
    S.of(context).short_goals_range,
    S.of(context).long_goals_range,
    S.of(context).treatment_plan,
  ];
    // Primary color for active button
    Color primaryColor = Color(0xFF00A5F2); // The blue color in the design

    // Button background color for inactive buttons
    Color inactiveColor = Colors.grey.shade200;

    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: myAppBar(title: widget.serviceName, context:context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:40),
              // Buttons
              for (int i = 0; i < buttonLabels.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = i;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedIndex == i ? primaryColor : inactiveColor,
                        borderRadius: BorderRadius.circular(30),
                        border:Border.all(color:Colors.white , width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      child: Center(
                        child: Text(
                          buttonLabels[i],
                          style: TextStyle(
                            color: selectedIndex == i
                                ? Colors.white
                                : Colors.blueGrey.shade900,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              Divider(thickness: 1, color: Colors.grey.shade300),
              SizedBox(height: 16),
              // Description Box
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFB9E6FF), // The light blue background in the design
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Text(
                      descriptions[selectedIndex],
                      style: TextStyle(
                        color: Colors.blueGrey.shade900,
                        fontSize: 16,
                      ),
                    ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
