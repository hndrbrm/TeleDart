/*
 * TeleDart - Telegram Bot API for Dart
 * Copyright (C) 2020  Dino PH Leung
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

part of '../model.dart';

/// This object represents a bot command.
///
/// https://core.telegram.org/bots/api#botcommand
@JsonSerializable(fieldRename: FieldRename.snake)
class BotCommand {
  BotCommand({
    required this.command,
    required this.description,
  })
  : assert(command.isNotEmpty, 'Command cannot be empty'),
    assert(command.length <= 32, 'Command cannot exceed 32 characters'),
    assert(
      command.replaceAll(RegExp(r'^[a-z0-9_]+$'), '').isEmpty,
      'Command `$command` can only contain lowercase, digit and underscore',
    ),
    assert(description.isNotEmpty, 'Description cannot be empty'),
    assert(description.length <= 256, 'Description cannot exceed 256 characters');
  
  final String command;
  final String description;

  factory BotCommand.fromJson(Map<String, dynamic> json) => _$BotCommandFromJson(json);

  Map<String, dynamic> toJson() => _$BotCommandToJson(this);
}
