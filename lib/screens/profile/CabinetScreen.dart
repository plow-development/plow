import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plow/screens/profile/SettingsScreen.dart';
import 'package:plow/services/ColorService.dart';
import 'package:styled_widget/styled_widget.dart';

class CabinetScreen extends StatelessWidget {
  const CabinetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        InkWell(
            onTap: (){},
            child: UserCard()),
        SizedBox(
          height: 16.0,
        ),
        TeamCard(),
        SizedBox(
          height: 16.0,
        ),
        ActionsRow(context: context,),
      ],
    );
  }
}

class TeamCard extends StatelessWidget {
  Widget _buildUserRow() {
    return <Widget>[
      Icon(Icons.group)
          .decorated(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          )
          .constrained(height: 50, width: 50)
          .padding(right: 16),
      <Widget>[
        Text(
          'Плов',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Футбольная команда',
          style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 14,
              fontWeight: FontWeight.w300),
        ),
      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
    ].toRow();
  }

  Widget _buildUserStats() {
    return <Widget>[
      _buildUserStatsItem('6', 'мероприятий'),
      _buildUserStatsItem('5', 'побед'),
      _buildUserStatsItem('1', 'место в топе'),
    ]
        .toRow(mainAxisAlignment: MainAxisAlignment.spaceAround)
        .padding(vertical: 8);
  }

  Widget _buildUserStatsItem(String value, String text) => <Widget>[
        Text(value)
            .fontSize(22)
            .textColor(Colors.white)
            .fontWeight(FontWeight.w600)
            .padding(bottom: 4),
        Text(text)
            .fontWeight(FontWeight.w300)
            .textColor(Colors.white.withOpacity(0.6))
            .fontSize(12),
      ].toColumn();

  @override
  Widget build(BuildContext context) {
    return <Widget>[_buildUserRow(), _buildUserStats()]
        .toColumn(mainAxisAlignment: MainAxisAlignment.spaceAround)
        .padding(horizontal: 16, vertical: 8)
        .decorated(color: Colors.green, borderRadius: BorderRadius.circular(20))
        .elevation(
          5,
          shadowColor: ColorService().primaryColor,
          borderRadius: BorderRadius.circular(20),
        )
        .height(175)
        .alignment(Alignment.center);
  }
}

class UserCard extends StatelessWidget {
  Widget _buildUserRow() {
    return <Widget>[
      Icon(Icons.person)
          .decorated(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          )
          .constrained(height: 50, width: 50)
          .padding(right: 16),
      <Widget>[
        Text(
          'Владислав Осин',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Футбол, баскетбол',
          style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 14,
              fontWeight: FontWeight.w300),
        ),
      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
    ].toRow();
  }

  Widget _buildUserStats() {
    return <Widget>[
      _buildUserStatsItem('51', 'мероприятие'),
      _buildUserStatsItem('45', 'побед'),
      _buildUserStatsItem('2', 'место в топе'),
    ]
        .toRow(mainAxisAlignment: MainAxisAlignment.spaceAround)
        .padding(vertical: 8);
  }

  Widget _buildUserStatsItem(String value, String text) => <Widget>[
        Text(value)
            .fontSize(22)
            .textColor(Colors.white)
            .fontWeight(FontWeight.w600)
            .padding(bottom: 4),
        Text(text)
            .fontWeight(FontWeight.w300)
            .textColor(Colors.white.withOpacity(0.6))
            .fontSize(12),
      ].toColumn();

  @override
  Widget build(BuildContext context) {
    return <Widget>[_buildUserRow(), _buildUserStats()]
        .toColumn(mainAxisAlignment: MainAxisAlignment.spaceAround)
        .padding(horizontal: 16, vertical: 8)
        .decorated(
            color: ColorService().primaryColor,
            borderRadius: BorderRadius.circular(20))
        .elevation(
          5,
          shadowColor: ColorService().primaryColor,
          borderRadius: BorderRadius.circular(20),
        )
        .height(175)
        .alignment(Alignment.center);
  }
}

class ActionsRow extends StatelessWidget {
  final BuildContext context;
  const ActionsRow({Key? key, required this.context}) : super(key: key);

  Widget _buildActionItem(String name, IconData icon) {
    final Widget actionIcon = Icon(icon, size: 23, color: Color(0xFF42526F))
        .alignment(Alignment.center)
        .ripple()
        .constrained(width: 50, height: 50)
        .backgroundColor(Color(0xfff6f5f8))
        .clipOval()
        .padding(bottom: 5);

    final Widget actionText = Text(
      name,
      style: TextStyle(
        color: Colors.black.withOpacity(0.8),
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
    );

    return GestureDetector(
      onTap: () {
      },
      child: <Widget>[
        actionIcon,
        actionText,
      ].toColumn().padding(vertical: 20),
    );
  }

  @override
  Widget build(BuildContext context) => <Widget>[
    _buildActionItem('Профиль', Icons.person),
    _buildActionItem('Команда', Icons.group),
    _buildActionItem('Магазин', Icons.attach_money),
    _buildActionItem('Настройки', Icons.settings),
  ].toRow(mainAxisAlignment: MainAxisAlignment.spaceAround);
}
