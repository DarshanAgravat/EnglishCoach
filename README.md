# EnglishCoach

A simple, personalized English language learning assistant powered by Ollama and designed to run on Windows using PowerShell and batch scripts.

---

## Features

- **Daily Routine**: Get a motivational message, word of the day, thought, and tip every time you start.
- **Conversation Logging**: All interactions are logged daily for review.
- **Grammar and Sentence Help**: Focus on grammar, spelling, sentence improvement, and both professional/casual English.
- **Easy Launch**: Start the coach with a single double-click.
- **No Unrelated Info**: Responses stick strictly to English improvement.

---

## How It Works

1. **Startup**  
   - Run `EnglishCoachLauncher.bat` to start the program.
   - Opens PowerShell and runs `EnglishCoach.ps1`.

2. **Daily Message**  
   - On first launch each day, you get a motivational message, word of the day, tip, and thought.

3. **Normal Conversation Mode**  
   - After the daily message, you can chat with your English Coach.
   - Type your message and get concise, focused responses.

4. **Logging**  
   - Every conversation is saved in a daily log file for future reference.

5. **Exit**  
   - Type `exit` to end the session.

---

## File Structure

- `EnglishCoach.ps1` – Main PowerShell script for the coach logic and conversation.
- `EnglishCoachLauncher.bat` – Batch file to easily launch the PowerShell script.
- `.gitignore` – Only `.ps1`, `.bat`, and `.gitignore` files are tracked.

---

## Requirements

- **Windows OS**
- **PowerShell (with permission to run scripts)**
- **Ollama installed and available in your PATH**

---

## Quick Start

1. Place all files in `D:\EnglishCoach` or update the path inside scripts.
2. Double-click `EnglishCoachLauncher.bat` to launch.
3. Enjoy learning and improving your English!

---

## Customization

- Change the base folder or daily message in `EnglishCoach.ps1` as needed.
- Add your own tips, words, or routines to personalize.

---

## License

MIT License (add your own if needed)
