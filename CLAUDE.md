# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Claude Code voice integration project that provides text-to-speech functionality for Claude Code interactions. The repository contains Claude Code hooks and scripts that enable voice feedback during development sessions.

## Voice Integration Features

The project implements voice feedback through macOS `say` command with:
- **Multilingual support**: Automatically detects Korean text (Hangul) and uses "Yuna" voice, defaults to "Daniel" voice for other languages
- **Assistant responses**: Spoken feedback when Claude Code completes tasks (Stop hook)
- **User input echo**: Spoken repetition of user prompts (UserPromptSubmit hook)

## Hook Configuration

The `.claude/settings.json` file configures hooks that trigger voice feedback:
- **Stop hook**: Triggers `assistant-say.sh` when Claude Code completes responses
- **UserPromptSubmit hook**: Triggers `user-say.sh` when users submit prompts
- **Logging**: All hooks log activity to `~/.claude/hooks.log`

## Script Architecture

- **assistant-say.sh**: Extracts and speaks the latest assistant message from transcripts
- **user-say.sh**: Extracts and speaks the latest user message from transcripts
- Both scripts parse JSON transcripts using `jq` and handle language detection

## Development Notes

- No package.json or build system detected - this appears to be a shell script-based project
- Scripts depend on `jq` for JSON parsing and macOS `say` command for text-to-speech
- Hook system integrates with Claude Code's transcript functionality to provide contextual voice feedback