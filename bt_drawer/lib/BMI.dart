import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final TextEditingController heightCtrl = TextEditingController();
  final TextEditingController weightCtrl = TextEditingController();

  double? bmi;
  String result = "";

  void tinhBMI() {
    final double? h = double.tryParse(heightCtrl.text); 
    final double? w = double.tryParse(weightCtrl.text);

    if (h == null || w == null || h <= 0 || w <= 0) {
      setState(() {
        bmi = null;
        result = "Dữ liệu không hợp lệ!";
      });
      return;
    }

    
    double bmiValue = w / (h * h);

    setState(() {
      bmi = double.parse(bmiValue.toStringAsFixed(2));
      result = phanLoai(bmiValue);
    });
  }

  String phanLoai(double bmi) {
    if (bmi < 18.5) return "Thiếu cân";
    if (bmi < 25) return "Bình thường";
    if (bmi < 30) return "Thừa cân";
    return "Béo phì";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tính chỉ số BMI"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            
            TextField(
              controller: heightCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Chiều cao (m)",   
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

          
            TextField(
              controller: weightCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Cân nặng (kg)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: tinhBMI,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  "Tính BMI",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 25),

        
            if (bmi != null)
              Text(
                "Chỉ số BMI: $bmi",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),

            const SizedBox(height: 10),

            
            if (bmi != null)
              Text(
                "Phân loại: $result",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
