import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:myth/generated/l10n.dart';
import 'package:myth/utils/app_colors.dart';
import 'package:myth/utils/constants/shadows.dart';
import 'package:myth/widgets/curved.dart';
import 'package:shadow_clip/shadow_clip.dart';


class TCurvedEdgeWidget extends StatelessWidget {
  const TCurvedEdgeWidget({
    super.key,
    this.child=const SizedBox(),
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipShadow(
      clipper: TCustomCurvedEdges(),
      boxShadow: [TShadowStyle.clipShadow],
      child: child,
    );
  }
}


class TInputField extends StatefulWidget {
  final String label;
  final String placeholder;
  final bool? secureText;
  final IconData? icon;
   final TextEditingController controller;
  const TInputField({
    required this.label,
    required this.placeholder,
    this.secureText,
    required this.controller,
    this.icon,

  });

  @override
  State<TInputField> createState() => _TInputFieldState();
}

class _TInputFieldState extends State<TInputField> {
  bool hideText = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(8),
    child: Container(
      // borderRadius: BorderRadius.circular(50),
      // elevation: 6.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
              color:AppColors.inputField,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x55000000),
                  spreadRadius: 0,
                  blurRadius: 2.45,
                  offset: Offset(1, 3),
                ),
              ],
            ),
      
      child: Container(
            decoration: BoxDecoration(
              //         gradient: LinearGradient(
              //   begin: Alignment(-0.69, -1), // Adjust the alignment to match the angle
              //   end: Alignment(1, 1), // Adjust to match the angle
              //   colors: [
              //     Color.fromRGBO(196, 196, 196, 0.55), // rgba(196, 196, 196, 0.55)
              //     Color.fromRGBO(196, 196, 196, 0.05), // rgba(196, 196, 196, 0.05)
              //   ],
              //   stops: [0.0183, 0.9782], // 1.83% and 97.82%
              // ),
              borderRadius: BorderRadius.circular(50),
              color: Color.fromARGB(255, 239, 239, 239),//.withOpacity(0.55),//AppColors.inputField,
              boxShadow: const [
                // BoxShadow(
                //   color: Colors.grey,
                //   spreadRadius: .5,
                //   blurRadius: 2,
                //   offset: Offset(1, 1),
                // ),
              ],
            ),
            child: TextField(
              obscureText: widget.secureText== true ? hideText:false , 
              
              style: const TextStyle(fontSize: 16 , height: 1.5),  //TextStyle(color: Colors.black , fontWeight: FontWeight.bold),
              controller: widget.controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical:10 ),
                  suffixIcon: widget.icon!=null? 
                  IconButton(
                    onPressed: (){
                      if(widget.secureText==true){
                        setState(() {
                          hideText = !hideText;
                        });
                      }
                    } , icon: (widget.secureText==true?(hideText? Icon(Ionicons.eye_off) :Icon(Icons.remove_red_eye))
                     : Icon(widget.icon))) : null,
                  // suffixIcon: icon,
                  hintText: widget.placeholder,
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 139, 139, 139),
                      fontSize:  14,fontWeight: FontWeight.bold),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)))
            ),
          ),
    ),
     
  );
  }

}


Widget searchBox({required BuildContext context}){
  return Padding(
                  padding:  EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10),
                  child: Container(
                    // height: 50,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(color: const Color.fromARGB(255, 218, 218, 218) ,
                         offset: Offset(1, 2) , spreadRadius: 1 , blurRadius: 1)],
                      gradient: LinearGradient(
                        colors: [Colors.white,
                        AppColors.primary.withOpacity(.7),
                        AppColors.primary.withOpacity(.7),
                        ],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                       ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      // controller: searchController,
                      style: const TextStyle(height: 1.5),
                      decoration: InputDecoration(
                        filled: false,
                        fillColor: const Color.fromARGB(0, 112, 92, 92), 
                        hintText: S.of(context).seacrch_example,
                        prefixIcon: Icon(Icons.search),
                        border:  InputBorder.none,
                      ),
                    ),
                  ),
                );
}