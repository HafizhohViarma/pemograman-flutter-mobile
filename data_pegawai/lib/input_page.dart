import 'package:flutter/material.dart';
import 'result_page.dart';

void main() {
  runApp(MaterialApp(
    home: InputPage(),
  ));
}

class InputPage extends StatefulWidget {
  @override
  _SalaryCalculatorState createState() => _SalaryCalculatorState();
}

class _SalaryCalculatorState extends State<InputPage> {
  TextEditingController nipController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  DateTime? selectedDate; // Tambahkan variabel untuk menyimpan tanggal terpilih
  String golongan = 'IIIA';

  List<String> golonganOptions = ['IIIA', 'IIIB', 'IIIC'];

  double gajiPokok = 0.0;
  double tunjanganAnak = 0.0;
  double tunjanganIstri = 0.0;

  // Fungsi untuk menampilkan date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ))!;
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gaji Pegawai'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nipController,
              decoration: InputDecoration(labelText: 'NIP'),
            ),
            TextField(
              controller: namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: alamatController,
              decoration: InputDecoration(labelText: 'Alamat'),
            ),
            Text('Golongan:'),
            DropdownButton<String>(
              value: golongan,
              items: golonganOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  golongan = newValue!;
                });
              },
            ),
            Row(
              children: <Widget>[
                Text('Tanggal: '),
                if (selectedDate != null)
                  Text(
                    "${selectedDate!.toLocal()}".split(' ')[0],
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Pilih Tanggal'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Hitung gaji pokok berdasarkan golongan
                if (golongan == 'IIIA') {
                  gajiPokok = 1000000;
                } else if (golongan == 'IIIB') {
                  gajiPokok = 2000000;
                } else if (golongan == 'IIIC') {
                  gajiPokok = 3000000;
                }

                // Hitung tunjangan anak dan istri
                tunjanganAnak = 0.05 * gajiPokok;
                tunjanganIstri = 0.05 * gajiPokok;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SalaryResult(
                      nip: nipController.text,
                      nama: namaController.text,
                      alamat: alamatController.text,
                      golongan: golongan,
                      tanggal: selectedDate != null
                          ? "${selectedDate!.toLocal()}".split(' ')[0]
                          : '',
                      gajiPokok: gajiPokok,
                      tunjanganAnak: tunjanganAnak,
                      tunjanganIstri: tunjanganIstri,
                    ),
                  ),
                );
              },
              child: Text('Hitung'),
            ),
          ],
        ),
      ),
    );
  }
}