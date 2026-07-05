import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/primary_button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double _age = 30;
  double _coverage = 500000;
  String _type = 'Health';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Premium Calculator')),
      body: Center(
        child: Container(
          width: 500,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.borderLight),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 30,
                offset: const Offset(0, 10),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Calculate Premium', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 24),
              const Text('Insurance Type', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _type,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                items: ['Health', 'Life', 'Car', 'Bike', 'Travel']
                    .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                onChanged: (value) => setState(() => _type = value!),
              ),
              const SizedBox(height: 24),
              Text('Age: ${_age.toInt()} Years', style: const TextStyle(fontWeight: FontWeight.bold)),
              Slider(
                value: _age,
                min: 18,
                max: 80,
                activeColor: AppColors.secondary,
                onChanged: (val) => setState(() => _age = val),
              ),
              const SizedBox(height: 24),
              Text('Coverage Amount: ₹${_coverage.toInt()}', style: const TextStyle(fontWeight: FontWeight.bold)),
              Slider(
                value: _coverage,
                min: 100000,
                max: 10000000,
                divisions: 99,
                activeColor: AppColors.secondary,
                onChanged: (val) => setState(() => _coverage = val),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  text: 'Calculate Now',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Estimated Premium'),
                        content: Text('Your estimated monthly premium is ₹${((_age * 10) + (_coverage / 1000)).toInt()}'),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
