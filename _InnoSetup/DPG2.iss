; DPG 2 Setup Script for InnoSetup
; by Daniel Marschall

; Shut-Down Game?!

[Setup]
AppName=Der Panzergeneral II
AppVerName=Der Panzergeneral II 1.5
AppVersion=1.5d
AppCopyright=� Copyright 2000 - 2005 MD-Technologie
AppPublisher=ViaThinkSoft
AppPublisherURL=https://www.viathinksoft.de/
AppSupportURL=https://www.md-technologie.de/
AppUpdatesURL=https://www.viathinksoft.de/
DefaultDirName={autopf}\Der Panzergeneral 2
DefaultGroupName=Der Panzergeneral 2
VersionInfoCompany=ViaThinkSoft
VersionInfoCopyright=� Copyright 2000 - 2005 MD-Technologie
VersionInfoDescription=Der Panzergeneral II 1.5 Setup
VersionInfoTextVersion=1.0.0.0
VersionInfoVersion=1.5
OutputBaseFilename=DPG2_Setup
OutputDir=.
; Configure Sign Tool in InnoSetup at "Tools => Configure Sign Tools" (adjust the path to your SVN repository location)
; Name    = sign_single   
; Command = "C:\SVN\...\sign_single.bat" $f
SignTool=sign_single
SignedUninstaller=yes

[Languages]
Name: de; MessagesFile: "compiler:Languages\German.isl"

[LangOptions]
LanguageName=Deutsch
LanguageID=$0407

;[Tasks]
;Name: "desktopicon"; Description: "Erstelle eine Verkn�pfung auf dem &Desktop"; GroupDescription: "Programmverkn�pfungen:"; MinVersion: 4,4

[Files]
Source: "..\DPG2.exe"; DestDir: "{app}"; Flags: ignoreversion signonce
Source: "..\Hilfe.exe"; DestDir: "{app}"; Flags: ignoreversion signonce
Source: "..\Bilder\*.bmp"; DestDir: "{app}\Bilder"; Flags: ignoreversion
Source: "..\DirectX\Audio.dxw"; DestDir: "{app}\DirectX"; Flags: ignoreversion
Source: "..\DirectX\Grafik.dxg"; DestDir: "{app}\DirectX"; Flags: ignoreversion
Source: "..\Musik\*.mid"; DestDir: "{app}\Musik"; Flags: ignoreversion
Source: "..\Musik\Tracks.ini"; DestDir: "{app}\Musik"; Flags: ignoreversion
Source: "..\Texte\*.txt"; DestDir: "{app}\Texte"; Flags: ignoreversion
Source: "..\DPG2 Hilfe\*.jpg"; DestDir: "{app}\DPG2 Hilfe"; Flags: ignoreversion
Source: "..\DPG2 Hilfe\*.htm"; DestDir: "{app}\DPG2 Hilfe"; Flags: ignoreversion
Source: "..\DPG2 Hilfe\*.css"; DestDir: "{app}\DPG2 Hilfe"; Flags: ignoreversion

;[Folders]
;Name: "{group}\Webseiten"

[Icons]
;Name: "{group}\Webseiten\Daniel Marschalls Webportal"; Filename: "https://www.daniel-marschall.de/"
;Name: "{group}\Webseiten\MD-Technologie"; Filename: "https://www.md-technologie.de/"
;Name: "{group}\Webseiten\ViaThinkSoft"; Filename: "https://www.viathinksoft.de/"
;Name: "{group}\Webseiten\Projektseite auf ViaThinkSoft"; Filename: "https://www.viathinksoft.de/index.php?page=projektanzeige&seite=projekt-21"
;Name: "{group}\DPG 2 Hilfe"; Filename: "{app}\Hilfe.exe"
Name: "{group}\Der Panzergeneral 2"; Filename: "{app}\DPG2.exe"
;Name: "{userdesktop}\Der Panzergeneral 2"; Filename: "{app}\DPG2.exe"; MinVersion: 4,4; Tasks: desktopicon
;Name: "{group}\Der Panzergeneral 2 deinstallieren"; Filename: "{uninstallexe}"

[Run]
Filename: "{app}\DPG2.exe"; Description: "Der Panzergeneral 2 starten"; Flags: nowait postinstall skipifsilent

[Code]
function InitializeSetup(): Boolean;
begin
  if CheckForMutexes('DPG15Setup')=false then
  begin
    Createmutex('DPG15Setup');
    Result := true;
  end
  else
  begin
    Result := False;
  end;
end;
