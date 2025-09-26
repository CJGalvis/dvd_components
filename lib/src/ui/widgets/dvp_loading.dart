import 'package:flutter/material.dart';

class DVPLoading {
  static final DVPLoading _instance = DVPLoading._internal();
  factory DVPLoading() => _instance;
  DVPLoading._internal();

  OverlayEntry? _overlayEntry;

  void show(BuildContext context) {
    if (_overlayEntry != null) return; // evitar duplicados

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Fondo semitransparente
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          // El loading centrado
          const Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );

    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
  }

  void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
