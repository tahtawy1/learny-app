import 'package:flutter/material.dart';
import 'package:learny/core/localization/l10n/app_localizations_ar.dart';

class LessonAttachments extends StatelessWidget {
  final String? title;
  final String? size;
  final VoidCallback? onDownload;

  const LessonAttachments({
    super.key,
    this.title,
    this.size,
    this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveTitle = title ?? AppLocalizationsAr.instance.lessonDefaultAttachmentName;
    final effectiveSize = size ?? '2.5 ${AppLocalizationsAr.instance.courseMegabyteSuffix}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizationsAr.instance.lessonAttachmentsTitle,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Row(
            children: [
              // 1. File icon badge (Right in RTL)
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Icon(
                    Icons.description_outlined,
                    color: Color(0xFF3B82F6),
                    size: 24,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // 2. File Title & Size (Center)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      effectiveTitle,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      effectiveSize,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF94A3B8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 12),

              // 3. Download button (Left in RTL)
              GestureDetector(
                onTap: onDownload,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: Color(0xFFDCFCE7),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_downward_rounded,
                      color: Color(0xFF16A34A),
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
