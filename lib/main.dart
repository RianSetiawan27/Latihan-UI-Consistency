import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const LatihanRianApp());
}

class LatihanRianApp extends StatelessWidget {
  const LatihanRianApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Rian 1',
      debugShowCheckedModeBanner: false,
      home: const BlueGlassQuotes(),
    );
  }
}

class BlueGlassQuotes extends StatefulWidget {
  const BlueGlassQuotes({super.key});

  @override
  State<BlueGlassQuotes> createState() => _BlueGlassQuotesState();
}

class _BlueGlassQuotesState extends State<BlueGlassQuotes> {
  final List<String> quotes = [
    "Kalo kamu ngerasa ada yang kurang mungkin itu kurang aku 🥰😋😘",
    "Dewasa itu bukan perihal usia, tapi bagaimana cara kita menghargai hati manuasia",
    "Orang hebat bukan dia yang memiliki banyak cinta, tapi dia yang bisa menolak kehadiran cinta lain demi mempertahnkan satu cinta😋",
    "Karena sesungguhnya sesudah kesulitan itu ada kemudahan, sesungguhnya sesudah kesulitan itu ada kemudahan.(Q.S Al Insyirah: 5-6)",
  ];


  int currentQuote = 0;

  void gantiQuote() {
    setState(() {
      currentQuote = Random().nextInt(quotes.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1F2E),
      body: Stack(
        children: [
          // 🌈 Background gradasi lembut
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF243B55), Color(0xFF141E30)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // 💫 Efek blur lembut
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
              child: Container(color: Colors.transparent),
            ),
          ),

          // 🌟 Konten utama
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 150, left: 24, right: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start, // Naik ke atas
                  children: [
                    const Text(
                      "✨ Kata-Kata Hari Ini ✨",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
              
                    const SizedBox(height: 50),

                    // 💬 Glass Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(28),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.2),
                            Colors.white.withOpacity(0.05),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 1.2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF00E0FF).withOpacity(0.2),
                            blurRadius: 25,
                            spreadRadius: 3,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.format_quote_rounded,
                            size: 40,
                            color: Color(0xFF00E0FF),
                          ),
                          const SizedBox(height: 18),
                          Text(
                            quotes[currentQuote],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 21, // ⬆️ Ukuran teks diperbesar
                              color: Colors.white,
                              height: 1.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 50),

                    // 🔘 Tombol ganti kutipan
                    ElevatedButton.icon(
                      onPressed: gantiQuote,
                      icon: const Icon(
                        Icons.refresh_rounded,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "Ganti Kutipan",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                          0xFF00C9FF,
                        ).withValues(alpha: 0.8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 12,
                        shadowColor: const Color(
                          0xFF00E0FF,
                        ).withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
