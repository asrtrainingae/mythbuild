//Sample data model 
import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';
class TagInput extends StatelessWidget {
    TagInput({Key? key}) : super(key: key);
    final _dynamicTagController = DynamicTagController();

    @override
    Widget build(BuildContext context) {
      return TextFieldTags<DynamicTagData>(
        textfieldTagsController: _dynamicTagController,
        initialTags:[
        ],
        textSeparators: const [' ', ','],
        validator: (DynamicTagData tag){
          if (tag.tag == 'lion') {
            return 'Not envited per tiger request';
          } else if (_dynamicTagController.getTags!
              .any((element) => element.tag == tag.tag)) {
            return 'Already in the club';
          }
          return null;
        },
        inputFieldBuilder: (context, inputFieldValues){
          return TextField(
            controller: inputFieldValues.textEditingController,
            focusNode: inputFieldValues.focusNode,
          );
        }
      ); 
    }
  }