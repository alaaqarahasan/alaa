import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductShimmerWidget extends StatelessWidget {
  const ProductShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!, // اللون الرمادي الأساسي
      highlightColor: Colors.grey[100]!, // لون وميض الإضاءة المتحرك
      child: Container(
        width: 130,
        margin: const EdgeInsets.only(left: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // محاكاة مكان الصورة الفارغ
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            // محاكاة أسطر النصوص والأسعار
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: 50, height: 10, color: Colors.grey),
                  const SizedBox(height: 6),
                  Container(width: 90, height: 10, color: Colors.grey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
