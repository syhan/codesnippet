@ECHO OFF

REM auto update HANA doc

SETLOCAL
SET HTTP_PROXY=proxy.wdf.sap.corp:8080
SET DOC_URL=http://help.sap.com/hana_platform


wget -m --accept=pdf --reject=txt -N --proxy=on -nd -np -l 1 %DOC_URL%

ECHO %DATE%%TIME% >> LAST_UPDATE

ENDLOCAL