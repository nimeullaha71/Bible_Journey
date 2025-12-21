import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../app/constants.dart';
import '../../../widgets/appbars/custom_appbar.dart';
import '../models/notification_model.dart';
import '../services/notification_service.dart';
import '../widgets/custom_notification.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late Future<Map<String, List<NotificationModel>>> _future;

  List<NotificationModel> _today = [];
  List<NotificationModel> _yesterday = [];

  @override
  void initState() {
    super.initState();
    _future = _loadNotifications();
  }

  Future<Map<String, List<NotificationModel>>> _loadNotifications() async {
    final data = await NotificationService.fetchNotifications();
    _today = data['today'] ?? [];
    _yesterday = data['yesterday'] ?? [];
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(
        title: "notification".tr(),
        onTap: () => Navigator.pop(context),
      ),
      body: FutureBuilder<Map<String, List<NotificationModel>>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            debugPrint("❌ Notification Error: ${snapshot.error}");
            return _errorWidget(snapshot.error);
          }

          if (_today.isEmpty && _yesterday.isEmpty) {
            return const Center(
              child: Text(
                "No notifications yet",
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return ListView(
            children: [
              if (_today.isNotEmpty)
                _sectionTitleWithClear("today".tr(), onClear: _clearAll),
              ..._today.map(_buildNotification).toList(),

              if (_yesterday.isNotEmpty)
                const Divider(thickness: 2, color: Color(0xffE3E9E3)),

              if (_yesterday.isNotEmpty)
                _sectionTitle("yesterday".tr()),

              ..._yesterday.map(_buildNotification).toList(),
            ],
          );
        },
      ),
    );
  }

  Widget _sectionTitleWithClear(String title, {required VoidCallback onClear}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 24, color: Colors.black87)),
          TextButton(
            onPressed: onClear,
            child: Text(
              "clear_all".tr(),
              style: const TextStyle(fontSize: 16, color: Color(0xff83BF8B)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 12),
      child: Text(title, style: const TextStyle(fontSize: 24, color: Colors.black87)),
    );
  }

  Widget _buildNotification(NotificationModel n) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: () async {
          if (!n.isRead) {
            try {
              await NotificationService.markAsRead(n.id);
              setState(() {
                n.isRead = true;
              });
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Failed to mark as read")),
              );
            }
          }
        },
        child: CustomNotification(
          title: n.title,
          subtitle: n.message,
          image: _getIcon(n.type),
          timeAgo: _timeAgo(n.createdAt),
          isRead: n.isRead,
        ),
      ),
    );
  }

  void _clearAll() async {
    try {
      await NotificationService.clearAll();
      setState(() {
        _today.forEach((n) => n.isRead = true);
        _yesterday.forEach((n) => n.isRead = true);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All notifications marked as read")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to clear notifications")),
      );
    }
  }

  String _getIcon(String type) {
    switch (type) {
      case 'journey':
      case 'daily':
        return "assets/images/jo.svg";
      default:
        return "assets/images/jo.svg";
    }
  }

  String _timeAgo(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inMinutes < 1) return "just now";
    if (diff.inMinutes < 60) return "${diff.inMinutes}m ago";
    if (diff.inHours < 24) return "${diff.inHours}h ago";
    return "${diff.inDays}d ago";
  }

  Widget _errorWidget(Object? error) {
    final message = error.toString().contains("Unauthorized")
        ? "Session expired. Please login again."
        : "Failed to load notifications";

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 12),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              setState(() {
                _future = _loadNotifications();
              });
            },
            child: const Text("Retry"),
          ),
        ],
      ),
    );
  }
}


