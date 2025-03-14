import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:myth/utils/app_colors.dart';

class InputField extends StatefulWidget {
  final String placeholder;
  final bool? secureText;
  final IconData? icon;
  final TextInputType? inputType;
  final bool? readOnly ;
   final TextEditingController controller;
  const InputField({
    required this.placeholder,
    this.inputType,
    this.secureText,
    required this.controller,
    this.icon,
    this.readOnly

  });

  @override
  State<InputField> createState() => _InputFieldState();
}
class _InputFieldState extends State<InputField> {
  bool hideText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: EdgeInsets.all(0),
    child: Container(
      height:50,
          // decoration: ContainerDecorations.inputFieldDecoration ,
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(50),
          ),
          child: TextField(
            
            keyboardType: widget.inputType??TextInputType.text,
            readOnly:widget.readOnly==true?true:false,
            obscureText: widget.secureText== true ? hideText:false , 
            style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255) , fontWeight: FontWeight.bold),
            controller: widget.controller,
            decoration: InputDecoration(
              prefixIcon: widget.icon!=null?Icon(widget.icon , color:AppColors.primary) : null,
                suffixIcon: widget.secureText==true? 
                IconButton(
                  onPressed: (){
                    if(widget.secureText==true){
                      setState(() {
                        hideText = !hideText;
                      });
                    }
                  } , icon: (widget.secureText==true?(hideText? Icon(Ionicons.eye, color:AppColors.primary) :Icon(Icons.remove_red_eye , color:AppColors.primary))
                   : Icon(widget.icon))) : null,
                // suffixIcon: icon,
                hintText: widget.placeholder,
                hintStyle: const TextStyle(
                    color: AppColors.primary,
                    fontSize:  14,fontWeight: FontWeight.normal),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)))
          ),
        ),
      
  );
  }

}


Widget InputFiled2({String label="", TextEditingController? controller,required String placeholder, int maxLines = 1,Color? backgroundColor}){
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(label!='')Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        if(label!='')SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: backgroundColor?? Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: placeholder,
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
}