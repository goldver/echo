@echo off
echo.
echo ------------------------------------------------------------
echo ----                  Running Script                    ----
echo ------------------------------------------------------------
echo.

cd="C:\chef\my_configuration" 

::set HTTP_PROXY=http://proxy.wdf.sap.corp:8080

call chef-solo -c solo.rb -j solo.json -L c:\chef\chef.log -l info

IF %ERRORLEVEL% EQU 0 (
    ECHO Script was run successfully
) Else (
	ECHO Setup encountred an error
)
	
cmd /k ECHO Refer to setup log: c:\chef\chef.log

