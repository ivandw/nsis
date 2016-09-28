!define PRODUCT_NAME "instalacion_certificados"
!define PRODUCT_VERSION "1.0"
!define PRODUCT_PUBLISHER "ivan Molinari - Gestion de ambientes y Software"
!define PRODUCT_WEB_SITE "-"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\CAindiv.exe"

SetCompressor lzma

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "cert.exe"
InstallDir "$TEMP\cert"
Icon "${NSISDIR}\Contrib\Graphics\Icons\banking.ico"
SilentInstall silent

Section "Principal" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
  File "..\..\Desktop\til\RaizPrivadaG1.crt"
  File "..\..\Desktop\til\CAIndividuos.crt"
  File "..\..\Desktop\til\CAServicios.crt"
  File "..\..\Desktop\til\CAservicios.exe"
  File "..\..\Desktop\til\CAindiv.exe"
  File "..\..\Desktop\til\RaizPrivadaG1.exe"
  
  nsExec::ExecTolog "$INSTDIR\RaizPrivadaG1.exe"  # certutil -addstore root RaizPrivadaG1.crt
  nsExec::ExecTolog "$INSTDIR\CAindiv.exe"        # certutil -addstore "CA" CAindiv.crt
  nsExec::ExecTolog "$INSTDIR\CAServicios.exe"    # certutil -addstore "CA" CAServicios.crt

SectionEnd

Section -Post
rmdir /r "$INSTDIR"
SectionEnd
