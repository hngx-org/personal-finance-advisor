import 'package:personal_finance_advisor/src/core/utils/theme/app_decoration.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/colors.dart';
import 'package:flutter/material.dart';

class DropDownField<T> extends StatelessWidget {
  const DropDownField(
      {Key? key,
      required this.values,
      this.onChanged,
      this.label,
      this.currentValue,
      this.hintText})
      : super(key: key);
  final List<T> values;
  final void Function(T?)? onChanged;
  final String? label;
  final T? currentValue;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: textTheme.bodyMedium,
          ),
        if (label != null) const SizedBox(height: 8),
        Transform.scale(
          scaleY: 1,
          child: DropdownButtonFormField<T>(
            // style: textTheme.headlineMedium,
            icon: const Icon(Icons.keyboard_arrow_down),
            borderRadius: BorderRadius.circular(8),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(6),
              filled: true,
              hintText: hintText,
              fillColor: AppColors.baseWhite,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              labelStyle: const TextStyle(color: Colors.black),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.primary1000,
                  width: 0.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.primary1000,
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.primary1000,
                  width: 1,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.primary1000,
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.primary1000,
                  width: 1,
                ),
              ),
            ),
            value: currentValue ?? values.first,
            autovalidateMode: AutovalidateMode.always,
            items: values
                .map(
                  (e) => DropdownMenuItem<T>(
                    value: e,
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.7,
                      child: Text(
                        e is String ? e : "$e",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
