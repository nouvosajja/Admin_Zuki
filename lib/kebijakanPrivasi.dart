import 'package:flutter/material.dart';

class kebijakan extends StatefulWidget {
  const kebijakan({super.key});

  @override
  State<kebijakan> createState() => _kebijakanState();
}

class _kebijakanState extends State<kebijakan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  const SizedBox(height: 140, width: double.infinity),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const []),
                  Padding(
                    padding: const EdgeInsets.only(top: 40, left: 20),
                    child: Material(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: const Icon(Icons.arrow_back_ios,
                              size: 40, color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 48, left: 95),
                    child: SizedBox(
                      width: 290,
                      child: Text(
                        "Kebijakan Privasi",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 23),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 110, left: 20),
                    child: SizedBox(
                      child: Text(
                        "Kebijakan Privasi untuk Zuki Laundry",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 140, left: 20),
                    child: SizedBox(
                      width: 330,
                      child: Text(
                        "Di Zuki Laundry, dapat diakses dari, salah satu prioritas utama kami adalah privasi pengunjung kami. Dokumen Kebijakan Privasi ini berisi jenis informasi yang dikumpulkan dan dicatat oleh Zuki Laundry dan bagaimana kami menggunakannya.\n\nJika Anda memiliki pertanyaan tambahan atau memerlukan informasi lebih lanjut tentang Kebijakan Privasi kami, jangan ragu untuk menghubungi kami.",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 300, left: 20),
                    child: SizedBox(
                      child: Text(
                        "File Log",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 330, left: 20),
                    child: SizedBox(
                      width: 330,
                      child: Text(
                        "Zuki Laundry mengikuti prosedur standar menggunakan file log. File-file ini mencatat pengunjung ketika mereka mengunjungi situs web. Semua perusahaan hosting melakukan ini dan merupakan bagian dari analitik layanan hosting. Informasi yang dikumpulkan oleh file log termasuk alamat protokol internet (IP), jenis browser, Penyedia Layanan Internet (ISP), stempel tanggal dan waktu, halaman rujukan/keluar, dan mungkin jumlah klik. Ini tidak terkait dengan informasi apa pun yang dapat diidentifikasi secara pribadi. Tujuan dari informasi tersebut adalah untuk menganalisis tren, mengelola situs, melacak pergerakan pengguna di situs web, dan mengumpulkan informasi demografis. Kebijakan Privasi kami dibuat dengan bantuan Generator Kebijakan Privasi.",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 600, left: 20),
                    child: SizedBox(
                      child: Text(
                        "Cookie dan Suar Web",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 630, left: 20),
                    child: SizedBox(
                      width: 330,
                      child: Text(
                        "Seperti situs web lainnya, Zuki Laundry menggunakan 'cookies' Cookie ini digunakan untuk menyimpan informasi termasuk preferensi pengunjung, dan halaman di situs web yang diakses atau dikunjungi pengunjung. Informasi tersebut digunakan untuk mengoptimalkan pengalaman pengguna dengan menyesuaikan konten halaman web kami berdasarkan jenis browser pengunjung dan/atau informasi lainnya.",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 790, left: 20),
                    child: SizedBox(
                      child: Text(
                        "Kebijakan Privasi Pihak Ketiga",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 820, left: 20),
                    child: SizedBox(
                      width: 330,
                      child: Text(
                        "Kebijakan Privasi Zuki Laundry tidak berlaku untuk pengiklan atau situs web lain. Karenanya, kami menyarankan Anda untuk berkonsultasi dengan Kebijakan Privasi masing-masing dari server iklan pihak ketiga ini untuk informasi lebih rinci. Ini mungkin termasuk praktik dan instruksi mereka tentang cara menyisih dari opsi tertentu.\n\nAnda dapat memilih untuk menonaktifkan cookie melalui opsi browser individual Anda. Untuk mengetahui informasi lebih rinci tentang manajemen cookie dengan browser web tertentu, dapat ditemukan di situs web masing-masing browser. Apa itu Cookie?",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 1060, left: 20),
                    child: SizedBox(
                      child: Text(
                        "Izin",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 1090, left: 20),
                    child: SizedBox(
                      width: 330,
                      child: Text(
                        "By using our website, you hereby consent to our Privacy Policy and agree to its Terms and Conditions.",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
