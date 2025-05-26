import 'package:flutter/material.dart';



class PortfolioHomePage extends StatefulWidget {
  @override
  _PortfolioHomePageState createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();
  String _selectedSection = 'home';

  final Map<String, GlobalKey> _sectionKeys = {
    'home': GlobalKey(),
    'about': GlobalKey(),
    'projects': GlobalKey(),
    'expertise': GlobalKey(),
    'contact': GlobalKey(),
  };

  void _scrollToSection(String section) {
    final context = _sectionKeys[section]?.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
      setState(() {
        _selectedSection = section;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          // Navigation Bar
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    'Flutter Dev',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[700],
                    ),
                  ),
                ),
                Row(
                  children: [
                    _buildNavItem('Home', 'home'),
                    _buildNavItem('About', 'about'),
                    _buildNavItem('Projects', 'projects'),
                    _buildNavItem('Expertise', 'expertise'),
                    _buildNavItem('Contact', 'contact'),
                    SizedBox(width: 40),
                  ],
                ),
              ],
            ),
          ),
          // Main Content
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  _buildHomeSection(),
                  _buildAboutSection(),
                  _buildProjectsSection(),
                  _buildExpertiseSection(),
                  _buildContactSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title, String section) {
    bool isSelected = _selectedSection == section;
    return GestureDetector(
      onTap: () => _scrollToSection(section),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue[700] : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[700],
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildHomeSection() {
    return Container(
      key: _sectionKeys['home'],
      height: MediaQuery.of(context).size.height - 70,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue[50]!, Colors.white],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.blue[700],
              child: Icon(
                Icons.person,
                size: 100,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'আমি একজন Flutter Developer',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Mobile ও Web Application তৈরি করি Flutter দিয়ে',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => _scrollToSection('projects'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'আমার কাজ দেখুন',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutSection() {
    return Container(
      key: _sectionKeys['about'],
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'আমার সম্পর্কে',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    Icons.code,
                    size: 150,
                    color: Colors.blue[700],
                  ),
                ),
              ),
              SizedBox(width: 60),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'আমি একজন পেশাদার Flutter Developer যার ২+ বছরের অভিজ্ঞতা রয়েছে। আমি বিভিন্ন ধরনের Mobile এবং Web Application তৈরি করেছি।',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[700],
                        height: 1.6,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'আমার দক্ষতা:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 15),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        _buildSkillChip('Flutter'),
                        _buildSkillChip('Dart'),
                        _buildSkillChip('Firebase'),
                        _buildSkillChip('REST API'),
                        _buildSkillChip('State Management'),
                        _buildSkillChip('UI/UX Design'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue[700],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        skill,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildProjectsSection() {
    return Container(
      key: _sectionKeys['projects'],
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      color: Colors.grey[50],
      child: Column(
        children: [
          Text(
            'আমার প্রোজেক্টসমূহ',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 50),
          Row(
            children: [
              Expanded(child: _buildProjectCard('E-commerce App', 'একটি সম্পূর্ণ অনলাইন শপিং অ্যাপ', Icons.shopping_cart)),
              SizedBox(width: 30),
              Expanded(child: _buildProjectCard('Weather App', 'রিয়েল-টাইম আবহাওয়ার তথ্য', Icons.wb_sunny)),
              SizedBox(width: 30),
              Expanded(child: _buildProjectCard('Chat App', 'রিয়েল-টাইম চ্যাট অ্যাপ্লিকেশন', Icons.chat)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(String title, String description, IconData icon) {
    return Container(
      height: 250,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 60, color: Colors.blue[700]),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 15),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpertiseSection() {
    return Container(
      key: _sectionKeys['expertise'],
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'আমার দক্ষতার ক্ষেত্রসমূহ',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 50),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    _buildExpertiseItem('Mobile Development', 0.9),
                    _buildExpertiseItem('Web Development', 0.8),
                    _buildExpertiseItem('UI/UX Design', 0.85),
                  ],
                ),
              ),
              SizedBox(width: 60),
              Expanded(
                child: Column(
                  children: [
                    _buildExpertiseItem('Firebase Integration', 0.88),
                    _buildExpertiseItem('API Integration', 0.92),
                    _buildExpertiseItem('State Management', 0.87),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExpertiseItem(String skill, double progress) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            skill,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 10),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[700]!),
            minHeight: 8,
          ),
          SizedBox(height: 5),
          Text(
            '${(progress * 100).toInt()}%',
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection() {
    return Container(
      key: _sectionKeys['contact'],
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue[700]!, Colors.blue[900]!],
        ),
      ),
      child: Column(
        children: [
          Text(
            'যোগাযোগ করুন',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildContactItem(Icons.email, 'Email', 'developer@example.com'),
              _buildContactItem(Icons.phone, 'Phone', '+880 1234567890'),
              _buildContactItem(Icons.location_on, 'Location', 'Dhaka, Bangladesh'),
            ],
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue[700],
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              'আমাকে বার্তা পাঠান',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String title, String value) {
    return Column(
      children: [
        Icon(icon, size: 50, color: Colors.white),
        SizedBox(height: 15),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
