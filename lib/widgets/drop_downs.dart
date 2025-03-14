import 'package:flutter/material.dart';
import 'package:myth/widgets/text.dart';

class CustomExpansionTile extends StatelessWidget {
  String title;
  double? marginHorizontal;
  double? marginVertical;
  int? selectedId;
  List<Map> values;
  Function onChanged;
  CustomExpansionTile({required this.title, required this.values, 
  this.marginHorizontal,this.marginVertical,
  required this.selectedId,
    required this.onChanged});

  Widget build(BuildContext context) {
    print("data iz $values");
    final data = values;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: marginHorizontal?? 16, vertical: marginVertical?? 8), // Margin for spacing
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16), // Border radius
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4), // Shadow position
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16), // Ensure the child respects the radius
        child: ExpansionTile(
          shape: Border(),
          title: Text(title),
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4,
                  ),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          value: selectedId==index,//data[index]["id"],
                          onChanged: (bool? value) {
                            onChanged(index);
                            // setState(() {
                            //   data[key] = value!;
                            // });
                          },
                        ),
                        Flexible(child: TextLine(data[index]["name"])),
                      ],
                    );
                  },
                ),
              ),
          ]//values.keys.map((e)=>ListTile(title: Text("Item 2"))).toList(),
        ),
      ),
    );
  }
}
Widget DropDown({required String label,required List<String> options,required String selectedValue,Color? backgroundColor}) {
  return Column( 
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration( 
          color: backgroundColor??Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedValue,
            isExpanded: true,
            onChanged: (value) {
              // Handle selection change
            },
            items: options.map((option) {
              return DropdownMenuItem(
                value: option,
                child: Text(option),
              );
            }).toList(),
          ),
        ),
      ),
      SizedBox(height: 16),
    ],
  );
}