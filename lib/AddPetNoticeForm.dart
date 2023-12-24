import 'package:flutter/material.dart';

class MyFormScreen extends StatefulWidget {
  @override
  _MyFormScreenState createState() => _MyFormScreenState();
}

class _MyFormScreenState extends State<MyFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evcil Hayvan İlan Formu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Temel Bilgiler'),
              _buildDropdown('Evcil hayvanın türü', ['Kedi', 'Köpek']),
              _buildDropdown('Evcil hayvanın yaşı', [
                '0-3 ay',
                '3-6 ay',
                '6-12 ay',
                '1 yıl',
                '2 yıl',
                '3 yıl',
                '4 yıl',
                '5 yıl',
                '6 yıl',
                '7 yıl',
                '8 yıl',
                '9 yıl',
                '10 yıl',
                '11 yıl',
                '12 yıl',
                '13 yıl',
                '14 yıl',
                '15 yıl',
                '16 yıl',
                '17 yıl',
                '16 yıl',
                '17 yıl',
                '18 yıl',
                '19 yıl',
                '20+ yıl',
                // Add more options as needed
              ]),
              _buildDropdown('Evcil hayvanın cinsiyeti', ['Dişi', 'Erkek']),
              _buildCheckbox('Kısır.'),
              _buildSectionTitle('Eğitim ve Sağlık'),
              _buildCheckbox('Tuvalet eğitimi var. (Kum/Sokak)'),
              _buildCheckbox('Kuru mama yer.'),
              _buildDropdown(
                  'Çocuklarla iyi geçinir.', ['Evet', 'Hayır', 'Bilmiyorum']),
              _buildDropdown('Başka kedilerle iyi geçinir.',
                  ['Evet', 'Hayır', 'Bilmiyorum']),
              _buildDropdown('Başka köpeklerle iyi geçinir.',
                  ['Evet', 'Hayır', 'Bilmiyorum']),
              _buildCheckbox('Devlet onaylı çipi var.'),
              _buildCheckbox('Aşı kartı var.'),
              _buildCheckbox('Aşılarını oldu.'),
              _buildDialogSelection(
                  'Parazit ilaçlarını aldıysa hangilerini aldı?',
                  ['İç parazit', 'Dış parazit']),
              _buildDropdown('Kilo durumu nedir?',
                  ['Fazla zayıf', 'Zayıf', 'Normal', 'Kilolu', 'Fazla kilolu']),
              _buildMultipleSelection(
                'Fiziksel/Sağlık problemleri var mı?',
                [
                  'Sağırlık',
                  'Körlük',
                  'Kalp sorunları',
                  'Böbrek yetmezliği',
                  'Eklem sıkıntıları',
                  'Obezite',
                  'Şeker',
                  'Solunum problemleri',
                  'Dental problemler',
                  'Ampute',
                  'Alerji',
                  'Kanser',
                  'Denge problemleri',
                  'Deri problemleri',
                  'İç parazit',
                  'Dış parazit',
                ],
              ),
              _buildMultipleSelection(
                'Mental/Ruhsal bir problemleri var mı?',
                ['Anksiyete', 'Depresyon', 'Saldırganlık'],
              ),
              _buildSectionTitle('Kişisel Özellikler'),
              _buildMultipleSelection(
                  'Evcil hayvanın 3 pozitif karakter özelliği nedir?', [
                'Oyuncu',
                'Sakin',
                'Kucakçı',
                'Hızlı öğrenen',
                'Korumacı',
                'Meraklı',
                'Dostçul',
              ]),
              _buildMultipleSelection(
                  'Evcil hayvanın 3 negatif karakter özelliği nedir?', [
                'Hiperaktif',
                'Agresif/Saldırgan',
                'Korkak',
                'Utangaç',
                'Fazla meraklı',
              ]),
              _buildSectionTitle('Fiziksel Özellikler'),
              _buildDropdown(
                  'Boyutu nedir?', ['Küçük', 'Orta', 'Büyük', 'Çok büyük']),
              _buildDropdown('Rengi nedir?', [
                'Beyaz',
                'Siyah',
                'Siyah-beyaz',
                'Tortoiseshell/3 renkli',
                'Kahverengi/Tekir',
                'Gri',
                'Sarı/Sarman',
                'Krem',
              ]),
              _buildCheckbox('Yüzü basık.'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Validate the form and submit
                  if (_formKey.currentState!.validate()) {
                    // Handle form submission
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        DropdownButton<String>(
          items: options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          onChanged: (String? value) {
            // Handle dropdown selection
          },
        ),
      ],
    );
  }

  Widget _buildCheckbox(String label) {
    bool isChecked = false;
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            // Handle checkbox selection
          },
        ),
        Text(label),
      ],
    );
  }

  Widget _buildDialogSelection(String label, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        ElevatedButton(
          onPressed: () {
            // Show a dialog with options
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(label),
                  content: Column(
                    children: options.map((String option) {
                      return ListTile(
                        title: Text(option),
                        onTap: () {
                          // Handle dialog option selection
                          Navigator.pop(context);
                        },
                      );
                    }).toList(),
                  ),
                );
              },
            );
          },
          child: Text('Select Options'),
        ),
      ],
    );
  }

  Widget _buildMultipleSelection(String label, List<String> options) {
    List<String> selectedOptions = [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Wrap(
          spacing: 8.0,
          children: options.map((String option) {
            bool isSelected = selectedOptions.contains(option);
            return FilterChip(
              label: Text(option),
              selected: isSelected,
              onSelected: (bool value) {
                // Handle chip selection
                if (value) {
                  selectedOptions.add(option);
                } else {
                  selectedOptions.remove(option);
                }
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
