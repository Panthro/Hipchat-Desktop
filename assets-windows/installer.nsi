!include "MUI2.nsh"

Name "Unofficial HipChat"
BrandingText "aluxian.com"

# set the icon
!define MUI_ICON "icon.ico"

# define the resulting installer's name:
OutFile "..\dist\UnofficialHipChatSetup.exe"

# set the installation directory
InstallDir "$PROGRAMFILES\Unofficial HipChat for Desktop\"

# app dialogs
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_INSTFILES

!define MUI_FINISHPAGE_RUN_TEXT "Start Unofficial HipChat"
!define MUI_FINISHPAGE_RUN "$INSTDIR\UnofficialHipChat.exe"

!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_LANGUAGE "English"

# default section start
Section

  # delete the installed files
  RMDir /r $INSTDIR

  # define the path to which the installer should install
  SetOutPath $INSTDIR

  # specify the files to go in the output path
  File /r ..\build\UnofficialHipChat\win32\*

  # create the uninstaller
  WriteUninstaller "$INSTDIR\Uninstall Unofficial HipChat for Desktop.exe"

  # create shortcuts in the start menu and on the desktop
  CreateShortCut "$SMPROGRAMS\Unofficial HipChat.lnk" "$INSTDIR\UnofficialHipChat.exe"
  CreateShortCut "$SMPROGRAMS\Uninstall Unofficial HipChat for Desktop.lnk" "$INSTDIR\Uninstall Unofficial HipChat for Desktop.exe"
  CreateShortCut "$DESKTOP\Unofficial HipChat.lnk" "$INSTDIR\UnofficialHipChat.exe"

SectionEnd

# create a section to define what the uninstaller does
Section "Uninstall"

  # delete the installed files
  RMDir /r $INSTDIR

  # delete the shortcuts
  Delete "$SMPROGRAMS\Unofficial HipChat.lnk"
  Delete "$SMPROGRAMS\Uninstall Unofficial HipChat for Desktop.lnk"
  Delete "$DESKTOP\Unofficial HipChat.lnk"

SectionEnd
