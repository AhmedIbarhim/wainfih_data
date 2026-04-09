import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wainfih_data/core/extentions/screen_util.dart';

import '../../../core/di/service_locator.dart';
import '../../../core/offline/submission_queue.dart';
import '../../../core/route/routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../generated/l10n.dart';
import '../../adding_new_provider/presentation/widgets/home_action_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with WidgetsBindingObserver {
  int _pendingCount = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _refreshQueueCount();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _refreshQueueCount();
    }
  }

  Future<void> _refreshQueueCount() async {
    final count = await locator<SubmissionQueue>().pendingCount;
    if (mounted) {
      setState(() => _pendingCount = count);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = S.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _buildHeader(context, l),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(20.toRadius),
              mainAxisSpacing: 20.toWidth,
              crossAxisSpacing: 20.toHeight,
              children: [
                HomeActionCard(
                  title: l.addProviderAction,
                  icon: Icons.person_add_rounded,
                  color: Colors.blue,
                  onTap: () async {
                    await Navigator.of(context).pushNamed(Routes.addProvider);
                    _refreshQueueCount();
                  },
                ),
                HomeActionCard(
                  title: l.viewProvidersAction,
                  icon: Icons.list_alt_rounded,
                  color: Colors.orange,
                  onTap: () =>
                      Navigator.of(context).pushNamed(Routes.myProviders),
                ),
                _QueueActionCard(
                  pendingCount: _pendingCount,
                  onTap: () async {
                    await Navigator.of(context).pushNamed(Routes.queue);
                    _refreshQueueCount();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, S l) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 20.toHeight,
        bottom: 30.toHeight,
        left: 20.toWidth,
        right: 20.toWidth,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryColor, AppColors.primaryLightColor],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Spacer()],
          ),
          SizedBox(height: 20.toHeight),
          CircleAvatar(
            radius: 100.toRadius,
            backgroundColor: Colors.white24,
            child: Padding(
              padding: EdgeInsets.all(16.toRadius),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(150.toRadius),
                child: Image.asset(
                  "assets/images/app_icon.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            l.homeWelcomeTitle,
            style: AppTextStyles.bold19.copyWith(color: Colors.white),
          ),
          SizedBox(height: 4.h),
          Text(
            l.homeWelcomeSubtitle,
            style: AppTextStyles.regular13.copyWith(
              color: Colors.white.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }
}

class _QueueActionCard extends StatelessWidget {
  const _QueueActionCard({
    required this.pendingCount,
    required this.onTap,
  });

  final int pendingCount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l = S.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(12.toRadius),
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.cloud_upload_outlined,
                      color: Colors.green,
                      size: 32.toRadius,
                    ),
                  ),
                  SizedBox(height: 12.toHeight),
                  Text(
                    l.queueTitle,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bold13.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            if (pendingCount > 0)
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.errorColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '$pendingCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
