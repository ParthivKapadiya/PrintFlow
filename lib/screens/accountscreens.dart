import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:printflow/resources/colorsresource.dart';
import 'package:printflow/resources/textplaceholder.dart';
import 'package:printflow/widgets/commonwidgets.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key, required this.back});

  final VoidCallback back;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Column(
          children: [
            PageTop(notificationstitle, back),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  _Note(note1title, note1body, note1time),
                  _Note(note2title, note2body, note2time),
                  _Note(note3title, note3body, note3time),
                  _Note(note4title, note4body, note4time),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _Mini(Icons.home, hometab),
                  _Mini(Icons.grid_view, catetab),
                  _Mini(Icons.receipt_long, orderstab),
                  _Mini(Icons.palette_outlined, designstab),
                  _Mini(Icons.person_outline, profiletab),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Note extends StatelessWidget {
  const _Note(this.title, this.body, this.time);

  final String title;
  final String body;
  final String time;

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: fieldcolor,
            child: Icon(Icons.notifications_none, color: textcolor),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
                Text(body, style: const TextStyle(color: hintcolor, fontSize: 13)),
                const SizedBox(height: 4),
                Text(time, style: const TextStyle(color: hintcolor, fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: hintcolor),
        ],
      ),
    );
  }
}

class _Mini extends StatelessWidget {
  const _Mini(this.icon, this.name);

  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: hintcolor, size: 20),
        Text(name, style: const TextStyle(fontSize: 11, color: hintcolor)),
      ],
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.back, required this.next});

  final VoidCallback back;
  final VoidCallback next;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            PageTop(profiletitle, back),
            WhiteCard(
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Color(0xFF7EC8F3),
                    child: Text(userinitials, style: TextStyle(color: whitecolor, fontWeight: FontWeight.w800)),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(username, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                      Text(userphone, style: TextStyle(color: hintcolor, fontSize: 12)),
                      Text(useremail, style: TextStyle(color: hintcolor, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
            const _Menu(Icons.person_outline, editprofile),
            const _Menu(Icons.lock_outline, changepassword),
            const _Menu(Icons.support_agent, helpsupport),
            const _Menu(Icons.location_on_outlined, addresstext),
            const _Menu(Icons.settings, settingstitle),
            const SizedBox(height: 8),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: redcolor,
                  foregroundColor: whitecolor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                ),
                onPressed: next,
                icon: const Icon(Icons.logout),
                label: const Text(logouttext, style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu(this.icon, this.title);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      color: whitecolor,
      child: ListTile(
        leading: Icon(icon, color: textcolor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, required this.back});

  final VoidCallback back;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkmode = false;
  bool notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            PageTop(settingstitle, widget.back),
            _tile(Icons.nightlight_round, darkmodetext, CupertinoSwitch(
              value: darkmode,
              activeTrackColor: switchoncolor,
              onChanged: (v) => setState(() => darkmode = v),
            )),
            _tile(Icons.language, languagetext, const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(languagename, style: TextStyle(color: hintcolor)),
                Icon(Icons.chevron_right, color: hintcolor),
              ],
            )),
            _tile(Icons.notifications_none, notificationstext, CupertinoSwitch(
              value: notifications,
              activeTrackColor: switchoncolor,
              onChanged: (v) => setState(() => notifications = v),
            )),
            _tile(Icons.shield_outlined, privacytext, const Icon(Icons.chevron_right, color: hintcolor)),
            _tile(Icons.description_outlined, termstext, const Icon(Icons.chevron_right, color: hintcolor)),
            _tile(Icons.info_outline, versiontext, const Text(versionvalue, style: TextStyle(color: hintcolor))),
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: whitecolor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE8E8E8)),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout, color: redcolor),
                  SizedBox(width: 8),
                  Text(logouttext, style: TextStyle(color: redcolor, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tile(IconData icon, String title, Widget end) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: whitecolor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE8E8E8)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 22),
          const SizedBox(width: 12),
          Text(title, style: const TextStyle(fontSize: 16)),
          const Spacer(),
          end,
        ],
      ),
    );
  }
}

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key, required this.back, required this.next});

  final VoidCallback back;
  final VoidCallback next;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            PageTop(helptitle, back),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(helpline, style: TextStyle(color: hintcolor)),
            ),
            const SizedBox(height: 10),
            const _HelpRow(Icons.call, callsupport, supportphone),
            const _HelpRow(Icons.chat_bubble_outline, whatsapptitle, whatsappbody),
            const _HelpRow(Icons.mail_outline, emailtitle, supportemail),
            const _HelpRow(Icons.help_outline, faqtitle, faqbody),
            const _HelpRow(Icons.info_outline, aboutapp, aboutversion),
            const SizedBox(height: 8),
            const Icon(Icons.headset_mic_outlined, color: hintcolor),
            const Text(needhelp, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700)),
            const Text(helpbody, textAlign: TextAlign.center, style: TextStyle(color: hintcolor, fontSize: 12)),
            const SizedBox(height: 10),
            SizedBox(
              height: 48,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: purplecolor,
                  foregroundColor: whitecolor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: next,
                icon: const Icon(Icons.headset_mic),
                label: const Text(contactsupport),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HelpRow extends StatelessWidget {
  const _HelpRow(this.icon, this.title, this.sub);

  final IconData icon;
  final String title;
  final String sub;

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      child: Row(
        children: [
          Icon(icon, color: textcolor),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
              Text(sub, style: const TextStyle(color: hintcolor, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
