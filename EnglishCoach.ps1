# ============================
# EnglishCoach.ps1
# ============================

# ---------------------------
# Paths and Dates
# ---------------------------
$BASEFOLDER = "D:\EnglishCoach"
$YEAR = (Get-Date).ToString("yyyy")
$MONTH = (Get-Date).ToString("MM")
$DAY = (Get-Date).ToString("dd")
$TODAYFOLDER = Join-Path $BASEFOLDER "$YEAR\$MONTH\$DAY"
$LASTRUNFILE = Join-Path $BASEFOLDER "english_last_run.txt"

# Create folder if it doesn't exist
if (-not (Test-Path $TODAYFOLDER)) { New-Item -ItemType Directory -Path $TODAYFOLDER | Out-Null }

# Read last run
if (Test-Path $LASTRUNFILE) { $lastRun = Get-Content $LASTRUNFILE } else { $lastRun = "00000000" }
$currentDate = "$YEAR$MONTH$DAY"

# ---------------------------
# Function to run Ollama and log
# ---------------------------
function Run-Ollama($prompt) {
    try {
        $prompt | ollama run phi3 | Tee-Object -FilePath "$TODAYFOLDER\log.txt"
    }
    catch {
        Write-Host "`n[Error running Ollama]: $_`n"
        Read-Host "Press Enter to continue..."
    }
}

# ---------------------------
# Helper for clean output
# ---------------------------
function Write-Section($title, $content) {
    Write-Host "`n==================== $title ====================" -ForegroundColor Cyan
    Write-Host $content
    Write-Host "================================================`n" -ForegroundColor Cyan
}

# ---------------------------
# First run of the day
# ---------------------------
if ($lastRun -ne $currentDate) {

    $dailyMessage = @"
Welcome to your personalized language learning session! 
I'm thrilled to have you here as we embark on this journey towards mastery in English.

Word of the Day: 'Serendipity'
Meaning: The occurrence and development of events according to chance in a happy or beneficial way.
Example: Finding hidden treasures along your path towards fluency unexpectedly.

Thought of the Day:
Language is not just about communication but also an expression of culture and identity.
Each phrase or idiom carries its origin story – a way to connect with others on deeper levels.

Tip for Today:
Practice active listening when conversing in English.
By fully engaging with what someone says before responding thoughtfully, you enhance comprehension and show respect and empathy.
"@

    Write-Section "Daily Routine" $dailyMessage

    # Update last run file
    Set-Content -Path $LASTRUNFILE -Value $currentDate

    Read-Host "Press Enter to continue to normal conversation..."
}

# ---------------------------
# Initialize Ollama session (system prompt)
# ---------------------------
Write-Section "English Coach" "Normal Conversation Mode:`nYou can now interact with your English Coach. Focus is on grammar, spelling, sentence improvement, professional and casual English."

$systemPrompt = '/set system "You are my English Coach. Focus ONLY on grammar, spelling, sentence improvements, professional and casual English. Keep responses concise. Do not provide unrelated information."'
Run-Ollama $systemPrompt

# ---------------------------
# Interactive conversation loop
# ---------------------------
do {
    $userInput = Read-Host "Your message (type 'exit' to quit)"
    if ($userInput -ne "exit" -and $userInput.Trim() -ne "") {
        Run-Ollama $userInput
    }
} while ($userInput -ne "exit")

Write-Host "`nSession ended. All interactions logged in $TODAYFOLDER\log.txt"
Read-Host "Press Enter to exit..."
