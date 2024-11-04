; Biblioteca
!include "MUI2.nsh"
!include "x64.nsh"

; Geral
Name "Extrato Bancário 1.0.0"
OutFile "Instaladores\ExtratoBancario-1.0.0-x32.exe"
Unicode True
InstallDir "$LOCALAPPDATA\ExtratoBancario"
InstallDirRegKey HKCU "SOFTWARE\ExtratoBancario" ""
RequestExecutionLevel User

; Imagens
!define MUI_ICON "ExtratoBancario.ico" 
!define MUI_UNICON "ExtratoBancario.ico" 
;!define MUI_HEADERIMAGE
;!define MUI_HEADERIMAGE_RIGHT
;!define MUI_HEADERIMAGE_BITMAP "Imagens\InstallerHeader.bmp"
;!define MUI_WELCOMEFINISHPAGE_BITMAP "Imagens\InstallerBanner.bmp"
;!define MUI_HEADERIMAGE_UNBITMAP  "Imagens\UninstallerHeader.bmp"
;!define MUI_UNWELCOMEFINISHPAGE_BITMAP "Imagens\UninstallerBanner.bmp"

; Atalhos
!define MUI_FINISHPAGE_RUN
!define MUI_FINISHPAGE_RUN_TEXT "$(MUI_Shortcut)"
!define MUI_FINISHPAGE_RUN_FUNCTION "fnShortcut"
Function "fnShortcut"
	CreateShortCut "$DESKTOP\Extrato Bancário.lnk" "$INSTDIR\ExtratoBancario.exe"
FunctionEnd

; Interfaces
!define MUI_ABORTWARNING

; Pagina - Instalação
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

; Pagina - Desinstalação
!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

; Idioma
!insertmacro MUI_LANGUAGE "PortugueseBR"
Function .onInit
  !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

; Versão
VIProductVersion "1.0.0.0"
VIAddVersionKey "ProductName" "Extrato Bancário"
VIAddVersionKey "Comments" "Uma aplicação simples e eficiente para gestão de extratos bancários, permitindo adicionar, editar, remover e listar transações de crédito e débito."
VIAddVersionKey "CompanyName" "Isaac Caires / zrfisaac.github.io"
VIAddVersionKey "LegalTrademarks" "Isaac Caires / zrfisaac.github.io"
VIAddVersionKey "LegalCopyright" "Isaac Caires / zrfisaac.github.io"
VIAddVersionKey "FileDescription" "Controle de Extrato Bancário"
VIAddVersionKey "FileVersion" "1.0.0.0"
VIAddVersionKey "ProductVersion" "1.0.0.0"

; Tradução
LangString MUI_Shortcut ${LANG_PORTUGUESEBR} "Criar atalho na área de trabalho"

; # - Instalação
Section ExtratoBancario
	; Obrigatório
	SectionIn RO

	; Arquivos
	SetOutPath "$INSTDIR"
	File "Binarios\x32\Release\ExtratoBancario.exe"
	File "ExtratoBancario.ico"

	; Desinstalação
	WriteUninstaller "$INSTDIR\Uninstall.exe"

	; Atalhos
	CreateDirectory "$SMPROGRAMS\"
	CreateShortCut "$SMPROGRAMS\Extrato Bancário.lnk" "$INSTDIR\ExtratoBancario.exe" "" "$INSTDIR\ExtratoBancario.ico"

	; Painel de Controle
	WriteRegStr HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ExtratoBancario" "DisplayName" "Extrato Bancário 1.0.0.0 x32"
	WriteRegStr HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ExtratoBancario" "UninstallString" "$\"$INSTDIR\Uninstall.exe$\""
	WriteRegStr HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ExtratoBancario" "QuietUninstallString" "$\"$INSTDIR\Uninstall.exe$\" /S"
	WriteRegStr HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ExtratoBancario" "InstallLocation" "$\"$INSTDIR$\""
	WriteRegStr HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ExtratoBancario" "DisplayIcon" "$\"$INSTDIR\ExtratoBancario.ico$\""
	WriteRegStr HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ExtratoBancario" "Publisher" "Isaac Caires / zrfisaac.github.io"
	WriteRegStr HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ExtratoBancario" "DisplayVersion" "1.0.0.0"
	WriteRegDWORD HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ExtratoBancario" "VersionMajor" 1
	WriteRegDWORD HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ExtratoBancario" "VersionMinor" 0
	WriteRegDWORD HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ExtratoBancario" "NoModify" 0
	WriteRegDWORD HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ExtratoBancario" "NoRepair" 0
	WriteRegDWORD HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ExtratoBancario" "EstimatedSize" 4695 ;KB
	WriteRegStr HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ExtratoBancario" "HelpLink" "https://github.com/zrfisaac/ExtratoBancario"
	WriteRegStr HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ExtratoBancario" "URLInfoAbout" "https://github.com/zrfisaac/ExtratoBancario"
SectionEnd

; # - Desinstalação
Section Un.ExtratoBancario
	; Obrigatório
	SectionIn RO

	; Arquivos
	Delete "$INSTDIR\*.*"
	RMDir /r "$INSTDIR"

	; Atalhos
	Delete "$INSTDIR\Extrato Bancário.lnk"
	RMDir /r "$SMPROGRAMS\ExtratoBancario"

	; Registros
	DeleteRegKey HKCU "SOFTWARE\ExtratoBancario"
	DeleteRegKey HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ExtratoBancario"
SectionEnd
