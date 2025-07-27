# Claude Code Voice Integration

Add TTS functionality to your Claude Code development sessions with automatic voice feedback and EN/KO support.

## Features

- **Automatic Voice Feedback**: Hear Claude Code's responses spoken aloud when tasks complete
- **EN/KO Support**: Automatically detects Korean text and uses appropriate voices
- **Non-intrusive Logging**: All hook activity is logged for debugging

## Demo

https://github.com/user-attachments/assets/992d794d-ef4b-40c5-9a75-7a955ebd8aee

https://github.com/user-attachments/assets/492744b0-5ace-43f3-ab7c-be56bb725b21

## Prerequisites

- macOS (uses built-in `say` command)
- `jq` for JSON parsing: `brew install jq`
- Claude Code CLI

## Installation

1. Clone this repository:

   ```bash
   git clone <repository-url>
   cd claude-code-voice
   ```

2. Copy the `.claude` directory to your project:

   ```bash
   cp -r .claude /path/to/your/project/
   ```

3. Make scripts executable:
   ```bash
   chmod +x .claude/scripts/*.sh
   ```

## Usage

Once installed, the voice integration will automatically activate when using Claude Code in the directory containing the `.claude/settings.json` file.

### Voice Behavior

- **Assistant responses**: When Claude Code completes a task, the response is spoken using:
  - "Daniel" voice for English
  - "Yuna" voice for Korean (automatically detected)

### Customization

Edit `.claude/settings.json` to:

- Disable specific hooks by removing them
- Change voice settings by modifying the scripts
- Adjust logging behavior

### Troubleshooting

- Check logs at `~/.claude/hooks.log` for hook execution status
- Ensure `jq` is installed if scripts fail
- Verify script permissions if hooks don't execute

## How It Works

The integration uses Claude Code's hook system to:

1. Monitor transcript files for new messages
2. Extract relevant text content using `jq`
3. Detect language and select appropriate voice
4. Use macOS `say` command for text-to-speech output

## Contributing

This is a simple shell script-based project. To contribute:

1. Test changes with your Claude Code setup
2. Ensure scripts remain compatible with the hook system
3. Add appropriate error handling for edge cases

## References

- https://docs.anthropic.com/en/docs/claude-code/hooks
