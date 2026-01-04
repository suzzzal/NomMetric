import 'package:flutter/material.dart';

class HomeScreenSujal extends StatelessWidget {
  const HomeScreenSujal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _GreetingBanner(),
              SizedBox(height: 20),
              _MealsHeader(),
              SizedBox(height: 12),

              _BreakfastCard(),
              SizedBox(height: 14),

              _SimpleMealCard(
                title: "Lunch",
                time: "12:30 PM",
                kcal: "650 kcal",
                items: [
                  "Paneer",
                  "Dal Makhani",
                  "Bhaji Rice",
                  "Roti",
                ],
              ),
              SizedBox(height: 14),

              _SimpleMealCard(
                title: "Snack",
                time: "3:00 PM",
                kcal: "200 kcal",
                items: [
                  "Protein Bar",
                  "Sandwich",
                ],
              ),
              SizedBox(height: 14),

              _SimpleMealCard(
                title: "Dinner",
                time: "7:00 PM",
                kcal: "700 kcal",
                items: [
                  "Chole Bhature",
                  "Raita",
                  "Mango Juice",
                ],
              ),

              SizedBox(height: 28),
              _UpdatesSection(),
            ],
          ),
        ),
      ),
    );
  }
}

/* ================= GREETING ================= */

class _GreetingBanner extends StatelessWidget {
  const _GreetingBanner();

  String _greeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return "Good Morning";
    if (hour < 17) return "Good Afternoon";
    return "Good Evening";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7ED),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFFED7AA)),
      ),
      child: Row(
        children: [
          const Icon(Icons.wb_sunny_outlined,
              color: Colors.deepOrange, size: 28),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${_greeting()}, User",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Here’s your meal plan and updates for today",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/* ================= MEALS ================= */

class _MealsHeader extends StatelessWidget {
  const _MealsHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "Today's Meals",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        Text(
          "View All",
          style: TextStyle(
            color: Colors.deepOrange,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

/* ================= BREAKFAST ================= */

class _BreakfastCard extends StatelessWidget {
  const _BreakfastCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFFDF3),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFB7EFC5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _MealTopRow(
            title: "Breakfast",
            time: "8:00 AM",
            kcal: "450 kcal",
            iconBg: Color(0xFFD1FAE5),
          ),
          SizedBox(height: 12),
          Text("• Poha"),
          Text("• Dudh"),
          Text("• Egg"),
        ],
      ),
    );
  }
}

/* ================= LUNCH / SNACK / DINNER ================= */

class _SimpleMealCard extends StatelessWidget {
  final String title;
  final String time;
  final String kcal;
  final List<String> items;

  const _SimpleMealCard({
    required this.title,
    required this.time,
    required this.kcal,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MealTopRow(
            title: title,
            time: time,
            kcal: kcal,
            iconBg: const Color(0xFFFFEDD5),
          ),
          const SizedBox(height: 12),
          ...items.map((item) => Text("• $item")).toList(),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
              ),
              onPressed: () {},
              child: const Text(
                "Log Meal",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* ================= COMMON HEADER ================= */

class _MealTopRow extends StatelessWidget {
  final String title;
  final String time;
  final String kcal;
  final Color iconBg;

  const _MealTopRow({
    required this.title,
    required this.time,
    required this.kcal,
    required this.iconBg,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: iconBg,
          child: const Icon(Icons.restaurant,
              size: 18, color: Colors.deepOrange),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.schedule, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Text(time, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            const Icon(Icons.local_fire_department,
                size: 16, color: Colors.red),
            const SizedBox(width: 4),
            Text(
              kcal,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}

/* ================= UPDATES ================= */

class _UpdatesSection extends StatelessWidget {
  const _UpdatesSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Updates",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 12),
        _UpdateCard(
          title: "Lunch Time!",
          subtitle: "Don't forget to log your lunch meal",
          time: "30m ago",
          color: Color(0xFFEFF6FF),
          icon: Icons.notifications,
        ),
        SizedBox(height: 10),
        _UpdateCard(
          title: "3-Day Streak 🎉",
          subtitle: "You've logged meals for 3 days straight",
          time: "2h ago",
          color: Color(0xFFFFFBEB),
          icon: Icons.emoji_events,
        ),
        SizedBox(height: 10),
        _UpdateCard(
          title: "Weekly Insight",
          subtitle: "You're averaging 2000 kcal/day this week",
          time: "1d ago",
          color: Color(0xFFF5F3FF),
          icon: Icons.trending_up,
        ),
      ],
    );
  }
}

class _UpdateCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final Color color;
  final IconData icon;

  const _UpdateCard({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                        const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Text(time,
              style:
                  const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}
