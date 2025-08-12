import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirecraftai/screens/home/JobSeeker/main/screens/resume_screen.dart';
import '../../../../../widgets/navbar/bottom_nav_bar.dart';
import '../../main/widgets/components/fab_buttons/fab_button_home.dart';
import '../services/template_service.dart';
import '../widgets/template_carousel.dart';
import '../widgets/search_bar.dart';
import '../widgets/premium_section.dart';
import '../widgets/template_filter.dart'; // Import the new filter options UI

class TemplateSelectionScreen extends StatefulWidget {
  const TemplateSelectionScreen({super.key});

  @override
  _TemplateSelectionScreenState createState() =>
      _TemplateSelectionScreenState();
}

class _TemplateSelectionScreenState extends State<TemplateSelectionScreen> {
  late Future<List<Map<String, dynamic>>> _templateFuture;
  final TemplateService _templateService = TemplateService();
  int _currentFreeIndex = 0;
  int _currentPremiumIndex = 0;
  int _currentATSIndex = 0;
  String _searchQuery = '';
  String _selectedCategory = 'All'; // Default filter: Show all templates

  @override
  void initState() {
    super.initState();
    _templateFuture = _templateService.fetchTemplates(); // Fetch templates on load
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select a Template",
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
            ),
            Text(
              "Choose Your Design",
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => ResumeBuilderScreen()),
              (Route<dynamic> route) => false,
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: _templateFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error loading templates: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              final templates = snapshot.data!;
              return _buildTemplateSections(context, templates);
            } else {
              return const Center(child: Text('No templates available.'));
            }
          },
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 1),
      floatingActionButton: const FABButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildTemplateSections(
    BuildContext context,
    List<Map<String, dynamic>> templates,
  ) {
    // Apply search & filter together
    final filteredTemplates = templates.where((template) {
      bool matchesSearch = template['name']
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()) ||
          template['category'].toLowerCase().contains(_searchQuery.toLowerCase());

      bool matchesCategory = _selectedCategory == 'All' ||
          template['category']
              .toLowerCase()
              .contains(_selectedCategory.toLowerCase());

      return matchesSearch && matchesCategory;
    }).toList();

    // Separate templates based on categories
    final freeTemplates = filteredTemplates
        .where((template) =>
            template['category'].toLowerCase().contains('free'))
        .toList();

    final premiumTemplates = filteredTemplates
        .where((template) =>
            template['category'].toLowerCase().contains('premium'))
        .toList();

    final atsTemplates = filteredTemplates
        .where((template) =>
            template['category'].toLowerCase().contains('ats'))
        .toList();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          CustomSearchBar(
            onSearchChanged: (query) => setState(() {
              _searchQuery = query;
            }),
          ),

          const SizedBox(height: 16),

          // Filter Options
          FilterOptions(
            selectedCategory: _selectedCategory,
            onCategorySelected: (category) {
              setState(() {
                _selectedCategory = category;
              });
            },
          ),

          const SizedBox(height: 20),

          // Banner Ad Placeholder
          Container(
            height: 60,
            width: double.infinity,
            alignment: Alignment.center,
            color: Colors.grey[200],
            child: Text(
              "Banner Ad Here",
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
            ),
          ),
          const SizedBox(height: 20),

          // Free Templates Carousel
          if (freeTemplates.isNotEmpty) ...[
            _sectionTitle("Free Templates"),
            const SizedBox(height: 16),
            TemplateCarousel(
              templates: freeTemplates,
              currentIndex: _currentFreeIndex,
              onPageChanged: (index) =>
                  setState(() => _currentFreeIndex = index),
            ),
            const SizedBox(height: 40),
          ],

          // Premium Section with Pricing
          if (premiumTemplates.isNotEmpty) ...[
            PremiumSection(
              templates: premiumTemplates,
              currentIndex: _currentPremiumIndex,
              onPageChanged: (index) =>
                  setState(() => _currentPremiumIndex = index),
            ),
            const SizedBox(height: 40),
          ],

          // ATS-Friendly Templates Carousel
          if (atsTemplates.isNotEmpty) ...[
            _sectionTitle("ATS-Friendly Templates"),
            const SizedBox(height: 16),
            TemplateCarousel(
              templates: atsTemplates,
              currentIndex: _currentATSIndex,
              onPageChanged: (index) =>
                  setState(() => _currentATSIndex = index),
            ),
            const SizedBox(height: 40),
          ],

          // No templates found message
          if (filteredTemplates.isEmpty) ...[
            const SizedBox(height: 20),
            Text(
              "No templates found for '$_searchQuery'",
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
            ),
          ],
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
