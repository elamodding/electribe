# electribe – iPad-App (Capacitor)

Voraussetzungen (Mac): Xcode 15+, Node.js, CocoaPods (`brew install cocoapods`)

1. `cd electribe-app && npm install`
2. `cd ios/App && pod install && cd ../..`
3. `npx cap open ios`  → Xcode öffnet sich
4. In Xcode: Target "App" → Signing & Capabilities → dein Team wählen,
   ggf. Bundle Identifier ändern (aktuell de.elias.electribe)
5. iPad als Ziel wählen → ▶ Run

Web-Code ändern: Datei `www/index.html` bearbeiten, dann `npx cap sync ios`.
Für TestFlight/App Store: Product → Archive (Apple-Developer-Account nötig).
Hinweis: Web-MIDI gibt es im iOS-WebView nicht; MIDI bräuchte ein natives Plugin.

## Dauerhaft auf dem eigenen iPad (ohne App Store)
- Kostenlose Apple-ID: App läuft 7 Tage, danach in Xcode erneut "Run" (Daten bleiben erhalten).
- Apple Developer Program (99 $/Jahr): App läuft 1 Jahr, dann erneut Run.
- Vor jeder Neuinstallation in der App "Backup ⬇" ausführen (Datei landet in "Dateien").

## Ohne Mac / Sideloading
1. Projekt in ein GitHub-Repo hochladen (Ordnerinhalt inkl. .github).
2. Tab "Actions" → "Build unsigned IPA" → Run workflow → danach `electribe.ipa` unter Artifacts laden (zip entpacken).
3. IPA mit Sideloadly (Windows/Mac) oder AltStore/SideStore mit kostenloser Apple-ID aufs iPad installieren.
   AltStore/SideStore erneuern die 7-Tage-Signatur automatisch im Hintergrund.

## Intel-Mac / ohne Homebrew
Homebrew unterstützt Intel-Macs nicht mehr. Dann: GitHub-Cloud-Build (siehe oben).
Die Datei build-ipa-workflow.yml.txt enthält den Inhalt für .github/workflows/build-ipa.yml.

## MIDI zu FL Studio (Windows) per WLAN
1. PC: rtpMIDI (Tobias Erichsen) installieren, iPad im selben WLAN, Zugriff aufs lokale Netzwerk erlauben.
2. In rtpMIDI das iPad unter "Directory" wählen und "Connect" (sonst manuell: IP des iPads, Port 5004).
3. FL Studio: Options > MIDI Settings > Input: das rtpMIDI-Gerät aktivieren (Enable).
4. In der App: Menu/Enter > "MIDI Out (WLAN)" > Menu/Enter = AN. Part n sendet auf MIDI-Kanal n (Drums: Note 60).

## Neue Funktionen (Bedienung)
- **Shift** (einmal tippen, wirkt auf die nächste Aktion): Shift+Pad (Sequencer) = Last Step, Shift+Pad (Part Mute) = Solo, Shift+Write = Pattern kopieren, Shift+Exit = einfügen.
- **Amp EG**: AN = Gate (lange Hüllkurve), AUS = Decay. **MFX Hold**: hält Touchpad-Effekt nach dem Loslassen.
- **Master Fx** AN: Touchpad X = Effektanteil, Y = Feedback. Menü: *MFX Typ* (Reverb/Delay), *LFO Ziel* (Cutoff/Pan/Amp), *Pattern Länge*.
- **Accent**: Drum-Pad im Sequencer mehrfach tippen: an → Accent (gelb, lauter, MIDI-Velocity 127) → aus.
- Menü: *MFX Typ* jetzt Reverb/Delay/Filter/Crusher, *Part zufällig* füllt den Part mit zufälligem Pattern. Steps hinter dem Last Step erscheinen abgedunkelt.
- **Step-Rec**: Rec an, Sequencer gestoppt, dann in Trigger/Keyboard/Chord Pads spielen → Noten landen nacheinander auf Step 1, 2, 3 …
- Menü: *Metronom*, *Part kopieren/einfügen*, *Part rotieren* (1 Step nach rechts), *Pattern leeren*.
- **Undo**: Shift+Stop (oder Menü *Undo*) macht die letzten Pattern-Änderungen rückgängig (20 Schritte).
- **Chain**: Im Pattern-Set-Modus Shift+Pad fügt ein Pattern zur Kette hinzu; Menü *Chain* = AN spielt die Pattern nacheinander, *Chain leeren* setzt zurück.
- **Audio In**: Menü *Audio In* = AN nutzt das Mikrofon/Line-In, der Regler *Input Level* steuert die Lautstärke, Master Fx wirkt auf das Signal (Kopfhörer benutzen, sonst Rückkopplung).
- Samples: Menü *Sample Start* (0–90 %) und *Sample rückwärts*.
- Mehr Sounds: Synth-Parts haben 12 Oszillatoren (neu: Organ, Detune Sq, Noise Lead, Sync Saw), Drum-Parts 5 Varianten (neu: Deep, Bright). Auswahl per Oscillator-Regler.
- **Gate Arp** wirkt jetzt auch auf Drums (Ratchet: zweiter Schlag in der Step-Mitte).
- Menü: *Humanize* (zufälliger Timing-Versatz, 0–100) und *Transponieren* (±12 Halbtöne für Synth-Parts, pro Pattern).
- **Step-Anzeige im LCD**: 16 Mini-Steps zeigen Pattern, Playhead und Last Step.
- **Tastatur (PC/Windows-App)**: Leertaste = Play/Pause, Esc = Stop, ←/→ = Pattern/Part wechseln, Tasten 1–8 und Q–I = Pads 1–16.
- Menü *Gate Time* (5–100 %): kürzt die Notenlänge pro Part auf einen Teil des Steps. Das LCD zeigt zusätzlich den Namen des gewählten Parts.
