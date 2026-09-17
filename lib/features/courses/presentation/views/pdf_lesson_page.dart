import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:public_file_saver/public_file_saver.dart';

import 'package:path_provider/path_provider.dart' as path_provider;

import 'package:learny/features/courses/domain/entities/pdf_lesson_entity.dart';

class PdfLessonPage extends StatefulWidget {
  final PdfLessonEntity lesson;

  const PdfLessonPage({super.key, required this.lesson});

  @override
  State<PdfLessonPage> createState() => _PdfLessonPageState();
}

class _PdfLessonPageState extends State<PdfLessonPage> {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();

  String? _pdfPath;

  int? _pages;
  int _currentPage = 0;

  bool _isReady = false;

  String _errorMessage = '';

  double xOffset = 0;
  double yOffset = 0;
  double scale = 1;
  Uint8List? _bytes;

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  // =========================
  // Download PDF
  // =========================

  Future<void> _loadPdf() async {
    try {
      final file = await downloadPdf(widget.lesson.pdfUrl);

      if (!mounted) return;

      setState(() {
        _pdfPath = file.path;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _errorMessage = e.toString();
      });
    }
  }

  Future<File> downloadPdf(String url) async {
    final response = await http.get(Uri.parse(url));

    debugPrint('Status: ${response.statusCode}');
    debugPrint('Content-Type: ${response.headers['content-type']}');
    debugPrint('Size: ${response.bodyBytes.length}');

    if (response.statusCode != 200) {
      throw Exception('Download failed: ${response.statusCode}');
    }

    _bytes = response.bodyBytes;

    // PDF الحقيقي يبدأ عادةً بـ %PDF
    final header = String.fromCharCodes(_bytes!.take(5));

    debugPrint('File header: $header');

    if (header != '%PDF-') {
      throw Exception('Downloaded data is not a valid PDF. Header: $header');
    }

    final directory = await path_provider.getApplicationCacheDirectory();

    final file = File('${directory.path}/lesson.pdf');

    await file.writeAsBytes(_bytes!, flush: true);

    return file;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.lesson.title),
          actions: [
            if (_bytes != null)
              IconButton(
                tooltip: 'Download PDF',
                icon: const Icon(Icons.download),
                onPressed: _bytes == null
                    ? null
                    : () async {
                        try {
                          final fileSaver = PublicFileSaver();

                          final result = await fileSaver.saveBytes(
                            bytes: _bytes!,
                            fileName: '${widget.lesson.title}.pdf',
                            mimeType: 'application/pdf',
                            subDir: 'Learny',
                          );

                          if (!mounted) return;

                          if (result != null && result.isSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'تم حفظ الملف في Downloads/Learny',
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('فشل حفظ الملف')),
                            );
                          }
                        } catch (e) {
                          if (!mounted) return;

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('حدث خطأ: $e')),
                          );
                        }
                      },
              ),
          ],
        ),

        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    // Error
    if (_errorMessage.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 50),

            const SizedBox(height: 12),

            Text(_errorMessage, textAlign: TextAlign.center),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  _errorMessage = '';
                  _isReady = false;
                  _pdfPath = null;
                });

                _loadPdf();
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    // Loading PDF
    if (_pdfPath == null) {
      return const Center(child: CircularProgressIndicator());
    }

    // PDF
    return Stack(
      children: [
        PDFView(
          filePath: _pdfPath!,

          // =========================
          // Scroll
          // =========================
          enableSwipe: true,

          swipeHorizontal: false,

          autoSpacing: true,

          pageFling: true,

          pageSnap: true,

          showScrollIndicators: true,

          // =========================
          // Page
          // =========================
          defaultPage: _currentPage,

          fitPolicy: FitPolicy.BOTH,

          // =========================
          // Links
          // =========================
          preventLinkNavigation: false,

          // =========================
          // Appearance
          // =========================
          backgroundColor: const Color(0xFFFEF7FF),

          nightMode: true,

          // =========================
          // Zoom
          // =========================
          minZoom: 1.0,

          maxZoom: 4.0,

          // =========================
          // Events
          // =========================
          onRender: (pages) {
            if (!mounted) return;

            setState(() {
              _pages = pages;
              _isReady = true;
            });

            debugPrint('PDF Rendered: $pages pages');
          },

          onError: (error) {
            if (!mounted) return;

            setState(() {
              _errorMessage = error.toString();
            });

            debugPrint('PDF Error: $error');
          },

          onPageError: (page, error) {
            if (!mounted) return;

            setState(() {
              _errorMessage = 'Page $page: $error';
            });

            debugPrint('Page $page Error: $error');
          },

          onViewCreated: (PDFViewController controller) {
            _controller.complete(controller);
          },

          onLinkHandler: (uri) {
            debugPrint('PDF Link: $uri');
          },

          onPageChanged: (page, total) {
            if (!mounted) return;

            setState(() {
              _currentPage = page ?? 0;
            });

            debugPrint('Page: ${_currentPage + 1}/$total');
          },

          onLoadComplete: (pages) {
            debugPrint('Total Pages: $pages');
          },

          onDraw: (pdfXOffset, pdfYOffset, pdfScale) {
            if (!mounted) return;

            setState(() {
              xOffset = pdfXOffset;
              yOffset = pdfYOffset;
              scale = pdfScale;
            });

            debugPrint(
              'X: $pdfXOffset '
              'Y: $pdfYOffset '
              'Scale: $pdfScale',
            );
          },
        ),

        // =========================
        // Loading indicator
        // =========================
        if (!_isReady) const Center(child: CircularProgressIndicator()),

        // =========================
        // Page indicator
        // =========================
        if (_isReady && _pages != null)
          Positioned(
            bottom: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${_currentPage + 1} / $_pages',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}
