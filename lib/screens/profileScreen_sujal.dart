import 'package:flutter/material.dart';

class ProfileScreenSujal extends StatelessWidget {
  const ProfileScreenSujal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Color(0xFF111827),
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF111827)),
      ),
      body: Column(
        children: const [
          SizedBox(height: 24),
          _ProfileHeader(),
          SizedBox(height: 32),
          _ProfileOptions(),
        ],
      ),
    );
  }
}

/* ================= PROFILE HEADER ================= */

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CircleAvatar(
          radius: 50,
          backgroundColor: Color(0xFFEFF6FF),
          child: Icon(
            Icons.person,
            size: 50,
            color: Color(0xFF2563EB),
          ),
        ),
        SizedBox(height: 14),
        Text(
          "User Name",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF111827),
          ),
        ),
        SizedBox(height: 4),
        Text(
          "user@email.com",
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF6B7280),
          ),
        ),
      ],
    );
  }
}

/* ================= OPTIONS ================= */

class _ProfileOptions extends StatelessWidget {
  const _ProfileOptions();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: const [
          _OptionTile(
            icon: Icons.edit,
            title: "Edit Profile",
            color: Color(0xFF2563EB),
          ),
          SizedBox(height: 10),
          _OptionTile(
            icon: Icons.settings,
            title: "Settings",
            color: Color(0xFF4B5563),
          ),
          SizedBox(height: 10),
          _OptionTile(
            icon: Icons.support_agent,
            title: "Contact Us",
            subtitle: "Help & Support",
            color: Color(0xFF059669),
          ),
          SizedBox(height: 10),
          _OptionTile(
            icon: Icons.feedback_outlined,
            title: "Feedback",
            subtitle: "Share your thoughts",
            color: Color(0xFFF59E0B),
          ),
          SizedBox(height: 10),
          _OptionTile(
            icon: Icons.logout,
            title: "Logout",
            color: Colors.red,
            isDestructive: true,
          ),
        ],
      ),
    );
  }
}

/* ================= OPTION TILE ================= */

class _OptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Color color;
  final bool isDestructive;

  const _OptionTile({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.color,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 18,
          backgroundColor: color.withOpacity(0.12),
          child: Icon(
            icon,
            size: 20,
            color: color,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isDestructive ? Colors.red : const Color(0xFF111827),
          ),
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle!,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF6B7280),
                ),
              )
            : null,
        trailing: const Icon(
          Icons.chevron_right,
          color: Color(0xFF9CA3AF),
        ),
        onTap: () {},
      ),
    );
  }
}
