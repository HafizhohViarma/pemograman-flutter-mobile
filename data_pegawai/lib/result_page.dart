import 'package:flutter/material.dart';

class SalaryResult extends StatelessWidget {
  final String nip;
  final String nama;
  final String alamat;
  final String golongan;
  final String tanggal;
  final double gajiPokok;
  final double tunjanganAnak;
  final double tunjanganIstri;

  SalaryResult({
    required this.nip,
    required this.nama,
    required this.alamat,
    required this.golongan,
    required this.tanggal,
    required this.gajiPokok,
    required this.tunjanganAnak,
    required this.tunjanganIstri,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HASIL'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('NIP: $nip'),
            Text('Nama: $nama'),
            Text('Alamat: $alamat'),
            Text('Golongan: $golongan'),
            Text('Tanggal: $tanggal'),
            Text('Gaji Pokok: $gajiPokok'),
            Text('Tunjangan Anak: $tunjanganAnak'),
            Text('Tunjangan Istri: $tunjanganIstri'),
          ],
        ),
      ),
    );
  }
}