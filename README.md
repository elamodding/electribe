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
