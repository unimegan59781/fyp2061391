import 'package:flutter/material.dart';
import 'package:fyp/pages/Company/CompanyJob.dart';
import 'package:fyp/pages/Company/CompanySettings.dart';
import 'package:fyp/pages/company/companyCreate.dart';

class CompanyNavigationBar extends StatefulWidget {
  final String companyId;

  const CompanyNavigationBar({super.key, required this.companyId});

  @override
  State<CompanyNavigationBar> createState() => CompanyNavigationBarState(companyId: companyId);
}

class CompanyNavigationBarState extends State<CompanyNavigationBar> {
  final String companyId;

  CompanyNavigationBarState({required this.companyId});

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions(String companyId) => [
        CompanyJob(companyId: companyId),
        CompanyCreateJob(companyId: companyId),
        CompanySettings(companyId: companyId),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //String CompanyId = widget.Company_id;
    return Scaffold(
      body: Center(
        child: _widgetOptions(companyId)[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_business_outlined),
            label: 'Create Job',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}