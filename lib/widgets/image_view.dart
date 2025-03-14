/*
 * Webkul Software.
 * @package Mobikul Application Code.
 * @Category Mobikul
 * @author Webkul <support@webkul.com>
 * @Copyright (c) Webkul Software Private Limited (https://webkul.com)
 * @license https://store.webkul.com/license.html
 * @link https://store.webkul.com/license.html
 */

// file_names, avoid_print, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myth/utils/assets.dart';

class ImageView extends StatelessWidget {
  final String? url;
  final String? url_from_assets;
  final double height;
  final double width;
  final BoxFit? fit;
  final String? placeHolder;

  const ImageView(
      {Key? key,
      this.url,
      this.url_from_assets,
      this.width = 0.0,
      this.height = 0.0,
        this.placeHolder,
      this.fit=BoxFit.fill })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(url!=null)
    return CachedNetworkImage(
      width:  width != 0.0 ?  width : null,
      height: height != 0.0 ?  height : null,
      fit: fit ?? BoxFit.scaleDown,
      imageUrl: url??"",
      placeholder: (context, url) => Image.network(url),
      errorWidget: (context, url, error) => Image.asset(Assets.imagePlaceHolder),
    );
    else if(url_from_assets!=null)
    return Image.asset(
      url_from_assets ?? Assets.imagePlaceHolder,
      width:  width != 0.0 ?  width : null,
      height: height != 0.0 ?  height : null,
      fit: fit ?? BoxFit.scaleDown,
      );

    return SizedBox();
  }
}


Widget UserImage({String? image , FileImage? tempImage}) {
  return CircleAvatar(
    // backgroundColor:Colors.amber,
                            radius: 50,
                            backgroundImage:(tempImage==null?CachedNetworkImageProvider(
                              image??"",
                              // "https://cdn.afterdawn.fi/v3/news/jpeg-logo.jpg",
                              errorListener: (err){
                                print("ERROR proflee $err");
                              }
                              
                            ):tempImage!) as ImageProvider,
                             child: CachedNetworkImage(
        imageUrl:image??"",
        imageBuilder: (context, imageProvider) => CircleAvatar(
          radius: 50,
          backgroundImage: imageProvider, 
        ),
        placeholder: (context, url) => CircularProgressIndicator(color: Colors.white,),
        errorWidget: (context, url, error) {
          return CircleAvatar(
          radius: 50,
          backgroundImage: (tempImage==null?  AssetImage("assets/images/no_image.png") : tempImage) as ImageProvider,
        );},)) ;
}
