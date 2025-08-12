import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../quick_action_icon/icon_quick_action.dart';

class ActionCarousel extends StatefulWidget {
  const ActionCarousel({super.key});

  @override
  _ActionCarouselState createState() => _ActionCarouselState();
}

class _ActionCarouselState extends State<ActionCarousel> {
  List<Map<String, dynamic>> actions = [
    {
      "label": "Edit",
      "icon": Icons.edit,
      "color": Colors.blue,
      "pinned": false,
    },
    {
      "label": "Preview",
      "icon": Icons.remove_red_eye,
      "color": Colors.green,
      "pinned": false,
    },
    {
      "label": "Download",
      "icon": Icons.download,
      "color": Colors.orange,
      "pinned": false,
    },
  ];

  int _currentIndex = 0;

  void _navigateToScreen(String actionLabel) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditScreen()),
    );
  }

  void _pinAction(int index) {
    setState(() {
      actions[index]["pinned"] = !(actions[index]["pinned"] ?? false);
      actions.sort(
        (a, b) => (b["pinned"] == true ? 1 : 0).compareTo(
          a["pinned"] == true ? 1 : 0,
        ),
      );
    });
  }

  void _showActionOptions(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, -2),
                blurRadius: 8,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar for the bottom sheet
              Container(
                height: 4,
                width: 40,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              // Row with two large buttons: Pin/Unpin and Delete
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Pin/Unpin Action
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      _pinAction(index);
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.push_pin,
                            size: 48,
                            color:
                                actions[index]["pinned"] == true
                                    ? Colors.blue
                                    : Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          actions[index]["pinned"] == true ? "Unpin" : "Pin",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Delete Action
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        actions.removeAt(index);
                      });
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.red[100],
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.delete,
                            size: 48,
                            color: Colors.redAccent,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Delete",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ), // Add space between buttons and bottom
            ],
          ),
        );
      },
    );
  }

  void _addAction() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        List<Map<String, dynamic>> availableActions = [
          {"label": "Share", "icon": Icons.share, "color": Colors.purple},
          {"label": "Print", "icon": Icons.print, "color": Colors.red},
          {"label": "Save", "icon": Icons.save, "color": Colors.teal},
          {"label": "Edit", "icon": Icons.edit, "color": Colors.blue},
          {
            "label": "Preview",
            "icon": Icons.remove_red_eye,
            "color": Colors.green,
          },
          {"label": "Download", "icon": Icons.download, "color": Colors.orange},
          {"label": "Delete", "icon": Icons.delete, "color": Colors.redAccent},
          {"label": "Upload", "icon": Icons.cloud_upload, "color": Colors.cyan},
          {"label": "Settings", "icon": Icons.settings, "color": Colors.grey},
          {"label": "History", "icon": Icons.history, "color": Colors.indigo},
        ];

        // 🔥 Corrected Sorting: Unselected first, keep internal order
        availableActions.sort((a, b) {
          bool aSelected = actions.any(
            (action) => action["label"] == a["label"],
          );
          bool bSelected = actions.any(
            (action) => action["label"] == b["label"],
          );

          if (!aSelected && bSelected) return -1; // Unselected first
          if (aSelected && !bSelected) return 1; // Selected last
          return 0; // Maintain order within groups
        });

        double screenWidth = MediaQuery.of(context).size.width;
        double actionSize =
            screenWidth > 400 ? 70 : 60; // Adjust for responsiveness

        return Container(
          padding: const EdgeInsets.only(top: 20, bottom: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // --- Top Drag Handle ---
              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 15),

              // --- Title ---
              const Text(
                "Resume Actions",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // --- Actions Carousel ---
              SizedBox(
                height: actionSize + 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: availableActions.length,
                  itemBuilder: (context, index) {
                    var action = availableActions[index];
                    bool alreadyAdded = actions.any(
                      (a) => a["label"] == action["label"],
                    );

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 10),

                          GestureDetector(
                            onTap:
                                alreadyAdded
                                    ? null
                                    : () {
                                      setState(() {
                                        actions.add(action);
                                      });
                                      Navigator.pop(context);
                                    },
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 250),
                                curve: Curves.easeInOut,
                                width: actionSize,
                                height: actionSize,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      alreadyAdded
                                          ? Colors.grey[300]
                                          : action["color"],
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  action["icon"],
                                  color: Colors.white,
                                  size: actionSize * 0.5,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 12),

                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: actionSize + 10,
                            ),
                            child: Text(
                              action["label"],
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: screenWidth > 400 ? 14 : 12,
                                color:
                                    alreadyAdded
                                        ? Colors.grey[600]
                                        : Colors.black,
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardSize = (screenWidth - 64) / 3;

    return Column(
      children: [
        // **Carousel Container with Background**
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.grey[200], // 🔹 Background color added
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              // **Actions Carousel**
              CarouselSlider.builder(
                itemCount: (actions.length / 3).ceil() + 1,
                itemBuilder: (context, index, realIndex) {
                  if (index == (actions.length / 3).ceil()) {
                    return _buildAddButton(cardSize);
                  }

                  List<Map<String, dynamic>> group =
                      actions.skip(index * 3).take(3).toList();
                  return _buildActionRow(group, cardSize);
                },
                options: CarouselOptions(
                  height: cardSize + 50,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),

              // **Three-dot Indicator** (Added)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  (actions.length / 3).ceil() + 1,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentIndex == index ? 12 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentIndex == index ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionRow(List<Map<String, dynamic>> group, double cardSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:
          group.map((action) {
            int actionIndex = actions.indexOf(action);
            bool isPinned = action["pinned"] == true;

            return GestureDetector(
              onTap: () => _navigateToScreen(action["label"]),
              onLongPress: () => _showActionOptions(context, actionIndex),
              child: SizedBox(
                width: cardSize,
                height: cardSize,
                child: ActionCard(
                  label: action["label"],
                  icon: action["icon"],
                  color:
                      isPinned
                          ? Colors.red[300]
                          : action["color"], // Slightly red background if pinned
                  onTap: () => _navigateToScreen(action["label"]),
                ),
              ),
            );
          }).toList(),
    );
  }

  Widget _buildAddButton(double cardSize) {
    return Center(
      child: GestureDetector(
        onTap: _addAction,
        child: Container(
          width: cardSize * 0.8,
          height: cardSize * 0.8,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.add, color: Colors.black, size: 40),
        ),
      ),
    );
  }
}

class EditScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Screen")),
      body: Center(child: Text("This is the Edit Screen")),
    );
  }
}
