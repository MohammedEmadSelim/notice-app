
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/colors.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/fontSizer.dart';
import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  const CustomText({super.key, required this.text, this.textColor, this.fontWeight
    , this.maxLines, this.textAlign,this.height,this.overFlowText,this.fontSizes});

  final String text;
  final Color? textColor;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final double? height;
  final TextOverflow? overFlowText;
  final double? fontSizes;

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      maxLines: widget.maxLines,
      textAlign: widget.textAlign,
      overflow: widget.overFlowText ,

      style: TextStyle(fontWeight: widget.fontWeight,
          color: widget.textColor ?? AppColors.textColor,fontSize:widget.fontSizes ?? FontSizer.s15,height:widget.height,
          fontFamily:"SFArabicRounded"
        )
    );
  }
}